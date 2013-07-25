<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <title><g:message code="categoria.edit"/></title>
</head>

<body>
    <div id="actions-div">
        <g:link class="btn btn-mini" action="list"><g:message code="categoria.list"/></g:link>
        <g:link class="btn btn-mini" action="create"><g:message code="categoria.new"/></g:link>
    </div>

    <div id="main-div">
        <h1><g:message code="categoria.edit"/></h1>

        <g:if test="${flash.message}">
            <div class="alert alert-info">
                ${flash.message?.encodeAsHTML()}
            </div>
        </g:if>

        <g:hasErrors bean="${categoria}">
            <div class="alert alert-error">
                <ul>
                    <g:eachError bean="${categoria}" var="error">
                        <li><g:message error="${error}"/></li>
                    </g:eachError>
                </ul>
            </div>
        </g:hasErrors>

        <g:form class="form-horizontal" method="post" >
            <g:hiddenField name="id" value="${categoria?.id}" />
            <g:hiddenField name="version" value="${categoria?.version}" />

            <g:render template="form" model="${[categoria: categoria]}"/>

            <g:actionSubmit id="update"
                            class="btn"
                            action="update"
                            value="${message(code: 'estandar.button.update')}"/>

            <g:actionSubmit class="btn"
                            action="delete"
                            value="${message(code: 'estandar.button.delete')}"
                            formnovalidate=""
                            onclick="return confirm('${message(code: 'confirmacion.eliminar')}');" />
        </g:form>
    </div>
</body>
</html>