
<%@ page import="org.ash.gao.part.param.ParamString" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'paramString.label', default: 'ParamString')}" />
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
      <g:hasErrors bean="${paramStringInstance}">
      <div class="errors">
        <g:renderErrors bean="${paramStringInstance}" as="list" />
      </div>
      </g:hasErrors>
      <g:form method="post" >
        <g:hiddenField name="id" value="${paramStringInstance?.id}" />
        <g:hiddenField name="version" value="${paramStringInstance?.version}" />
        <div class="dialog">
          <table>
            <tbody>
            
              <tr class="prop">
                <td valign="top" class="name">
                  <label for="kind"><g:message code="paramString.kind.label" default="Kind" /></label>
                </td>
                <td valign="top" class="value ${hasErrors(bean: paramStringInstance, field: 'kind', 'errors')}">
                  <g:select name="kind.id" from="${org.ash.gao.part.param.ParamKindString.list()}" optionKey="id" value="${paramStringInstance?.kind?.id}"  />
                </td>
              </tr>
            
              <tr class="prop">
                <td valign="top" class="name">
                  <label for="part"><g:message code="paramString.part.label" default="Part" /></label>
                </td>
                <td valign="top" class="value ${hasErrors(bean: paramStringInstance, field: 'part', 'errors')}">
                  <g:select name="part.id" from="${org.ash.gao.part.Part.list()}" optionKey="id" value="${paramStringInstance?.part?.id}"  />
                </td>
              </tr>
            
              <tr class="prop">
                <td valign="top" class="name">
                  <label for="valueString"><g:message code="paramString.valueString.label" default="Value String" /></label>
                </td>
                <td valign="top" class="value ${hasErrors(bean: paramStringInstance, field: 'valueString', 'errors')}">
                  <g:textField name="valueString" value="${paramStringInstance?.valueString}" />
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
