package mx.com.robertoleon.blog

import mx.com.robertoleon.seguridad.Usuario

class Comentario {

    String titulo
    Usuario usuario
    String descripcion
    Date fechaCreacion
    static belongsTo  = [post:Post]

    static constraints = {
        titulo(blank: false)
        descripcion(blank: false)
    }
}
