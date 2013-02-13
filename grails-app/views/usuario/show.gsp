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

    <br><br>

    Felicidades <strong>${usuario.username}</strong> ahora puedes <g:link controller="login"
                                        action="auth"> iniciar sesión!!</g:link>

</div>

</body>
</html>
