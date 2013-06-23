
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
    <g:form action="create" method="post" >
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
                  id="AutoType"
                  nameId="type.id"
                  action="autoCompleteJSON"
                  controller="partType"
                  class="long"
                  currValId="${partInstance?.type?.id}"
                  currValName="${partInstance?.type?.name}"
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
                  id="AutoManufacturer"
                  nameId="manufacturer.id"
                  controller="manufacturer"
                  class="long"
                  currValId="${partInstance?.manufacturer?.id}"
                  currValName="${partInstance?.manufacturer?.name}"
                /> 
              </td>
              <td>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
      <div class="buttons">
        <span class="button">
          <g:submitButton
            name="next"
            class="save"
            value="${message(code: 'default.button.create.label', default: 'Create')}"
          />
        </span>
        <span class="button">
          <g:submitButton
            name="save"
            class="save"
            value="${message(code: 'default.button.create.label', default: 'Create')}"
          />
        </span>
      </div>
    </g:form>
  </div>
  </body>
</html>
