<strong> Usuario:</strong> <sec:username/>
<br>
<div class="control-group">
    <div class="controls">
        <g:hiddenField name="idPost"value="${comentario?.post.id}"/>
    </div>
</div>
<div class="control-group">
    <label class="control-label" for="titulo"> Título *
    </label>
    <div class="controls">
        <g:textField name="titulo" required=""
                     value="${comentario?.titulo}" />
    </div>
</div>

<div class="control-group">
    <label class="control-label" for="descripcion"> Descripción *
    </label>
    <div class="controls">
        <g:textArea cols="20" rows="10" name="descripcion" required=""
                     value="${comentario?.descripcion}" />
    </div>
</div>


