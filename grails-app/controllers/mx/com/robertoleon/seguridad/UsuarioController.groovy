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

        if (!usuario.save(flush: true)) {
            render(view: "create", model: [anexo: usuario])
            return
        }

        //def temporal = new UsuarioRol(usuario: usuario, Rol.findByAuthority('ROLE_USER'))
        println "en busca del rol"   + Rol.findByAuthority('ROLE_USUARIO')
        UsuarioRol.create usuario, Rol.findByAuthority('ROLE_USUARIO'), true
        println "llega aqui"
        //println new UsuarioRol(usuario: usuario, rol: Rol.findByAuthority('ROLE_USER')).save(flush: true, insert: true)
        //temporal.save(flush: true)
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
