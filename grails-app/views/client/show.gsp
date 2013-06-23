
<%@ page import="org.ash.gao.client.Client" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'client.label', default: 'Client')}" />
    <title><g:message code="default.show.label" args="[entityName]" /></title>
  </head>
  <body>
    <div class="nav">
      <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
      <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
      <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
    </div>
    <div class="body">
      <h1><g:message code="default.show.label" args="[entityName]" /></h1>
      <g:if test="${flash.message}">
      <div class="message">${flash.message}</div>
      </g:if>
      <div class="dialog">
        <table>
          <tbody>
          
            <tr class="prop">
              <td valign="top" class="name"><g:message code="client.id.label" default="Id" /></td>
              
              <td valign="top" class="value">${fieldValue(bean: clientInstance, field: "id")}</td>
              
            </tr>
          
            <tr class="prop">
              <td valign="top" class="name"><g:message code="client.firstName.label" default="First Name" /></td>
              
              <td valign="top" class="value">${fieldValue(bean: clientInstance, field: "firstName")}</td>
              
            </tr>
          
            <tr class="prop">
              <td valign="top" class="name"><g:message code="client.middleName.label" default="Middle Name" /></td>
              
              <td valign="top" class="value">${fieldValue(bean: clientInstance, field: "middleName")}</td>
              
            </tr>
          
            <tr class="prop">
              <td valign="top" class="name"><g:message code="client.lastName.label" default="Last Name" /></td>
              
              <td valign="top" class="value">${fieldValue(bean: clientInstance, field: "lastName")}</td>
              
            </tr>
          
            <tr class="prop">
              <td valign="top" class="name"><g:message code="client.phone.label" default="Phone" /></td>
              
              <td valign="top" class="value">${fieldValue(bean: clientInstance, field: "phone")}</td>
              
            </tr>
          
            <tr class="prop">
              <td valign="top" class="name"><g:message code="client.images.label" default="Images" /></td>
              
              <td valign="top" style="text-align: left;" class="value">
                <ul>
                <g:each in="${clientInstance.images}" var="i">
                  <li><g:link controller="image" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></li>
                </g:each>
                </ul>
              </td>
              
            </tr>
          
            <tr class="prop">
              <td valign="top" class="name"><g:message code="client.cars.label" default="Cars" /></td>
              
              <td valign="top" style="text-align: left;" class="value">
                <ul>
                <g:each in="${clientInstance.cars}" var="c">
                  <li><g:link controller="car" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
                </g:each>
                </ul>
              </td>
              
            </tr>
          
            <tr class="prop">
              <td valign="top" class="name"><g:message code="client.orders.label" default="Orders" /></td>
              
              <td valign="top" style="text-align: left;" class="value">
                <ul>
                <g:each in="${clientInstance.orders}" var="o">
                  <li><g:link controller="clientOrder" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
                </g:each>
                </ul>
              </td>
              
            </tr>
          
          </tbody>
        </table>
      </div>
      <div class="buttons">
        <g:form>
          <g:hiddenField name="id" value="${clientInstance?.id}" />
          <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
          <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
        </g:form>
      </div>
    </div>
  </body>
</html>
