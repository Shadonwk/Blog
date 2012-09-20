package mx.com.robertoleon.blog

import mx.com.robertoleon.seguridad.Usuario

class Post {

    String titulo
    String categoria
    String descripcion
    Usuario dueno
    Date fechaCracion
    List<Comentario> comentarios

    static constraints = {
    }
}
