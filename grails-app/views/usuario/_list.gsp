
    <g:each in="${lista}" status="i" var="usuario">

            <g:render template="vistaPreviaUsuario" model="${[usuario:usuario]}"></g:render>

    </g:each>
