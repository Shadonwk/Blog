package mx.com.robertoleon.seguridad.Usuario

import org.springframework.dao.DataIntegrityViolationException
import mx.com.robertoleon.seguridad.Archivo

class ArchivoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [archivoInstanceList: Archivo.list(params), archivoInstanceTotal: Archivo.count()]
    }

    def create() {
        [archivoInstance: new Archivo(params)]
    }

    def save() {
        def archivoInstance = new Archivo(params)
        if (!archivoInstance.save(flush: true)) {
            render(view: "create", model: [archivoInstance: archivoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'archivo.label', default: 'Archivo'), archivoInstance.id])
        redirect(action: "show", id: archivoInstance.id)
    }

    def show(Long id) {
        def archivoInstance = Archivo.get(id)
        if (!archivoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'archivo.label', default: 'Archivo'), id])
            redirect(action: "list")
            return
        }

        [archivoInstance: archivoInstance]
    }

    def edit(Long id) {
        def archivoInstance = Archivo.get(id)
        if (!archivoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'archivo.label', default: 'Archivo'), id])
            redirect(action: "list")
            return
        }

        [archivoInstance: archivoInstance]
    }

    def update(Long id, Long version) {
        def archivoInstance = Archivo.get(id)
        if (!archivoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'archivo.label', default: 'Archivo'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (archivoInstance.version > version) {
                archivoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'archivo.label', default: 'Archivo')] as Object[],
                          "Another user has updated this Archivo while you were editing")
                render(view: "edit", model: [archivoInstance: archivoInstance])
                return
            }
        }

        archivoInstance.properties = params

        if (!archivoInstance.save(flush: true)) {
            render(view: "edit", model: [archivoInstance: archivoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'archivo.label', default: 'Archivo'), archivoInstance.id])
        redirect(action: "show", id: archivoInstance.id)
    }

    def delete(Long id) {
        def archivoInstance = Archivo.get(id)
        if (!archivoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'archivo.label', default: 'Archivo'), id])
            redirect(action: "list")
            return
        }

        try {
            archivoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'archivo.label', default: 'Archivo'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'archivo.label', default: 'Archivo'), id])
            redirect(action: "show", id: id)
        }
    }
}
