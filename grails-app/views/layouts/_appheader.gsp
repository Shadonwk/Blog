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
        <sec:ifLoggedIn>
            <div class="btn-group navbar-text pull-right">


                <a class="btn btn-primary" href="#"><i class="icon-user icon-white"></i> User</a>
                <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><a href="#"><i class="icon-pencil"></i> Edit</a></li>
                    <li><a href="#"><i class="icon-trash"></i> Delete</a></li>
                    <li><a href="#"><i class="icon-ban-circle"></i> Ban</a></li>
                    <li class="divider"></li>
                    <li><a href="#"><i class="i"></i> Make admin</a></li>
                </ul>


            </div>
        </sec:ifLoggedIn>
        <ul class="nav">
          <li><a href="#entidades">Inicio</a></li>
          <li><a href="#entidades">Blogs</a></li>
          <li><a href="#reportes">Foros de discusión</a></li>
          <li><a href="#graficas">Encuestas</a></li>
          <li><a href="#catalogos">Usuarios</a></li>
          <li><a href="#acerca">Acerca de Anelisse</a></li>

            <sec:ifLoggedIn>
                <li><g:link controller='logout' >Salir</g:link></li>
            </sec:ifLoggedIn>

            <sec:ifNotLoggedIn>
                <li><g:link controller='login' action='auth'>Login</g:link></li>
            </sec:ifNotLoggedIn>

        </ul>
      </div><!--/.nav-collapse -->
    </div>
  </div>
</div>
