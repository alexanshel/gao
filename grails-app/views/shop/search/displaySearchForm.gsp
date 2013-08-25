<%@page import="org.ash.gao.part.PartType"%>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <meta name="layout" content="main" />
  <title><g:message code="shop.search.label"/></title>
</head>
<body>
  <g:form method="post" controller="shop" action="search">
    <p>
      <table>
        <tbody>
          <!-- OEM -->
          <tr class="prop">
            <td class="name"><label for="name"><g:message code="part.oemCode.label" default="OEM" /></label></td>
            <td class="value"><g:textField name="oem" value="${filter.oem}" id="filterOem"/></td>
          </tr>
          <!-- partType -->
          <tr class="prop">
            <td class="name"><label for="name"><g:message code="part.type.label" default="Type" /></label></td>
            <td class="value">
              <g:autocomplete
                keyName=   "partType.id"
                valueName= "partType.name"
                currKey=   "${filter.partType?.id}"
                currValue= "${filter.partType?.name?:''}"
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
              <g:autocomplete
                keyName=   "partKind.id"
                valueName= "partKind.name"
                currKey=   "${filter.partKind?.id}"
                currValue= "${filter.partKind?.name?:''}"
                action=    "autoCompleteJSON"
                controller="partKind"
                class=     "long"
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
                name="withCrosses"
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
              <g:autocomplete
                keyName=   "paramKind.id"
                valueName= "paramKind.name"
                currKey=   "${filter.paramKind?.id}"
                currValue= "${filter.paramKind?.name?:''}"
                action=    "autoCompleteJSON"
                controller="paramKind"
                class=     "long"
                minLength= "0"
              />
              <span id="number">
                <g:message code="part.filter.param.from.label" default="from"/>
                <g:textField class="span2" name="paramValue1" value="${filter.paramValue1}"></g:textField>
                <g:message code="part.filter.param.to.label" default="to"/>
                <g:textField class="span2" name="paramValue2" value="${filter.paramValue2}"></g:textField>
              </span>
            </td>
          </tr>
        </tbody>
      </table>
    </p>
    <p>
      <g:submitButton name="search" class="btn btn-primary" value="${message(code: 'shop.search.label', default: 'Search')}" />
    </p>
  </g:form>
</body>
</html>