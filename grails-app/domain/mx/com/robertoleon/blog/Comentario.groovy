package mx.com.robertoleon.blog

class Comentario {

    String titulo
    String descripcion
    static belongsTo  = [post:Post]

    static constraints = {
    }
}
