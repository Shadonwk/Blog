package mx.com.robertoleon.seguridad

import org.codehaus.groovy.grails.commons.ConfigurationHolder

class UsuarioController {

    def usuarioService
    def fileUploadService  = new mx.com.robertoleon.helper.FileuploadService()
    def archivoService

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
       /* if (!usuario) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), id])
            redirect(action: "list")
            return
        }*/
        render (template: 'perfil', model: [usuario:usuario])

    }

    def miCuenta(Long id){
        println id
    }

    def descargarArchivo(Long id) {



        def archivo = Archivo.get(id)
        def file = null

        if (!archivo) {
            //si aún no tiene una imagen de perfil poner la default

            // Configuracion para el almacenamiento de archivos
            def config = ConfigurationHolder.config.archivoService
            // Directorio base
            def baseDir = config.path
            baseDir += "/"
            file = new File(baseDir + "default.jpg")
            response.contentType = "image/jpeg"
            response.contentLength = file.length()
            response.setHeader("Content-disposition", /attachment; filename=default.jpg/)
            response.outputStream << file.bytes
            response.outputStream.flush()
            return
        }

        file = archivoService.obtenerFile(archivo)

        if (file.exists()) {
            response.contentType = archivo.contentType
            response.contentLength = file.length()
            response.setHeader("Content-disposition", /attachment; filename="${archivo.nombreOriginal}"/)
            response.outputStream << file.bytes
            response.outputStream.flush()
        }
    }

    def cuenta(){

        def usuario = authenticatedUser
        def link = g.createLink(controller:'usuario',action:'descargarArchivo',id:usuario?.imagen?.id)
        render template: 'cuenta', model: [usuario: usuario, link:link]

    }


    def guardarArchivo(Long usuarioId) {

        def usuario = authenticatedUser

        if (!usuario) {
            render(template: "/accesoNoPermitido")
            return
        }

        // Archivo requerido
        def file = request.getFile('uploadedFile')
        if (!file || file.size == 0) {
            flash.messageImagen = message(code: 'archivo.uploadedFile.required')
            render(template: "cargaImagenPerfil", model: [sabanaComunicacion:sabana,fileDescription:fileDescription])
            return
        }

        // Valida archivo
        if (!fileUploadService.validateFile("imagen", file)) {
            flash.messageImagen = message(code: 'archivo.uploadedFile.invalid')
            render(template: "cargaImagenPerfil", model: [usuario:usuario])
            return
        }

        // Se agrega el archivo al anexo
        try {
            usuarioService.agregarArchivo(usuario, file)


            flash.archivosSabanaComunicacion = message(code: 'anexo.archivo.agregado', args: [file.originalFilename])
            render(template: 'cargaImagenPerfil', model: [usuario: usuario])
        } catch (e) {
            log.error(e)
            flash.archivosSabanaComunicacion = message(code: 'anexo.archivo.no.agregado', args: [file.originalFilename])
            render(template: "cargaImagenPerfil", model: [usuario: usuario])
        }
    }

    def eliminarArchivo(){
        def sabanaId = params.sabanaId
        def archivoId = params.archivoId
        def sabana = SabanaComunicacion.get(sabanaId)
        def archivo = Archivo.get(archivoId)
        log.info "Eliminando el archivo de la sabana ${sabanaId}"
        archivo.dateDeleted = new Date()
        archivo.save()
        sabana.estatusArchivo = null
        sabana.archivo = null
        sabana.save()
        render(template: 'cargaArchivoComunicaciones', model: [sabanaComunicacion: sabana])
    }
}
