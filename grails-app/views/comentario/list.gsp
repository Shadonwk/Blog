
<%@ page import="mx.com.robertoleon.blog.Comentario" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'comentario.label', default: 'Comentario')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-comentario" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-comentario" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="descripcion" title="${message(code: 'comentario.descripcion.label', default: 'Descripcion')}" />
					
						<th><g:message code="comentario.post.label" default="Post" /></th>
					
						<g:sortableColumn property="titulo" title="${message(code: 'comentario.titulo.label', default: 'Titulo')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${comentarioInstanceList}" status="i" var="comentarioInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${comentarioInstance.id}">${fieldValue(bean: comentarioInstance, field: "descripcion")}</g:link></td>
					
						<td>${fieldValue(bean: comentarioInstance, field: "post")}</td>
					
						<td>${fieldValue(bean: comentarioInstance, field: "titulo")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${comentarioInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
