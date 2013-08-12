package mx.com.robertoleon.blog

import mx.com.robertoleon.seguridad.Usuario

class Post {

    static hasMany = [comentarios:Comentario]

    String titulo
    Categoria categoria
    String resumen
    String descripcion
    Usuario dueno
    Date fechaCreacion
    Date lastUpdated
    Integer lecturas = 0
    Integer votos = 0

    static constraints = {
        descripcion(maxSize: 2000)
        resumen(maxSize: 2000)
    }

}
