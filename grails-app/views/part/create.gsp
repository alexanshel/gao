
<%@ page import="org.ash.gao.part.Part" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'part.label', default: 'Part')}" />
    <gui:resources components='autoComplete'/>
    <title><g:message code="default.create.label" args="[entityName]" /></title>
  </head>
  <body>
    <div class="body">
    <h1><g:message code="default.create.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
      <div class="message">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${partInstance}">
      <div class="errors">
        <g:renderErrors bean="${partInstance}" as="list" />
      </div>
    </g:hasErrors>
    <g:form action="save" method="post" >
      <div class="dialog">
        <table>
          <tbody>
            <!-- OEM код детали -->
            <tr class="prop">
              <td valign="top" class="name">
                <label for="oemCode"><g:message code="part.oemCode.label" default="Oem Code" /></label>
              </td>
              <td valign="top" class="value ${hasErrors(bean: partInstance, field: 'oemCode', 'errors')}">
                <g:textField name="oemCode" value="${partInstance?.oemCode}" />
              </td>
            </tr>
            <!-- Тип детали -->
            <tr class="prop">
              <td valign="top" class="name">
                <label for="type"><g:message code="part.type.label" default="Type" /></label>
              </td>
              <td valign="top" class="value ${hasErrors(bean: partInstance, field: 'type', 'errors')}">
                <g:autocomplete
                  keyName=   "partType.id"
                  valueName= "partType.name"
                  currKey=   "${partInstance?.type?.id}"
                  currValue= "${partInstance?.type?.name}"
                  action=    "autoCompleteJSON"
                  controller="partType"
                  class=     "long"
                  id="AutoType"
                /> 
              </td>
            </tr>
            <!-- Производитель -->
            <tr class="prop">
              <td valign="top" class="name">
                <label for="manufacturer"><g:message code="part.manufacturer.label" default="Manufacturer" /></label>
              </td>
              <td valign="top" class="value ${hasErrors(bean: partInstance, field: 'manufacturer', 'errors')}">
                <g:autocomplete
                  id=        "AutoManufacturer"
                  keyName=   "manufacturer.id"
                  valueName= "manufacturer.name"
                  currKey=   "${partInstance?.manufacturer?.id}"
                  currValue= "${partInstance?.manufacturer?.name}"
                  controller="manufacturer"
                  action=    "autoCompleteJSON"
                  class=     "long"
                /> 
              </td>
            </tr>
            <!-- Редактор складов -->
            <tr class="prop">
              <td valign="top" class="name">
                <label for="locations"><g:message code="part.locations.label" default="Locations" /></label>
              </td>
              <td valign="top" class="value">
                <g:render template="editLocations"/>
              </td>
            </tr>
            <!-- Редактор параметров -->
            <tr class="prop">
              <td valign="top" class="name">
                <g:message code="part.parameters.label" default="Parameters"/>
              </td>
              <td valign="top" class="value">
                <g:render template="editParams"/>
              </td>
            </tr> 
            <tr class="prop">
              <td valign="top" class="name">
                <label for="cross"><g:message code="part.cross.label" default="Cross" /></label>
              </td>
              <td valign="top" class="value ${hasErrors(bean: partInstance, field: 'cross', 'errors')}">
                <g:select name="cross.id" from="${org.ash.gao.part.PartCross.list()}" optionKey="id" value="${partInstance?.cross?.id}" noSelection="['null': '']" />
              </td>
            </tr>
          </tbody>
        </table>
      </div>
      <div class="buttons">
        <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
      </div>
    </g:form>
  </div>
  </body>
</html>
