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
                    titulo :"Como utilizar el Bootstrap de twitter en Grails",
                    categoria : "Grails",
                    descripcion: "Twitter Bootstrap es una solución flexible que ofrece muchas más potencia que el CSS normal. Conseguimos una serie de características extras como las declaraciones anidadas, mixins, operaciones y funciones de color. Es fácil de implementar en el código tan sólo incluyendo la declaración en la cabecera y usar los componentes disponibles.\n" +
                            "La evolución de Bootstrap dentro de Twitter ha sido un trabajo constante para disponer de una herramienta que les permitiera escalar más fácilmente y mantener los proyectos que iban desarrollando. Al principio de todo cada ingeniero usaba cualquier librería con la que estuviera familiarizado lo que producía graves inconsistencias al intentar crecer. Por lo tanto Twitter Bootstrapes un gran ejemplo para todos los desarrolladores que trabajamos en compañías grandes en la que es necesario disponer de un framework uniforme para ir evolucionando.\n" +
                            "Podéis echar un vistazo a todo el código en la sección que dispone Twitter en GitHub. Allí comprobaréis todo lo los archivos que lo componen por separado:\n" +
                            "reset.css para eliminar los elementos innecesarios.\n" +
                            "Variables de color y preboot.less mixins para conseguir gradientes, transparencias y transiciones.\n" +
                            "scaffolding.less elementos básicos y globales para generación de grid, diseño estructural y las diferentes plantillas de páginas.\n" +
                            "type.less con estilos para el cuerpo de textos, listas y tipologías versátiles.\n" +
                            "pattern.less elementos para navegación, modales, paneles de advertencias…\n" +
                            "forms.less estilos para los campos de entrada, formularios y estados de validación.\n" +
                            "tables.less estilos para maquetar datos tabulados." ,
                    dueno: testAdmin ,
                    lecturas: 20,
                    votos: 28,
                    fechaCracion: new Date()

            ).save(failOnError: true)


            def postPrueba1 = new Post(
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
