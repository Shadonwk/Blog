
<g:if test="${post.comentarios}">
<g:each in="${post.comentarios.sort{it.id}}" status="i" var="comentario">

    <hr>
    <div class="span9"><h5>${comentario.titulo?.encodeAsHTML()}</h5></div>
    <div class="clearfix"></div>
    <div class="span9">Enviado por :${comentario.usuario?.username?.encodeAsHTML()} el ${comentario.fechaCreacion?.toLocaleString()}</div>
    <div class="clearfix"></div>
    <div class="span9">${comentario.descripcion?.encodeAsHTML()}<br><br></div>

    <br><br><br>
</g:each>
</g:if>
<g:else>No hay comentarios que mostrar</g:else>
<div id="nuevoComentario">
    <sec:ifLoggedIn>
        <g:render template="/comentario/create"/>
    </sec:ifLoggedIn>
    <sec:ifNotLoggedIn>
        <br><br><br>
        Debes ser usuario registrado para poder comentar,
        <g:link controller="login" action="auth"> inicia sessión</g:link>  ó
        <g:link controller="usuario" action="create">registrate aquí</g:link>
    </sec:ifNotLoggedIn>

</div>


