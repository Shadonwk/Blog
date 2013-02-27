<div class="control-group">
    <label class="control-label" for="titulo">
        Titulo *
    </label>
    <div class="controls">
        <g:textField name="titulo" required="" value="${post?.titulo}"/>
    </div>
</div>

<div class="control-group">
    <label class="control-label" for="categoria">
        Categoria *
    </label>
    <div class="controls">
        <g:textField name="categoria" required="" value="${post?.categoria}"/>
    </div>
</div>

<div class="control-group">
    <label class="control-label" for="resumen">
        Resumen *
    </label>
    <div class="controls">
        <g:textArea name="resumen" required="" value="${post?.resumen}"/>
    </div>
</div>

<div class="control-group">
    <label class="control-label" for="descripcion">
        Descripción *
    </label>
    <div class="controls">
        <g:textArea name="descripcion" required="" value="${post?.descripcion}"/>
    </div>
</div>
