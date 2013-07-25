<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <title><g:message code="categoria.create"/></title>
</head>

<body>
    <div id="actions-div">
        <g:link class="btn btn-mini" action="list"><g:message code="categoria.list"/></g:link>
    </div>

    <div id="main-div">
        <h1><g:message code="categoria.create"/></h1>

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

        <g:form action="save" class="form-horizontal">
            <g:render template="form" model="${[categoria: categoria]}"/>
            <g:submitButton name="create" class="btn" value="${message(code: 'estandar.button.create') }"/>
        </g:form>
    </div>
</body>
</html>