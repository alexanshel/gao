
<%@ page import="org.ash.gao.part.param.ParamDict" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'paramDict.label', default: 'ParamDict')}" />
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
      <g:hasErrors bean="${paramDictInstance}">
      <div class="errors">
        <g:renderErrors bean="${paramDictInstance}" as="list" />
      </div>
      </g:hasErrors>
      <g:form method="post" >
        <g:hiddenField name="id" value="${paramDictInstance?.id}" />
        <g:hiddenField name="version" value="${paramDictInstance?.version}" />
        <div class="dialog">
          <table>
            <tbody>
            
              <tr class="prop">
                <td valign="top" class="name">
                  <label for="kind"><g:message code="paramDict.kind.label" default="Kind" /></label>
                </td>
                <td valign="top" class="value ${hasErrors(bean: paramDictInstance, field: 'kind', 'errors')}">
                  <g:select name="kind.id" from="${org.ash.gao.part.param.ParamKindDict.list()}" optionKey="id" value="${paramDictInstance?.kind?.id}"  />
                </td>
              </tr>
            
              <tr class="prop">
                <td valign="top" class="name">
                  <label for="part"><g:message code="paramDict.part.label" default="Part" /></label>
                </td>
                <td valign="top" class="value ${hasErrors(bean: paramDictInstance, field: 'part', 'errors')}">
                  <g:select name="part.id" from="${org.ash.gao.part.Part.list()}" optionKey="id" value="${paramDictInstance?.part?.id}"  />
                </td>
              </tr>
            
              <tr class="prop">
                <td valign="top" class="name">
                  <label for="valueDict"><g:message code="paramDict.valueDict.label" default="Value Dict" /></label>
                </td>
                <td valign="top" class="value ${hasErrors(bean: paramDictInstance, field: 'valueDict', 'errors')}">
                  <g:select name="valueDict.id" from="${org.ash.gao.part.param.Dict.list()}" optionKey="id" value="${paramDictInstance?.valueDict?.id}"  />
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
