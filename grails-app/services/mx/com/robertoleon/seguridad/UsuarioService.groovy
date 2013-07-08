package mx.com.robertoleon.seguridad

class UsuarioService {

    def archivoService

    /*
    * Agrega un Archivo a la sabana
    *
    * @param sabana La sabana a la cual se le agregará el archivo
    * @param file El archivo que se agregará.
    * @param descripcion Descripción del archivo
    * @param usuario Usuario que realiza la acción
    */
    def agregarArchivo(Usuario usuario, file) {
        // Guardamos el archivo
        def archivo = archivoService.guardarArchivo(file)
        usuario.imagen =  archivo
        usuario.save()
    }

}
