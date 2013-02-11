<g:if test="${!post}">
    <div class="alert alert-info">
        ${message(code: 'busquedaTelefonia.sinResultados')}
    </div>
</g:if>
<g:else>
    <hr>

    <p class="pull-right">Se encontraron <strong>${postTotal}</strong> resultados en la búsqueda solicitada</p>

    <table class="table table-striped table-bordered table-condensed table-hover">
        <tbody>
        <g:each in="${post}" status="i" var="sabana">
            <tr>
                <table class="table table-striped table-bordered table-condensed table-hover">
                    <tr>
                        <th class="span2">${message(code: 'busquedaTelefonia.nombre')}</th>
                        <td class="span5"><g:link controller="comunicacionImport" action="show" id="${post.id}">${post.titulo?.encodeAsHTML()}</g:link></td>
                        <th class="span1">Origen</th>
                        <td class="span1">Telefonia</td>
                    </tr>
                    <tr><th>${message(code: 'busquedaTelefonia.tipoFuente')}</th><td colspan="3">Estructurada</td></tr>
                    <tr><th>${message(code: 'busquedaTelefonia.encontradoEn')}</th><td colspan="3">${post.categoria.toString()?.encodeAsHTML()}</td></tr>
                    <tr><th>${message(code: 'busquedaTelefonia.fecha')}</th><td colspan="3">${post.descripcion?.encodeAsHTML()}</td></tr>
                </table>
            </tr>
        </g:each>
        </tbody>
    </table>


    <div class="pagination" >
        <util:remotePaginate update="listQueryResults" total="${postTotal}" params="${params}"
                             action="buscar" max="10" />

    </div>
</g:else>