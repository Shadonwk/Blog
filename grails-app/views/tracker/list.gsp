
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <title><g:message code="tracker.list"/></title>
</head>

<body>
    <div id="actions-div">
    </div>

    <div id="main-div">
        <h1>Envíos recientes</h1>


        <g:if test="${flash.message}">
            <div class="alert alert-info">
                ${flash.message?.encodeAsHTML()}
            </div>
        </g:if>

        <div id="main-detail-div">
            <g:render template="list" model="${[lista:lista,total:total]}"/>
        </div>
    </div>

    <hr>


</body>
</html>
