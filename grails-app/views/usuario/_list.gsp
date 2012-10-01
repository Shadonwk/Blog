<table class="table table-striped table-bordered table-condensed table-hover">
    <thead>
    <tr>
        <g:sortableColumn property="id" title="${message(code: 'usuario.id')}"/>
        <g:sortableColumn property="username" title="${message(code: 'usuario.username')}"/>
        <g:sortableColumn property="password" title="${message(code: 'usuario.password')}"/>
        <g:sortableColumn property="enabled" title="${message(code: 'usuario.enabled')}"/>

    </tr>
    </thead>
    <tbody>
    <g:each in="${lista}" status="i" var="usuario">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
            <!--g:if test="$//{anexo.dateDeleted==null}"-->

                <td><g:link action="show" id="${usuario.id}">${usuario.id}</g:link></td>
                <td>${fieldValue(bean: usuario, field: "username")}</td>
                <td>${fieldValue(bean: usuario, field: "password")}</td>
                <td>${fieldValue(bean: usuario, field: "enabled")}</td>
                <!--td><//g:formatDate date="$//{usuario.dateCreated}"/></td-->

            <!--/g:if-->
        </tr>
    </g:each>
    </tbody>
</table>
<div class="pagination pagination-centered">
    <g:paginate total="${total}"/>
</div>
