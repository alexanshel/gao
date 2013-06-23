
<%@ page import="org.ash.gao.part.param.ParamNumber" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'paramNumber.label', default: 'ParamNumber')}" />
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
      <g:hasErrors bean="${paramNumberInstance}">
      <div class="errors">
        <g:renderErrors bean="${paramNumberInstance}" as="list" />
      </div>
      </g:hasErrors>
      <g:form method="post" >
        <g:hiddenField name="id" value="${paramNumberInstance?.id}" />
        <g:hiddenField name="part.id" value="${paramNumberInstance?.part?.id}"/>
        <g:hiddenField name="kind.id" value="${paramNumberInstance?.kind?.id}"/>
        <g:hiddenField name="version" value="${paramNumberInstance?.version}"/>
        <div class="dialog">
          <table>
            <tbody>
            
              <tr class="prop">
                <td valign="top" class="name">
                  <label for="kind"><g:message code="paramNumber.kind.label" default="Kind" /></label>
                </td>
                <td valign="top" class="value ${hasErrors(bean: paramNumberInstance, field: 'kind', 'errors')}">
                  ${paramNumberInstance?.kind?.encodeAsHTML()}
                </td>
              </tr>
            
              <tr class="prop">
                <td valign="top" class="name">
                  <label for="part"><g:message code="paramNumber.part.label" default="Part" /></label>
                </td>
                <td valign="top" class="value ${hasErrors(bean: paramNumberInstance, field: 'part', 'errors')}">
                  ${paramNumberInstance?.part?.encodeAsHTML()}
                </td>
              </tr>
            
              <tr class="prop">
                <td valign="top" class="name">
                  <label for="valueNumber"><g:message code="paramNumber.valueNumber.label" default="Value Number" /></label>
                </td>
                <td valign="top" class="value ${hasErrors(bean: paramNumberInstance, field: 'valueNumber', 'errors')}">
                  <g:textField name="valueNumber" value="${fieldValue(bean: paramNumberInstance, field: 'valueNumber')}" />
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
