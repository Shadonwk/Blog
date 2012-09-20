package mx.com.robertoleon.seguridad

class UsuarioController {

    def index() { }

    def nuevoUsuario(){

    }

    def create(){
      [usuario: new Usuario()]
    }

    def save(){


        def usuario = new Usuario(params)

        if (!usuario.save(flush: true)) {
            render(view: "create", model: [anexo: usuario])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'anexo.label', default: 'Anexo'), usuario.id])
        redirect(action: "show", id: usuario.id)

    }

    def show(Long id) {
        def usuario = Usuario.get(id)
        if (!usuario) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'anexo.label', default: 'Anexo'), id])
            redirect(action: "list")
            return
        }

        [usuario: usuario]
    }
}
