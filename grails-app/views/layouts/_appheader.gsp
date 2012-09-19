<div class="navbar navbar-inverse navbar-fixed-top">
  <div class="navbar-inner">
    <div class="container-fluid">
      <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </a>
      <a class="brand" href="#">Anelisse</a>
      <div class="nav-collapse collapse">
        <p class="navbar-text pull-right">
          Usuario <a href="#" class="navbar-link">Usuario</a>
        </p>
        <ul class="nav">
          <li><a href="#entidades">Inicio</a></li>
          <li><a href="#entidades">Blogs</a></li>
          <li><a href="#reportes">Foros de discusión</a></li>
          <li><a href="#graficas">Encuestas</a></li>
          <li><a href="#seguridad">Mi cuenta</a></li>
          <li><a href="#catalogos">Usuarios</a></li>
          <li><a href="#acerca">Acerca de Anelisse</a></li>

            <sec:ifLoggedIn>
                    <li><a href="#salir">Salir</a></li>
                    esta loggueado...
            </sec:ifLoggedIn>

            <sec:ifNotLoggedIn>
                <g:link controller='login' action='auth'>Login</g:link>
            </sec:ifNotLoggedIn>

        </ul>
      </div><!--/.nav-collapse -->
    </div>
  </div>
</div>
