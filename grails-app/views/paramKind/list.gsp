
<%@ page import="org.ash.gao.part.param.ParamKind" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'paramKind.label', default: 'ParamKind')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
  </head>
  <body>
    <div class="nav">
      <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
      <span class="menuButton"><g:link class="create" controller="paramKindString" action="create"><g:message code="paramKindString.new.label" args="[entityName]" /></g:link></span>
      <span class="menuButton"><g:link class="create" controller="paramKindNumber" action="create"><g:message code="paramKindNumber.new.label" args="[entityName]" /></g:link></span>
    </div>
    <div class="body">
      <h1><g:message code="default.list.label" args="[entityName]" /></h1>
      <g:if test="${flash.message}">
      <div class="message">${flash.message}</div>
      </g:if>
      <div class="list">
        <table>
          <thead>
            <tr>
              <g:sortableColumn property="id" title="${message(code: 'paramKind.id.label', default: 'Id')}" />
              <g:sortableColumn property="name" title="${message(code: 'paramKind.name.label', default: 'Name')}" />
              <g:sortableColumn property="class" title="${message(code: 'paramKind.class.label', default: 'Class')}" />
            </tr>
          </thead>
          <tbody>
          <g:each in="${paramKindInstanceList}" status="i" var="paramKindInstance">
            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
              <td><g:link action="show" id="${paramKindInstance.id}">${fieldValue(bean: paramKindInstance, field: "id")}</g:link></td>
              <td>${fieldValue(bean: paramKindInstance, field: "name")}</td>
              <td><g:message code="${paramKindInstance.class.name}.label" defaule="${paramKindInstance.class.name}"/></td>
            </tr>
          </g:each>
          </tbody>
        </table>
      </div>
      <div class="paginateButtons">
        <g:paginate total="${paramKindInstanceTotal}" />
      </div>
    </div>
  </body>
</html>
