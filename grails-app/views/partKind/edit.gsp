
<%@ page import="org.ash.gao.part.PartKind" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'partKind.label', default: 'PartKind')}" />
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
      <g:hasErrors bean="${partKindInstance}">
      <div class="errors">
        <g:renderErrors bean="${partKindInstance}" as="list" />
      </div>
      </g:hasErrors>
      <g:form method="post" >
        <g:hiddenField name="id" value="${partKindInstance?.id}" />
        <g:hiddenField name="version" value="${partKindInstance?.version}" />
        <div class="dialog">
          <table>
            <tbody>
            
              <tr class="prop">
                <td valign="top" class="name">
                  <label for="name"><g:message code="partKind.name.label" default="Name" /></label>
                </td>
                <td valign="top" class="value ${hasErrors(bean: partKindInstance, field: 'name', 'errors')}">
                  <g:textField name="name" value="${partKindInstance?.name}" />
                </td>
              </tr>
            
              <tr class="prop">
                <td valign="top" class="name">
                  <label for="partTypes"><g:message code="partKind.partTypes.label" default="Part Types" /></label>
                </td>
                <td valign="top" class="value ${hasErrors(bean: partKindInstance, field: 'partTypes', 'errors')}">
                  
<ul>
<g:each in="${partKindInstance?.partTypes?}" var="p">
    <li><g:link controller="partType" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="partType" action="create" params="['partKind.id': partKindInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'partType.label', default: 'PartType')])}</g:link>

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
