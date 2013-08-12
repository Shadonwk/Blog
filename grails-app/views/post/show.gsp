
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
    <div class="span9">Enviado por: ${post.dueno?.encodeAsHTML()} el ${post.fechaCreacion.toLocaleString()?.encodeAsHTML()} en ${post.categoria.toString()?.encodeAsHTML()}<br><br><br></div>
    <div class="span9">${post.descripcion}<br><br><br></div>
    <div class="clearfix"></div>
    <div class="span3">${post.lecturas} Lecturas &nbsp;&nbsp;&nbsp;&nbsp; ${post.votos} Votos</div>
    <div class="clearfix"></div>
    <br>
    <h4>Comentarios:</h4>
    <br>

    <div id="comentarios">
        <g:render template="/comentario/listComentarios" model="[post:post]"/>
    </div>



	</body>
</html>
