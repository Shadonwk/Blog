
<%@ page import="mx.com.robertoleon.blog.Post" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'post.label', default: 'Post')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-post" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-post" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="categoria" title="${message(code: 'post.categoria.label', default: 'Categoria')}" />
					
						<g:sortableColumn property="descripcion" title="${message(code: 'post.descripcion.label', default: 'Descripcion')}" />
					
						<th><g:message code="post.dueno.label" default="Dueno" /></th>
					
						<g:sortableColumn property="fechaCracion" title="${message(code: 'post.fechaCreacion.label', default: 'Fecha Cracion')}" />
					
						<g:sortableColumn property="titulo" title="${message(code: 'post.titulo.label', default: 'Titulo')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${postInstanceList}" status="i" var="postInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${postInstance.id}">${fieldValue(bean: postInstance, field: "categoria")}</g:link></td>
					
						<td>${fieldValue(bean: postInstance, field: "descripcion")}</td>
					
						<td>${fieldValue(bean: postInstance, field: "dueno")}</td>
					
						<td><g:formatDate date="${postInstance.fechaCreacion}" /></td>
					
						<td>${fieldValue(bean: postInstance, field: "titulo")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${postInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
