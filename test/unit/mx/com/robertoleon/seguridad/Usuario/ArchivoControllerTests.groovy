package mx.com.robertoleon.seguridad.Usuario

import grails.test.mixin.*
import mx.com.robertoleon.seguridad.Archivo

@TestFor(ArchivoController)
@Mock(Archivo)
class ArchivoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/archivo/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.archivoInstanceList.size() == 0
        assert model.archivoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.archivoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.archivoInstance != null
        assert view == '/archivo/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/archivo/show/1'
        assert controller.flash.message != null
        assert Archivo.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/archivo/list'

        populateValidParams(params)
        def archivo = new Archivo(params)

        assert archivo.save() != null

        params.id = archivo.id

        def model = controller.show()

        assert model.archivoInstance == archivo
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/archivo/list'

        populateValidParams(params)
        def archivo = new Archivo(params)

        assert archivo.save() != null

        params.id = archivo.id

        def model = controller.edit()

        assert model.archivoInstance == archivo
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/archivo/list'

        response.reset()

        populateValidParams(params)
        def archivo = new Archivo(params)

        assert archivo.save() != null

        // test invalid parameters in update
        params.id = archivo.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/archivo/edit"
        assert model.archivoInstance != null

        archivo.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/archivo/show/$archivo.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        archivo.clearErrors()

        populateValidParams(params)
        params.id = archivo.id
        params.version = -1
        controller.update()

        assert view == "/archivo/edit"
        assert model.archivoInstance != null
        assert model.archivoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/archivo/list'

        response.reset()

        populateValidParams(params)
        def archivo = new Archivo(params)

        assert archivo.save() != null
        assert Archivo.count() == 1

        params.id = archivo.id

        controller.delete()

        assert Archivo.count() == 0
        assert Archivo.get(archivo.id) == null
        assert response.redirectedUrl == '/archivo/list'
    }
}
