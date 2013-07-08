<script>

    $(function() {
        $('form').submit(function() {
            $(this).find('input[type="submit"]').attr('disabled', true);
        });
    });
</script>


<g:if test="${usuario?.imagen}">
    <table class="table table-striped table-bordered table-condensed table-hover">
        <tbody>
        <tr>
            <th><g:message code="archivo.nombreOriginal"/></th>
            <td><g:fieldValue bean="${usuario?.imagen}" field="nombreOriginal" /></td>
        </tr>
        <tr>
            <th><g:message code="archivo.tamanio"/></th>
            <td><g:formatNumber number="${usuario.imagen.tamanio}"/></td>
        </tr>
        %{--<tr>
            <th><g:message code="archivo.tipoArchivo"/></th>
            <td><g:fieldValue bean="${usuario.imagen}" field="tipoArchivo" /></td>
        </tr>--}%
        <tr>
            <img src="${link}" alt="${usuario?.imagen.nombreOriginal}" title="${usuario.imagen.nombreOriginal}" style="max-height: 200px; max-width: 200px;">
        </tr>
        </tbody>


    </table>

</g:if>
<g:else>

    <h3><g:message code="anexo.archivo.agregar"/></h3>

    <g:if test="${flash.messageImagen}">
        <div class="alert alert-info">
            ${flash.messageImagen}
        </div>
    </g:if>

    <g:uploadForm id="agregar-archivo" name="agregar-archivo"
                  url="[controller:'usuario',action:'guardarArchivo']" class="form-horizontal">

        <g:hiddenField name="sabanaId" value="${usuario?.id}"/>
        <div class="control-group">
            <label class="control-label" for="uploadedFile">
                <g:message code="archivo.uploadedFile"/> *
            </label>
            <div class="controls">
                <input type="file" name="uploadedFile"/>
            </div>
        </div>
        <g:submitButton name="create" class="btn" value="${message(code: 'accion.agregar')}" />

    </g:uploadForm>
</g:else>


