package mx.com.robertoleon.blog



import org.junit.*
import grails.test.mixin.*

@TestFor(ComentarioController)
@Mock(Comentario)
class ComentarioControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/comentario/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.comentarioInstanceList.size() == 0
        assert model.comentarioInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.comentarioInstance != null
    }

    void testSave() {
        controller.save()

        assert model.comentarioInstance != null
        assert view == '/comentario/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/comentario/show/1'
        assert controller.flash.message != null
        assert Comentario.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/comentario/list'

        populateValidParams(params)
        def comentario = new Comentario(params)

        assert comentario.save() != null

        params.id = comentario.id

        def model = controller.show()

        assert model.comentarioInstance == comentario
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/comentario/list'

        populateValidParams(params)
        def comentario = new Comentario(params)

        assert comentario.save() != null

        params.id = comentario.id

        def model = controller.edit()

        assert model.comentarioInstance == comentario
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/comentario/list'

        response.reset()

        populateValidParams(params)
        def comentario = new Comentario(params)

        assert comentario.save() != null

        // test invalid parameters in update
        params.id = comentario.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/comentario/edit"
        assert model.comentarioInstance != null

        comentario.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/comentario/show/$comentario.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        comentario.clearErrors()

        populateValidParams(params)
        params.id = comentario.id
        params.version = -1
        controller.update()

        assert view == "/comentario/edit"
        assert model.comentarioInstance != null
        assert model.comentarioInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/comentario/list'

        response.reset()

        populateValidParams(params)
        def comentario = new Comentario(params)

        assert comentario.save() != null
        assert Comentario.count() == 1

        params.id = comentario.id

        controller.delete()

        assert Comentario.count() == 0
        assert Comentario.get(comentario.id) == null
        assert response.redirectedUrl == '/comentario/list'
    }
}
