<%@ page import="org.ash.gao.part.PartCross" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'partCross.label', default: 'PartCross')}" />
    <title><g:message code="default.show.label" args="[entityName]" /></title>
  </head>
  <body>
    <div class="body">
      <h1><g:message code="default.show.label" args="[entityName]" /></h1>
      <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
      </g:if>
      <div class="dialog">
        <table>
          <thead>
            <tr>
              <g:sortableColumn property="oemCode" title="${message(code: 'part.oemCode.label', default: 'Oem Code')}"/>
              <th><g:message code="part.type.label" default="Type"/></th>
              <g:sortableColumn property="manufacturer" title="${message(code: 'part.manufacturer.label', default: 'Manufacturer')}"/>
              <g:sortableColumn property="qty" title="${message(code: 'part.qty.label', default: 'Qty')}"/>
            </tr>
          </thead>
          <tbody>
            <g:each in="${partCrossInstance.parts}" var="p" status="i">
              <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                <td><g:link controller="part" action="show" id="${p.id}">${p.oemCode}</g:link></td>
                <td>${fieldValue(bean: p, field: "type")}</td>
                <td>${fieldValue(bean: p, field: "manufacturer")}</td>
                <td>
                  <g:each in="${p.locations}" var="partLocationInstance">
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
    </div>
  </body>
</html>