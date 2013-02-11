package mx.com.robertoleon.blog

import mx.com.robertoleon.seguridad.Usuario

class Post {

    static hasMany = [comentarios:Comentario]

    String titulo
    String categoria
    String descripcion
    Usuario dueno
    Date fechaCracion
    Integer lecturas = 0
    Integer votos = 0

    static constraints = {


    }
}
