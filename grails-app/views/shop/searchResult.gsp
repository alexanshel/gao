<%@ page import="org.ash.gao.part.Part"%>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <g:set var="entityName" value="${message(code: 'part.label', default: 'Part')}"/>
  <title><g:message code="default.list.label" args="[entityName]"/></title>
  <gui:resources components='autoComplete'/>
</head>
<body>
  <div class="body">
    <div class="filter-params">
    </div>
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
      <div class="message">${flash.message}</div>
    </g:if>
    <div class="list">
      <table>
        <thead>
          <tr>
            <th><g:message code="part.oemCode.label"  default="Oem Code"/></th>
            <g:sortableColumn property="manufacturer" title="${message(code: 'part.manufacturer.label', default: 'Manufacturer')}"/>
            <th><g:message code="part.params.label"  default="Params"/></th>
            <th><g:message code="part.cross.label"    default="Cross"/></th>
            <th><g:message code="part.actions.label"  default="Actions"/></th>
            <th><g:message code="part.qty.label"      default="Qty"/></th>
          </tr>
        </thead>
        <tbody>
          <g:each in="${partInstanceList}" status="i" var="partInstance">
            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
              <td>
                <g:link action="show" id="${partInstance.id}">${fieldValue(bean: partInstance, field: "oemCode")}</g:link>
                <br/>
                ${fieldValue(bean: partInstance, field: "type")}
              </td>
              <td>
                ${fieldValue(bean: partInstance, field: "manufacturer")}
              </td>
              <td>
                <g:each in="${partInstance.parameters}" var="paramInstance">
                  <div>
                    <span>${paramInstance.kind.name}</span>=<span>${paramInstance.toString()}</span>
                  </div>
                </g:each>
              </td>
              <td class="menuButton">
                <g:link class="create" action="create" id="${partInstance.id}" target="_blank"/>
              </td>
              <td>
                <g:if test="${partInstance?.locations?.size() > 0}">
                  <g:link action="show">
                    <g:message
                      code="part.actions.bye.label"
                      default="Bye"
                    />
                  </g:link>
                </g:if>
                <g:if test="${partInstance?.locations?.size() == 0}">
                  <g:link action="show"><g:message code="part.actions.order.label" default="Order"/></g:link>
                </g:if>
              </td>
              <td>
                <g:each in="${partInstance.locations}" var="partLocationInstance">
                  <g:link action="show" id="${partLocationInstance.id}" controller="partLocation">
                    ${fieldValue(bean: partLocationInstance, field: "location.name")}
                                  (${fieldValue(bean: partLocationInstance, field: "qty")})
                  </g:link>
                  &nbsp;
                </g:each>
              </td>
            </tr>
          </g:each>
        </tbody>
      </table>
    </div>
    <div class="paginateButtons">
      <g:paginate total="${partInstanceTotal}" />
    </div>
    <div>
      <g:link action="updateTruncCodes">update trunc codes</g:link>
    </div>
  </div>
</body>
</html>