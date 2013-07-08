<div class="span3" align="center">
    <img src="${g.createLink(controller:'usuario',action:'descargarArchivo',id:usuario?.imagen?.id)}" alt="${usuario.imagen?.nombreOriginal}" title="${usuario.imagen?.nombreOriginal}" style="max-height: 200px; max-width: 200px;">
    <div class="clearfix"></div>
    ${usuario.username}
    ${usuario.reputacion}
</div>