package mx.com.robertoleon.seguridad


class Archivo implements Serializable {

    //String descripcion
    String nombreOriginal
    String extension
    Long tamanio
    String contentType

    // Propiedades de control
    Date dateCreated
    Date lastUpdated
    Date dateDeleted

    static constraints = {

        nombreOriginal()
        extension()
        tamanio(min:0L)
        contentType()
        dateCreated()
        lastUpdated()
        dateDeleted(nullable:true)
    }

    def getNombreOriginalTruncado() {
        nombreOriginal.size() > 30 ? nombreOriginal.substring(0, 29) + '...' : nombreOriginal
    }

    def getNombreArchivo() {
        extension ? "${id}.${extension}" : id
    }

}
