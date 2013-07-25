<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <title><g:message code="categoria.list"/></title>
</head>
<body>

<div id="actions-div" class="row">
    <div class="span5">
        <g:link class="btn btn-mini" action="create"><g:message code="categoria.new"/></g:link>
    </div>
</div>

<div id="main-div">
    <h1><g:message code="categoria.list"/></h1>

    <g:if test="${flash.message}">
        <div class="alert alert-info">
            ${flash.message?.encodeAsHTML()}
        </div>
    </g:if>

    <div id="main-detail-div">
        <g:render template="list" model="${[lista: lista]}"/>
    </div>
</div>

<hr>


</body>
</html>
