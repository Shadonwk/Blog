<!doctype html>
<html>
    <head>
        <meta name="layout" content="main">
        <title>Crear nuevo Post</title>
    </head>

    <body>
        <div id="main-div">

        <h3>Nuevo Post</h3>

        <g:if test="${flash.message}">
            <div class="alert alert-info">${flash.message?.encodeAsHTML()}</div>
        </g:if>

        <g:hasErrors bean="${post}">
            <div class="alert alert-error">
                <ul>
                    <g:eachError bean="${post}" var="error">
                        <li><g:message error="${post}"/></li>
                    </g:eachError>
                </ul>
            </div>
        </g:hasErrors>

        <g:form action="save">
            <g:render template="form"/>
            <g:submitButton name="create" class="btn btn-primary" value="Crear Post" />
        </g:form>


        </div>
    </body>
</html>
