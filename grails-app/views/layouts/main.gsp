<html>
<head>
  <title><g:layoutTitle default="Grails" /></title>
  <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
  <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
  <g:layoutHead />
  <r:require module="jquery"/>
  <r:require module="jquery-ui"/>
  <r:layoutResources/>
</head>
<body>
  <div id="menu">
    <nav:primary/>
  </div>
  <g:layoutBody />
  <r:layoutResources/>
</body>
</html>