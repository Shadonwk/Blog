import mx.com.robertoleon.seguridad.Usuario
import mx.com.robertoleon.seguridad.Rol
import mx.com.robertoleon.seguridad.UsuarioRol
import mx.com.robertoleon.blog.Post
import mx.com.robertoleon.blog.Comentario

class BootStrap {

    def init = { servletContext ->

        if (!Rol.count()){

            def rolAdmin = new Rol(authority: 'ROLE_ADMIN').save(failOnError: true)
            def rolUsuario = new Rol(authority: 'ROLE_USUARIO').save(failOnError: true)


            def testAdmin = new Usuario(
                  //  nombreCompleto:"J. Roberto León Cruz",
                    username:"admin",
                    password:"admin",
                   // correo: "rleon@sintelti.com.mx",
                  //  departamento: "sistemas",
                  //  nivelAcceso: "completo",

                    enabled:true,
                    votante: true,
                    reputacion: 30,
                  //  usuarioAlta:0,
                  //  fechaAlta:new Date(),
                    accountExpired:false,
                    accountLocked:false,
                    passwordExpired:false
            ).save(failOnError: true)

            def testUser = new Usuario(
                    //  nombreCompleto:"J. Roberto León Cruz",
                    username:"user",
                    password:"user",
                    // correo: "rleon@sintelti.com.mx",
                    //  departamento: "sistemas",
                    //  nivelAcceso: "completo",

                    enabled:true,
                    votante: false,
                    reputacion: 10,
                    //  usuarioAlta:0,
                    //  fechaAlta:new Date(),
                    accountExpired:false,
                    accountLocked:false,
                    passwordExpired:false
            ).save(failOnError: true)

            UsuarioRol.create testAdmin, rolAdmin, true
            UsuarioRol.create testAdmin, rolUsuario, true

            UsuarioRol.create testUser, rolUsuario, true



            def postPrueba = new Post(
                    titulo :"Post de prueba",
                    categoria : "Grails",
                    descripcion: """Este es una entrada al demo de prueba el cual puede ser editada o eliminada
                        desde el panel de control""",
                    dueno: testAdmin ,
                    lecturas: 20,
                    votos: 28,
                    fechaCracion: new Date()

            ).save(failOnError: true)

            def postPrueba2 = new Post(
                    titulo :"Post de prueba número 2",
                    categoria : "Grails",
                    descripcion: """En el siguiente tutorial mostraremos como se realiza la configuración de
                        Spring Security para Grails . . .""",
                    dueno: testAdmin ,
                    lecturas: 2,
                    votos: 4,
                    fechaCracion: new Date()

            ).save(failOnError: true)

        }

    }
    def destroy = {
    }
}
