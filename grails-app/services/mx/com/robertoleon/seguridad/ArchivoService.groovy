package mx.com.robertoleon.seguridad

import org.codehaus.groovy.grails.commons.ConfigurationHolder

class ArchivoService {

    boolean transactional = true
    def pathService

    def guardarArchivo(file) {

        // Configuracion para el almacenamiento de archivos
        def config = ConfigurationHolder.config.archivoService

        // Directorio base
        def baseDir = config.path
        if (!baseDir.endsWith('/')) {
            baseDir += "/"
        }

        // Anidamiento de directorios
        def nesting = config.nesting

        // Extensión del filename
        def fileExtension = pathService.fileExtension(file.originalFilename)

        // Guarda un registro en la base de datos
        def archivo = new Archivo()
        archivo.nombreOriginal = file.originalFilename
        archivo.extension = fileExtension.toLowerCase()
        archivo.tamanio = file.size
        archivo.contentType = file.contentType
        archivo.save(flush:true)
        // Directorio destino
        def dir = pathService.buildPath(baseDir, nesting, archivo.id)

        // Nombre del archivo
        def name = archivo.id
        if (!fileExtension.empty) {
            name += "." + fileExtension
        }

        // Mueve el archivo a su ubicación final
        def path = dir + "/" + name
        file.transferTo(new File(path))

        archivo
    }

    def obtenerFile(archivo) {

        // Configuracion para el almacenamiento de archivos
        def config = ConfigurationHolder.config.archivoService

        // Directorio base
        def baseDir = config.path
        if (!baseDir.endsWith('/')) {
            baseDir += "/"
        }

        // Anidamiento de directorios
        def nesting = config.nesting

        // Directorio destino
        def dir = pathService.buildPath(baseDir, nesting, archivo.id)

        // Nombre del archivo
        def name = archivo.id
        if (!archivo.extension.empty) {
            name += "." + archivo.extension
        }

        // Mueve el archivo a su ubicación final
        def path = dir + "/" + name
        def file = new File(path)

        file
    }
}
