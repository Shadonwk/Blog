<%--
  Created by IntelliJ IDEA.
  User: Quarksoft
  Date: 11/09/12
  Time: 12:53 PM
  To change this template use File | Settings | File Templates.
--%>

<head>
    <meta name='layout' content='mainSimple' />
    <title><g:message code="bienvenido"/></title>
</head>

<body>
<div class="hero-unit">

    <g:if test="${flash.message}">
        <div class="alert alert-info">${flash.message}</div>
    </g:if>

    <form action='${postUrl}' method='POST' id='loginForm' autocomplete='off'>
        <legend><g:message code="aplicacion.ingresar"/></legend>
        <div class="control-group">
            <label class="control-label" for='username'><g:message code="aplicacion.usuario"/>:</label>
            <div class="controls">
                <input type='text' name='j_username' id='username' placeholder="Usuario"/>
            </div>
        </div>
        <div class="control-group">
            <label class="control-label" for='password'><g:message code="aplicacion.password"/>:</label>
            <div class="controls">
                <input type='password' name='j_password' id='password' placeholder="Contraseña"/>
            </div>
        </div>
        <div class="control-group">
            <div class="controls">
                <button type='submit' class="btn btn-primary" id="submit"><g:message code="aplicacion.ingresar"/></button>
            </div>
        </div>
    </form>
</div>
</body>