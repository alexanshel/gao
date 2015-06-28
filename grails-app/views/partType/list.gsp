<%@ page import="org.ash.gao.part.PartType" %>
<html>
<head>
  <g:javascript library="jquery" plugin="jquery"/>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <g:set var="entityName" value="${message(code: 'partType.label', default: 'PartType')}"/>
  <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>

<div class="body">
  <h1><g:message code="partType.list.label" args="[entityName]"/></h1>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>

  <div class="list">
    <table class="table table-hover table-bordered">
      <thead>
        <tr>
          <g:sortableColumn property="id" title="${message(code: 'partType.id.label', default: 'Id')}"/>
          <g:sortableColumn property="name" title="${message(code: 'partType.name.label', default: 'Name')}"/>
          <th><g:message code="partType.kind.label" default="Kind"/></th>
        </tr>
      </thead>
      <tbody>
        <g:each in="${partTypeInstanceList}" status="i" var="partTypeInstance">
          <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
            <td><g:link action="show" id="${partTypeInstance.id}">${fieldValue(bean: partTypeInstance, field: "id")}</g:link></td>
            <td>${fieldValue(bean: partTypeInstance, field: "name")}</td>
            <td>${fieldValue(bean: partTypeInstance, field: "kind")}</td>
          </tr>
        </g:each>
      </tbody>
    </table>
  </div>

  <div class="paginateButtons">
    <g:paginate total="${partTypeInstanceTotal}"/>
  </div>
</div>
</body>
</html>
