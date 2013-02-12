
<%@ page import="mx.com.robertoleon.blog.Post" %>
<!doctype html>
<html xmlns="http://www.w3.org/1999/html">
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'post.label', default: 'Post')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>

    <div class="span9"><h1>${post.titulo?.encodeAsHTML()}</h1></div>
    <div class="span9">Enviado: ${post.fechaCracion.toLocaleString()?.encodeAsHTML()} en ${post.categoria.toString()?.encodeAsHTML()}<br><br><br></div>
    <div class="span9">${post.descripcion?.encodeAsHTML()}<br><br><br></div>
    <div class="clearfix"></div>
    <div class="span3">${post.lecturas} Lecturas &nbsp;&nbsp;&nbsp;&nbsp; ${post.votos} Votos</div>
    <div class="clearfix"></div>
    <br>
    <h4>Comentarios:</h4>
    <br>
    <div id="comentarios">
        <g:render template="/comentario/listComentarios" model="[post:post]"/>
    </div>
    <div id="nuevoComentario">
        <sec:ifLoggedIn>
                <g:render template="/comentario/create"/>
        </sec:ifLoggedIn>
        <sec:ifNotLoggedIn>
            <br><br><br>
            Debes ser usuario registrado para poder comentar,
            <g:link controller="usuario" action="create">registrate aquí</g:link>
        </sec:ifNotLoggedIn>

    </div>

	</body>
</html>
