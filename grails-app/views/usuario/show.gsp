<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <title><g:message code="usuario.show"/></title>
</head>
<body>

<div id="main-div">
    <h1><g:message code="usuario.show"/></h1>
    <g:if test="${flash.message}">
        <div class="alert alert-info">${flash.message}</div>
    </g:if>


        <g:render template="show" model="${[usuario:usuario]}"/>

    Felicidades ahora puedes iniciar sesión!!
    %{--<g:form>
        <fieldset class="buttons">
            <g:hiddenField name="id" value="${usuario?.id}" />
            <g:link class="btn btn-primary" action="edit" id="${usuario?.id}"><g:message code="default.button.edit"/></g:link>
            <g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
        </fieldset>
    </g:form>--}%
</div>

</body>
</html>
