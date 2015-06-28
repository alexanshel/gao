
<%@ page import="org.ash.gao.part.PartType" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'partType.label', default: 'PartType')}" />
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
      <g:hasErrors bean="${partTypeInstance}">
      <div class="errors">
        <g:renderErrors bean="${partTypeInstance}" as="list" />
      </div>
      </g:hasErrors>
      <g:form action="save" method="post" >
        <div class="dialog">
          <table>
            <tbody>
            
              <tr class="prop">
                <td valign="top" class="name">
                  <label for="name"><g:message code="partType.name.label" default="Name" /></label>
                </td>
                <td valign="top" class="value ${hasErrors(bean: partTypeInstance, field: 'name', 'errors')}">
                  <g:textField name="name" value="${partTypeInstance?.name}" />
                </td>
              </tr>
            
              <tr class="prop">
                <td valign="top" class="name">
                  <label for="kind"><g:message code="partType.kind.label" default="Kind" /></label>
                </td>
                <td valign="top" class="value ${hasErrors(bean: partTypeInstance, field: 'kind', 'errors')}">
                  <g:select name="kind.id" from="${org.ash.gao.part.PartKind.list()}" optionKey="id" value="${partTypeInstance?.kind?.id}"  />
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
