
<%@ page import="org.ash.gao.part.PartType" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'partType.label', default: 'PartType')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
    <r:require module="jsTree"/>
  </head>
  <body>
    <p class="btn-group">
      <g:link class="btn btn-primary" action="create">
        <i class="icon-plus-sign"></i><g:message code="location.new.label" />
      </g:link>
    </p>
    <div class="body">
      <g:if test="${flash.message}"><div class="message">${flash.message}</div></g:if>
      <div id="tree"></div>
      <g:treePrint 
        root="${partTypeInstanceRoot}"
        childsProp="childs"
        idProp="id" 
        nameProp="name" url="show?id="
      />
    </div>
    <div class="navbar navbar-fixed-bottom">
      <div class="navbar-inner">
        <a class="brand" href="#">Title</a>
        <ul class="nav">
          <li class="active"><a href="#">Home</a></li>
          <li><a href="#">Link</a></li>
          <li><a href="#">Link</a></li>
        </ul>
      </div>
</div>
  </body>
</html>
