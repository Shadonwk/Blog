<%@ page import="org.joda.time.DateTime; org.joda.time.Period" %>

<g:if test="${comentarios}">
    <g:each in="${comentarios.sort{it.id}.reverse()}" status="i" var="comentario">
        <div><h5><g:link controller="post" action="show" id="${comentario.post.id}">${comentario.titulo.encodeAsHTML()}</g:link></h5></div>
        <div class="clearfix"></div>
        <div>hace: ${comentario.tiepoTranscurrido()}</div>
        <br>
    </g:each>
</g:if>
<g:else>No hay comentarios que mostrar</g:else>

