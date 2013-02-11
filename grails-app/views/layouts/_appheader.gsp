<div class="navbar navbar-inverse navbar-fixed-top">
  <div class="navbar-inner">
    <div class="container-fluid">
      <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </a>
        <g:link class="brand" controller="blog" action="list"> Anelisse</g:link>
      <div class="nav-collapse collapse">

        <sec:ifLoggedIn>
            <div class="btn-group navbar-text pull-right">


                <a class="btn btn-primary" href="#"><i class="icon-user icon-white"></i><sec:username/></a>
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
          <li><g:link controller="blog" action="list">Blog</g:link></li>
          <li><a href="#">Foros de discusión</a></li>
          <li><a href="#">Encuestas</a></li>
          <li><g:link controller="usuario" action="list">Usuarios</g:link> </li>
          <li><a href="#">Acerca de Anelisse</a></li>

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
