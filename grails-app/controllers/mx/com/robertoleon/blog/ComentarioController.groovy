package mx.com.robertoleon.blog

import org.springframework.dao.DataIntegrityViolationException

class ComentarioController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def springSecurityService

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [comentarioInstanceList: Comentario.list(params), comentarioInstanceTotal: Comentario.count()]
    }

    def create() {
        [comentarioInstance: new Comentario(params)]
    }

    def save() {
        def comentario = new Comentario(params)
        def post = Post.get(params.idPost)
        comentario.post = post
        comentario.usuario = springSecurityService.currentUser
        comentario.fechaCreacion = new Date()
        if (!comentario.save(flush: true)) {
            flash.message= "Complete todos los campos"
            render(template: "create", model: [comentario:comentario])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'comentario.label', default: 'Comentario'), comentario.id])
        def nuevoComentario= new Comentario()
        nuevoComentario.post=post
        render(template: "create", model: [comentario:nuevoComentario])
    }

    def show(Long id) {
        def comentarioInstance = Comentario.get(id)
        if (!comentarioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'comentario.label', default: 'Comentario'), id])
            redirect(action: "list")
            return
        }

        [comentarioInstance: comentarioInstance]
    }

    def edit(Long id) {
        def comentarioInstance = Comentario.get(id)
        if (!comentarioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'comentario.label', default: 'Comentario'), id])
            redirect(action: "list")
            return
        }

        [comentarioInstance: comentarioInstance]
    }

    def update(Long id, Long version) {
        def comentarioInstance = Comentario.get(id)
        if (!comentarioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'comentario.label', default: 'Comentario'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (comentarioInstance.version > version) {
                comentarioInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'comentario.label', default: 'Comentario')] as Object[],
                        "Another user has updated this Comentario while you were editing")
                render(view: "edit", model: [comentarioInstance: comentarioInstance])
                return
            }
        }

        comentarioInstance.properties = params

        if (!comentarioInstance.save(flush: true)) {
            render(view: "edit", model: [comentarioInstance: comentarioInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'comentario.label', default: 'Comentario'), comentarioInstance.id])
        redirect(action: "show", id: comentarioInstance.id)
    }

    def delete(Long id) {
        def comentarioInstance = Comentario.get(id)
        if (!comentarioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'comentario.label', default: 'Comentario'), id])
            redirect(action: "list")
            return
        }

        try {
            comentarioInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'comentario.label', default: 'Comentario'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'comentario.label', default: 'Comentario'), id])
            redirect(action: "show", id: id)
        }
    }
}
