package mx.com.robertoleon.blog

class TrackerController {

    def index() {}

    def list(){


           def lista =  Post.list(max:params.max, offset:params.offset, sort:"fechaCreacion", order:"desc")

        def total = 0
      [lista:lista, total:total]
    }
}
