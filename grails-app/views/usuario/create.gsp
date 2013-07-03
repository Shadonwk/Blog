<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <title><g:message code="usuario.create"/></title>
</head>
<body>

<div id="main-div">
    <h1><g:message code="usuario.create"/></h1>

    <g:if test="${flash.message}">
        <div class="alert alert-info">${flash.message}</div>
    </g:if>

    <g:hasErrors bean="${usuario}">
        <div class="alert alert-error">
            <ul>
                <g:eachError bean="${usuario}" var="error">
                    <li><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
        </div>
    </g:hasErrors>

    <g:form action="save" class="form-horizontal">

        <g:render template="form"/>

        <g:submitButton name="create" class="btn btn-primary" value="${message(code: 'estandar.button.create')}" />
    </g:form>
</div>
</body>
</html>
