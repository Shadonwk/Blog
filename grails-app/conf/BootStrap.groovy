import mx.com.robertoleon.seguridad.Usuario
import mx.com.robertoleon.seguridad.Rol
import mx.com.robertoleon.seguridad.UsuarioRol

class BootStrap {

    def init = { servletContext ->

        if (!Rol.count()){

            def rolAdmin = new Rol(authority: 'ROLE_ADMIN').save(failOnError: true)
            def rolUsuario = new Rol(authority: 'ROLE_USUARIO').save(failOnError: true)


            def testUser = new Usuario(
                  //  nombreCompleto:"J. Roberto León Cruz",
                    username:"admin",
                    password:"admin",
                   // correo: "rleon@sintelti.com.mx",
                  //  departamento: "sistemas",
                  //  nivelAcceso: "completo",

                    enabled:true,
                  //  usuarioAlta:0,
                  //  fechaAlta:new Date(),
                    accountExpired:false,
                    accountLocked:false,
                    passwordExpired:false
            ).save(failOnError: true)

            UsuarioRol.create testUser, rolAdmin, true

        }

    }
    def destroy = {
    }
}
