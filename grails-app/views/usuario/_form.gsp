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
        <g:textField name="password" required="" value="${usuario?.password}" />
    </div>

</div>
