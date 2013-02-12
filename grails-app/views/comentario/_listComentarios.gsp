

<g:each in="${post.comentarios}" status="i" var="comentario">

    <hr>
    <div class="span9"><h5>${comentario.titulo?.encodeAsHTML()}</h5></div>
    <div class="clearfix"></div>
    <div class="span9">Enviado por :${comentario.usuario?.username?.encodeAsHTML()} el ${comentario.fechaCreacion?.toLocaleString()}</div>
    <div class="clearfix"></div>
    <div class="span9">${comentario.descripcion?.encodeAsHTML()}<br><br></div>

    <br><br><br>
</g:each>


