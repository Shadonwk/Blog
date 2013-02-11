<%@ page import="mx.com.robertoleon.Blog" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'blog.label', default: 'Blog')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>




    <h1>Bienvenido a Anelisse</h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>


        <hr>

        <g:each in="${posts}" status="i" var="post">
            <div class="span9"><h3><g:link controller="post" action="show" id="${post.id}">${post.titulo?.encodeAsHTML()}</g:link></h3></div>
            <div class="span9">Enviado: ${post.fechaCracion.toLocaleString()?.encodeAsHTML()} en ${post.categoria.toString()?.encodeAsHTML()}<br></div>
            <div class="span9">${post.descripcion?.encodeAsHTML()}<br><br></div>
            <div class="clearfix"></div>
            <div class="span2">${post.comentarios.size()} Comentarios</div>
            <div class="span2">${post.lecturas} Lecturas</div>
            <div class="span2">${post.votos} Votos</div>
            <div class="span3"><g:link controller="post" action="show" id="${post.id}">Leer más...</g:link></div>
            <br><br><br>
        </g:each>





        %{--<table class="span9">
            <tbody>
            <g:each in="${posts}" status="i" var="post">
                <tr>
                    <table class="span9">
                        <tr><td colspan="4"><h3><g:link controller="post" action="show" id="${post.id}">${post.titulo?.encodeAsHTML()}</g:link></h3></td></tr>
                        <tr><td colspan="4">Enviado: ${post.fechaCracion.toLocaleString()?.encodeAsHTML()} en ${post.categoria.toString()?.encodeAsHTML()}</td></tr>
                        <tr><td><br/></td> </tr>
                        <tr><td colspan="4">${post.descripcion?.encodeAsHTML()}</td></tr>
                        <tr>
                            <td >${post.comentarios.size()} Comentarios</td>
                            <td >${post.lecturas} Lecturas</td>
                            <td >${post.votos} Votos</td>
                            <td ><g:link controller="post" action="show" id="${post.id}">Leer más...</g:link></td>
                        </tr>
                    </table>
                </tr>
            </g:each>
            </tbody>
        </table>


        <div class="pagination" >
            <util:remotePaginate update="listQueryResults" total="${postTotal}" params="${params}"
                                 action="buscar" max="10" />

        </div>
    </g:else>--}%




</body>
</html>
