package mx.com.robertoleon.seguridad

class UsuarioController {

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [usuarioList: Usuario.list(params), usuarioTotal: Usuario.count()]
    }


    def nuevoUsuario(){

    }

    def create(){
      [usuario: new Usuario()]
    }

    def save(){
        def usuario = new Usuario(params)
        usuario.fechaAlta = new Date()
        if (!usuario.save()) {
            render(view: "create", model: [usuario: usuario])
            return
        }

        UsuarioRol.create usuario, Rol.findByAuthority('ROLE_USUARIO'), true
        flash.message = message(code: 'default.created.message', args: [message(code: 'usuario.label', default: 'Usuario'), usuario.id])
        redirect(action: "show", id: usuario.id)
    }

    def show(Long id) {
        def usuario = Usuario.get(id)
        if (!usuario) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), id])
            redirect(action: "list")
            return
        }
        [usuario: usuario]
    }

    def perfil(Long id){
        def usuario = Usuario.get(id)
        if (!usuario) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), id])
            redirect(action: "list")
            return
        }
        [usuario: usuario]

    }
}
