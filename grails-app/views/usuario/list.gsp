<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <title><g:message code="usuario.list"/></title>
</head>
<body>
<div id="main-div">
    <h1><g:message code="usuario.list"/></h1>
    <g:if test="${flash.message}">
        <div class="alert alert-info">${flash.message}</div>
    </g:if>

    <g:render template="list" model="${[lista:usuarioList,total:usuarioTotal]}"/>
</div>

<hr>

</body>
</html>
