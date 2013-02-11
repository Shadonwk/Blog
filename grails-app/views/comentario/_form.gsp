<%@ page import="mx.com.robertoleon.blog.Comentario" %>



<div class="fieldcontain ${hasErrors(bean: comentarioInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="comentario.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textField name="descripcion" value="${comentarioInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: comentarioInstance, field: 'post', 'error')} required">
	<label for="post">
		<g:message code="comentario.post.label" default="Post" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="post" name="post.id" from="${mx.com.robertoleon.blog.Post.list()}" optionKey="id" required="" value="${comentarioInstance?.post?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: comentarioInstance, field: 'titulo', 'error')} ">
	<label for="titulo">
		<g:message code="comentario.titulo.label" default="Titulo" />
		
	</label>
	<g:textField name="titulo" value="${comentarioInstance?.titulo}"/>
</div>

