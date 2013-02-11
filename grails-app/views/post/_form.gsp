<%@ page import="mx.com.robertoleon.blog.Post" %>



<div class="fieldcontain ${hasErrors(bean: postInstance, field: 'categoria', 'error')} ">
	<label for="categoria">
		<g:message code="post.categoria.label" default="Categoria" />
		
	</label>
	<g:textField name="categoria" value="${postInstance?.categoria}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: postInstance, field: 'comentarios', 'error')} ">
	<label for="comentarios">
		<g:message code="post.comentarios.label" default="Comentarios" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${postInstance?.comentarios?}" var="c">
    <li><g:link controller="comentario" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="comentario" action="create" params="['post.id': postInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'comentario.label', default: 'Comentario')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: postInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="post.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textField name="descripcion" value="${postInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: postInstance, field: 'dueno', 'error')} required">
	<label for="dueno">
		<g:message code="post.dueno.label" default="Dueno" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="dueno" name="dueno.id" from="${mx.com.robertoleon.seguridad.Usuario.list()}" optionKey="id" required="" value="${postInstance?.dueno?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: postInstance, field: 'fechaCracion', 'error')} required">
	<label for="fechaCracion">
		<g:message code="post.fechaCracion.label" default="Fecha Cracion" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaCracion" precision="day"  value="${postInstance?.fechaCracion}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: postInstance, field: 'titulo', 'error')} ">
	<label for="titulo">
		<g:message code="post.titulo.label" default="Titulo" />
		
	</label>
	<g:textField name="titulo" value="${postInstance?.titulo}"/>
</div>

