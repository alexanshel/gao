
<%@ page import="org.ash.gao.client.Client" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'client.label', default: 'Client')}" />
    <title><g:message code="default.edit.label" args="[entityName]" /></title>
  </head>
  <body>
    <div class="nav">
      <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
      <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
      <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
    </div>
    <div class="body">
      <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
      <g:if test="${flash.message}">
      <div class="message">${flash.message}</div>
      </g:if>
      <g:hasErrors bean="${clientInstance}">
      <div class="errors">
        <g:renderErrors bean="${clientInstance}" as="list" />
      </div>
      </g:hasErrors>
      <g:form method="post" >
        <g:hiddenField name="id" value="${clientInstance?.id}" />
        <g:hiddenField name="version" value="${clientInstance?.version}" />
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
            
              <tr class="prop">
                <td valign="top" class="name">
                  <label for="images"><g:message code="client.images.label" default="Images" /></label>
                </td>
                <td valign="top" class="value ${hasErrors(bean: clientInstance, field: 'images', 'errors')}">
                  <g:select name="images" from="${org.ash.gao.common.Image.list()}" multiple="yes" optionKey="id" size="5" value="${clientInstance?.images*.id}" />
                </td>
              </tr>
            
              <tr class="prop">
                <td valign="top" class="name">
                  <label for="cars"><g:message code="client.cars.label" default="Cars" /></label>
                </td>
                <td valign="top" class="value ${hasErrors(bean: clientInstance, field: 'cars', 'errors')}">
                  
<ul>
<g:each in="${clientInstance?.cars?}" var="c">
    <li><g:link controller="car" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="car" action="create" params="['client.id': clientInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'car.label', default: 'Car')])}</g:link>

                </td>
              </tr>
            
              <tr class="prop">
                <td valign="top" class="name">
                  <label for="orders"><g:message code="client.orders.label" default="Orders" /></label>
                </td>
                <td valign="top" class="value ${hasErrors(bean: clientInstance, field: 'orders', 'errors')}">
                  
<ul>
<g:each in="${clientInstance?.orders?}" var="o">
    <li><g:link controller="clientOrder" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="clientOrder" action="create" params="['client.id': clientInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'clientOrder.label', default: 'ClientOrder')])}</g:link>

                </td>
              </tr>
            
            </tbody>
          </table>
        </div>
        <div class="buttons">
          <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
          <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
        </div>
      </g:form>
    </div>
  </body>
</html>
