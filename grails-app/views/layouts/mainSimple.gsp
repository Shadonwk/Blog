<!doctype html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><g:layoutTitle default="SIAGECI"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- styles -->
    <style type="text/css">
    body {
        padding-top: 60px;
        padding-bottom: 40px;
    }
    .sidebar-nav {
        padding: 9px 0;
    }
    </style>

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
     <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
   <![endif]-->

    <!-- fav and touch icons -->
    <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
    <link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
    <link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
    <!-- link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css" -->
    <!-- link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css" -->

    <g:layoutHead/>
    <g:javascript library="jquery"/>
    <r:require modules="bootstrap-responsive-css,jquery-ui"/>
    <r:layoutResources />
</head>
<body>
<g:render template="/layouts/appheaderSimple"/>

<div class="container-fluid">
    <div class="row-fluid">
        <div class="span3">
            <g:render template="/layouts/sidebar"/>
        </div>
        <div class="span9">
            <g:layoutBody />
        </div>
    </div>

    <hr>

    <g:render template="/layouts/footer"/>

</div>

<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>

<g:javascript library="application"/>
<r:layoutResources />
</body>
</html>
