<%@ page import="mx.com.robertoleon.blog.Comentario" %>
<div class="well sidebar-nav">
    <strong>Menu</strong>
    <ul class="nav nav-list">

      %{--<sec:ifLoggedIn>
          <li><a href="#entidades">Mi Blog</a></li>
      </sec:ifLoggedIn>--}%

      <li><g:link controller="blog" action="list"> Blog</g:link></li>
      <li><a href="#">Foros de discusión</a></li>
      <li><a href="#">Encuestas</a></li>


    </ul>
</div>

<div class="well sidebar-nav">
    <strong>Encuesta</strong>
    <ul class="nav nav-list">

        %{--<sec:ifLoggedIn>
            <li><a href="#entidades">Mi Blog</a></li>
        </sec:ifLoggedIn>--}%
        <li>Aqui aparecera la encuesta actual</li>


    </ul>
</div>

<div class="well sidebar-nav">
    <strong>Comentarios recientes</strong>
    <ul class="nav nav-list">

        <g:render template="/comentario/sideBarComentarios" model="[comentarios:Comentario.list()]"></g:render>
        <br>
    </ul>
</div>

<div class="well sidebar-nav">
    <strong>Usuarios</strong>
    <ul class="nav nav-list">

        %{--<sec:ifLoggedIn>
            <li><a href="#entidades">Mi Blog</a></li>
        </sec:ifLoggedIn>--}%

        <li>Estadisticas de usuarios en linea</li>


    </ul>
</div>