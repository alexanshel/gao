<!DOCTYPE html>
<html>
<head>
  <title><g:layoutTitle default="Grails" /></title>
  <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
  <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
  <g:layoutHead />
  <r:require module="jquery"/>
  <r:require module="jquery-ui"/>
  <r:require module="bootstrap"/>
  <!-- JavaScript приложения -->
  <r:require module="gao"/>
  <r:layoutResources/>
</head>
<body>
  <div class="container">
    <sec:ifLoggedIn>
      <div id="menu" class="navbar navbar-inverse navbar-static-top" role="navigation">
        <div class="navbar-inner">
          <nav:primary scope="mainMenu"/>
          <!--  nav:secondary scope="mainMenu"/-->
        </div>
      </div>
    </sec:ifLoggedIn>
    <g:breadcrumb/>
    <g:layoutBody />
  </div>
  <r:layoutResources/>
</body>
</html>