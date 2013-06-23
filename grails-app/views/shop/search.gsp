<%@page import="org.ash.gao.part.PartType"%>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <meta name="layout" content="main" />
  <title><g:message code="shop.search.label"/></title>
</head>
<body>
  <g:form method="post" controller="shop" action="searchResult">
    <div class="dialog">
      <table>
        <tbody>
          <!-- OEM -->
          <tr class="prop">
            <td class="name"><label for="name"><g:message code="part.oemCode.label" default="OEM" /></label></td>
            <td class="value"><g:textField name="filter.OEM" value="${filter.OEM}" id="filterOEM"/></td>
          </tr>
          <!-- partType -->
          <tr class="prop">
            <td class="name"><label for="name"><g:message code="part.type.label" default="Type" /></label></td>
            <td class="value">
              <g:autocomplete
                keyName=   "filter.partType.id"
                valueName= "filter.partType.name"
                currKey=   "${filter?.partType?.id}"
                currValue= "${filter?.partType?.name}"
                action=    "autoCompleteJSON"
                controller="partType"
                class=     "long"
              />
            </td>
          </tr>
          <!-- partKind -->
          <tr class="prop">
            <td class="name"><label for="name"><g:message code="partType.kind.label" default="Kind" /></label></td>
            <td class="value">
              <g:select 
                name="filter.partKind" 
                from="${org.ash.gao.part.PartKind.list()}"
                noSelection="${[null: message(code: 'part.filterPartType.all-value.label', default: 'Any')]}"
                optionKey="id"
                value="${filter.partKind}"
              />
            </td>
          </tr>
          <!-- withCrosses -->
          <tr class="prop">
            <td class="name">
              <label for="name"><g:message code="part.filter.withCrosses.label" default="With Crosses"/></label>
            </td>
            <td class="value">
              <g:checkBox 
                name="filter.withCrosses"
                value="${filter.withCrosses}"
                checked="${filter.withCrosses}"
              />
            </td>
          </tr>
          <!-- param -->
          <tr class="prop">
            <td valign="top" class="name">
              <label for="name"><g:message code="part.filter.param.label" default="Param"/></label>
            </td>
            <td valign="top" class="value">
              <g:select 
                name="filter.paramKind" 
                from="${org.ash.gao.part.param.ParamKind.list()}"
                noSelection="${[null: message(code: 'part.filter.no-value.label', default: 'No')]}"
                optionKey="id"
                value="${filter.paramKind}"
              />
              <span id="number">
                <g:message code="part.filter.param.from.label" default="from"/>
                <g:textField name="filter.paramValue1" value="${filterParamValue1}"></g:textField>
                <g:message code="part.filter.param.to.label" default="to"/>
                <g:textField name="filter.paramValue2" value="${filterParamValue2}"></g:textField>
              </span>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
    <div class="buttons">
      <span class="button">
        <g:actionSubmit
          action="searchResult"
          value="${message(code: 'part.filterButton.label', default: 'Filter')}"
        />
      </span>
    </div>
  </g:form>
</body>
</html>