package mx.com.robertoleon.seguridad

class Rol {

    String authority

    static mapping = {
        cache true
    }

    static constraints = {
        authority blank: false, unique: true
    }
}
