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

    <g:remoteLink update="detalle" controller="usuario" action="cuenta">Cuenta</g:remoteLink>
    |
    <g:remoteLink update="detalle" controller="usuario" action="perfil">Informacion personal</g:remoteLink>

    <div id="detalle"></div>
</div>



</body>
</html>
