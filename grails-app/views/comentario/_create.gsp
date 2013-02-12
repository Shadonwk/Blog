<h4>Comentario nuevo</h4>
<br>
<g:if test="${flash.message}">
    <div class="alert alert-info">${flash.message?.encodeAsHTML()}</div>
</g:if>

<g:form>
    <g:render template="/comentario/form"/>
    <g:submitToRemote value="Post" class="btn" update="nuevoComentario,comentarios"
                      url="[controller:'comentario', action:'save']"/>
</g:form>