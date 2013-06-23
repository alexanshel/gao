
<%@ page import="org.ash.gao.client.Client" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'client.label', default: 'Client')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
  </head>
  <body>
    <div class="nav">
      <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
      <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
    </div>
    <div class="body">
      <h1><g:message code="default.create.label" args="[entityName]" /></h1>
      <g:if test="${flash.message}">
      <div class="message">${flash.message}</div>
      </g:if>
      <g:hasErrors bean="${clientInstance}">
      <div class="errors">
        <g:renderErrors bean="${clientInstance}" as="list" />
      </div>
      </g:hasErrors>
      <g:form action="save" method="post" >
        <div class="dialog">
          <table>
            <tbody>
            
              <tr class="prop">
                <td valign="top" class="name">
                  <label for="firstName"><g:message code="client.firstName.label" default="First Name" /></label>
                </td>
                <td valign="top" class="value ${hasErrors(bean: clientInstance, field: 'firstName', 'errors')}">
                  <g:textField name="firstName" value="${clientInstance?.firstName}" />
                </td>
              </tr>
            
              <tr class="prop">
                <td valign="top" class="name">
                  <label for="middleName"><g:message code="client.middleName.label" default="Middle Name" /></label>
                </td>
                <td valign="top" class="value ${hasErrors(bean: clientInstance, field: 'middleName', 'errors')}">
                  <g:textField name="middleName" value="${clientInstance?.middleName}" />
                </td>
              </tr>
            
              <tr class="prop">
                <td valign="top" class="name">
                  <label for="lastName"><g:message code="client.lastName.label" default="Last Name" /></label>
                </td>
                <td valign="top" class="value ${hasErrors(bean: clientInstance, field: 'lastName', 'errors')}">
                  <g:textField name="lastName" value="${clientInstance?.lastName}" />
                </td>
              </tr>
            
              <tr class="prop">
                <td valign="top" class="name">
                  <label for="phone"><g:message code="client.phone.label" default="Phone" /></label>
                </td>
                <td valign="top" class="value ${hasErrors(bean: clientInstance, field: 'phone', 'errors')}">
                  <g:textField name="phone" value="${clientInstance?.phone}" />
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
