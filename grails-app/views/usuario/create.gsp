<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <title><g:message code="anexo.create"/></title>
</head>
<body>
<div id="actions-div">
    <g:link class="btn btn-mini" action="list"><g:message code="anexo.list"/></g:link>
</div>

<div id="main-div">
    <h1><g:message code="anexo.create"/></h1>

    <g:if test="${flash.message}">
        <div class="alert alert-info">${flash.message}</div>
    </g:if>

    <g:hasErrors bean="${usuario}">
        <div class="alert alert-error">
            <ul>
                <g:eachError bean="${usuario}" var="error">
                    <li><g:message error="${usuario}"/></li>
                </g:eachError>
            </ul>
        </div>
    </g:hasErrors>

    <g:form action="save" class="form-horizontal">

        <g:render template="form"/>

        <g:submitButton name="create" class="btn btn-primary" value="${message(code: 'default.button.create')}" />
    </g:form>
</div>
</body>
</html>
