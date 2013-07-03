<div class="control-group">

    <label class="control-label" for="username">
        <g:message code="usuario.username"/> *
    </label>

    <div class="controls">
        <g:textField name="username" required="" value="${usuario?.username}" />
    </div>

</div>

<div class="control-group">

    <label class="control-label" for="password">
        <g:message code="usuario.password"/> *
    </label>

    <div class="controls">
        <g:passwordField name="password" required="" value="${usuario?.password}" />
    </div>

</div>

<div class="control-group">

    <label class="control-label" for="email">
        <g:message code="usuario.email"/> *
    </label>

    <div class="controls">
        <g:textField name="email" required="" value="${usuario?.email}" />
    </div>

</div>
