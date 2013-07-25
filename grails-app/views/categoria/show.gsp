<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <title><g:message code="categoria.show"/></title>
</head>

<body>
    <div id="actions-div">
        <g:link class="btn btn-mini" action="list"><g:message code="categoria.list"/></g:link>
        <g:link class="btn btn-mini" action="create"><g:message code="categoria.new"/></g:link>
    </div>

    <div id="main-div">
        <h1><g:message code="categoria.show"/></h1>

        <g:if test="${flash.message}">
            <div class="alert alert-info">
                ${flash.message?.encodeAsHTML()}
            </div>
        </g:if>

        <g:render template="show" model="${[categoria: categoria]}"/>

        <g:form>
            <g:hiddenField name="id" value="${categoria?.id}" />
            <g:link class="btn" action="edit" id="${categoria?.id}"><g:message code="estandar.button.edit"/></g:link>
            <g:actionSubmit id="delete" class="btn" action="delete" value="${message(code: 'estandar.button.delete')}" onclick="return confirm('${message(code: 'confirmacion.eliminar')}');"/>
        </g:form>
    </div>
</body>
</html>