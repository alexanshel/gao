<%@ page import="org.ash.gao.part.Part"%>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <g:set var="entityName" value="${message(code: 'part.label', default: 'Part')}"/>
  <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>
<body>
  <div class="body">
    <div class="filter-params">
      <ul class="thumbnails">
        <li class="span3">
          <h4><g:message code="shop.filter.params" default="Filter params"/>:</h4>
        </li>
        <li class="span4">
          <p>
          <table>
            <g:if test="${filter.oem != null}">
              <tr>
                <td><g:message code="part.oemCode.label"/>:</td>
                <td>${filter.oem}</td>
              </tr>
            </g:if>
            <g:if test="${filter.partType?.id}">
              <tr>
                <td><g:message code="filter.partType.label"/>:</td>
                <td>${filter.partType.name}</td>
              </tr>
            </g:if>
            <g:if test="${filter.partKind?.id}">
              <tr>
                <td><g:message code="filter.partKind.label"/>:</td>
                <td>${filter.partKind.name}</td>
              </tr>
            </g:if>
            <tr>
              <td>
                <g:message code="filter.withCrosses.label"/>:
              </td>
              <td>
                <g:if test="${filter.withCrosses}">${message(code: "default.boolean.true")}</g:if>
                <g:else>${message(code: "default.boolean.false")}</g:else>
              </td>
            </tr>
            <g:if test="${filter.paramKind?.id}">
              <tr>
                <td><g:message code="part.paramKind.label"/>:</td>
                <td>${filter.paramKind?.name} <g:message code="part.paramKind.value.label" args="[filter.paramValue1, filter.paramValue2]"/></td>
              </tr>
            </g:if>
          </table>
          </p>
            <g:link 
              class="btn btn-mini"
              action="createPart"
              params="[oem: filter.oem, 'part.type.id': filter.partType?.id, 'part.kind.id': filter.partKind?.id]"
            >
              <g:message code="shop.create-part.label"/>
            </g:link>
        </li>
        <li class="span3">
          <g:form>
            <g:submitButton class="btn btn-primary" name="searchAgain" value="${message(code: 'shop.search-again.button.label', default: 'Search again')}" />
          </g:form>
        </li>
      </ul>
    </div>
    <h3><g:message code="shop.searched.list.label" default="Searched items" args="${partInstanceTotal}"/>:</h3>
    <g:if test="${flash.message}">
      <div class="message">${flash.message}</div>
    </g:if>
    <g:if test="${partInstanceList.size() == 0}">
      <g:message code="shop.not-found.message"/>
    </g:if>
    <g:if test="${partInstanceList.size() > 0}">
      <div class="list">
        <table class="table table-hover table-bordered">
          <thead>
            <tr>
              <th><g:message code="part.oemCode.label"  default="Oem Code"/></th>
              <g:sortableColumn property="manufacturer" title="${message(code: 'part.manufacturer.label', default: 'Manufacturer')}"/>
              <th><g:message code="part.params.label"  default="Params"/></th>
              <th><g:message code="part.cross.label"    default="Cross"/></th>
              <th><g:message code="part.qty.label"      default="Qty"/></th>
              <th><g:message code="part.actions.label"  default="Actions"/></th>
            </tr>
          </thead>
          <tbody>
            <g:each in="${partInstanceList}" status="i" var="partInstance">
              <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                <td>
                  <g:link controller="part" action="edit" id="${partInstance.id}">
                    ${fieldValue(bean: partInstance, field: "oemCode")}
                  </g:link>
                  <br/>
                  ${fieldValue(bean: partInstance, field: "type")}
                </td>
                <td>${fieldValue(bean: partInstance, field: "manufacturer")}</td>
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
                <!-- qty -->
                <td>
                  <g:each in="${partInstance.locations}" var="partLocationInstance">
                    <g:link action="show" id="${partLocationInstance.id}" controller="partLocation">
                      ${fieldValue(bean: partLocationInstance, field: "location.name")}
                                    (${fieldValue(bean: partLocationInstance, field: "qty")})
                    </g:link>
                    &nbsp;
                  </g:each>
                </td>
                <!-- actions -->
                <td>
                  <div class="btn-group">
                    <button class="btn dropdown-toggle btn-primary btn-mini" data-toggle="dropdown">
                      ${message(code: 'part.action.button.label')}
                      <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu">
                      <g:if test="${partInstance?.locations?.size() > 0}">
                        <li>
                          <g:link controller="part" action="show">
                            <i class="icon-shopping-cart"></i>
                            ${message(code: 'part.actions.sale.label')}
                          </g:link>
                        </li>
                      </g:if>
                      <li>
                        <g:link controller="part" action="show">
                          <i class="icon-plus-sign"></i>
                          ${message(code: 'part.actions.order.label')}
                        </g:link>
                      </li>
                      <li class="divider"/>
                      <li>
                        <g:link class="create" controller="part" action="create" id="${partInstance.id}" target="_blank">
                          <i class="icon-plus-sign"></i>
                          ${message(code: 'part.actions.create-by.label')}
                        </g:link>
                      </li>
                    </ul>
                  </div>
                </td>
              </tr>
            </g:each>
          </tbody>
        </table>
      </div>
    </g:if>
  </div>
</body>
</html>