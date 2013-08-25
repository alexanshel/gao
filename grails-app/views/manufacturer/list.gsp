
<%@ page import="org.ash.gao.common.Manufacturer"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<g:set var="entityName"
  value="${message(code: 'manufacturer.label', default: 'Manufacturer')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
  <div class="btn-toolbar">
    <div class="btn-group">
      <g:link class="btn btn-primary" action="create">
        <i class="icon-plus-sign"></i><g:message code="manufacturer.new.label" />
      </g:link>
    </div>
  </div>
  <div class="body">
    <h3>${message(code: 'manufacturer.list.label')}</h3>
    <g:if test="${flash.message}">
      <div class="message">
        ${flash.message}
      </div>
    </g:if>
    <div class="list">
      <table>
        <thead>
          <tr>
            <g:sortableColumn property="name" title="${message(code: 'manufacturer.name.label', default: 'Name')}" />
          </tr>
        </thead>
        <tbody>
          <g:each in="${manufacturerInstanceList}" status="i"
            var="manufacturerInstance">
            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
              <td>
                <g:link action="edit" id="${manufacturerInstance.id}">
                  ${fieldValue(bean: manufacturerInstance, field: "name")}
                </g:link>
              </td>
            </tr>
          </g:each>
        </tbody>
      </table>
    </div>
    <div class="paginateButtons">
      <g:paginate total="${manufacturerInstanceTotal}" />
    </div>
  </div>
</body>
</html>
