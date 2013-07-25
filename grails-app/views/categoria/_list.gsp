<g:if test="${lista.empty}">
    <g:render template="/noHayInformacion"/>
</g:if>
<g:else>
    <table class="table table-striped table-bordered table-condensed table-hover">
        <thead>
        <tr>
            <th>${message(code: 'categoria.id')}</th>
            <th>${message(code: 'categoria.nombre')}</th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${lista}" var="categoria">
            <tr>
                <td><g:link action="show" id="${categoria.id}">${categoria.id}</g:link></td>
                <td><g:fieldValue bean="${categoria}" field="nombre" /></td>
            </tr>
        </g:each>
        </tbody>
    </table>
</g:else>