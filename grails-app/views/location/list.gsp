
<%@ page import="org.ash.gao.part.Location"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<g:set var="entityName"
  value="${message(code: 'location.label', default: 'Location')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
  <p>
    <g:autocomplete
      keyName=   "location.id"
      valueName= "location.name"
      action=    "autoCompleteJSON"
      controller="location"
      showClear= "false"
    />
  </p>
  <p class="btn-group">
    <g:link class="btn btn-primary" action="create">
      <i class="icon-plus-sign"></i><g:message code="location.new.label" />
    </g:link>
  </p>
  <div class="body">
    <g:if test="${flash.message}"><div class="message">${flash.message}</div></g:if>
    <div class="list">
      <table class="table-bordered">
        <thead>
          <tr>
            <g:sortableColumn property="name"
              title="${message(code: 'location.name.label', default: 'Name')}" />
            <th><g:message code="location.parent.label"
                default="Parent" /></th>
            <g:sortableColumn property="url"
              title="${message(code: 'location.url.label', default: 'Url')}" />
          </tr>
        </thead>
        <tbody>
          <g:each in="${locationInstanceList}" status="i"
            var="locationInstance">
            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
              <td>
                <g:link action="show" id="${locationInstance.id}">
                  ${fieldValue(bean: locationInstance, field: "name")}
                </g:link>
              </td>
              <td>
                ${fieldValue(bean: locationInstance, field: "parent")}
              </td>
              <td>
                ${fieldValue(bean: locationInstance, field: "url")}
              </td>
            </tr>
          </g:each>
        </tbody>
      </table>
    </div>
    <div class="paginateButtons">
      <g:paginate total="${locationInstanceTotal}" />
    </div>
  </div>
</body>
</html>
