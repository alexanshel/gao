
<%@ page import="org.ash.gao.part.PartType" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'partType.label', default: 'PartType')}" />
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
      <g:hasErrors bean="${partTypeInstance}">
      <div class="errors">
        <g:renderErrors bean="${partTypeInstance}" as="list" />
      </div>
      </g:hasErrors>
      <g:form method="post" >
        <g:hiddenField name="id" value="${partTypeInstance?.id}" />
        <g:hiddenField name="version" value="${partTypeInstance?.version}" />
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
                  <label for="childs"><g:message code="partType.childs.label" default="Childs" /></label>
                </td>
                <td valign="top" class="value ${hasErrors(bean: partTypeInstance, field: 'childs', 'errors')}">
                  
<ul>
<g:each in="${partTypeInstance?.childs?}" var="c">
    <li><g:link controller="partType" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="partType" action="create" params="['partType.id': partTypeInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'partType.label', default: 'PartType')])}</g:link>

                </td>
              </tr>
            
              <tr class="prop">
                <td valign="top" class="name">
                  <label for="kind"><g:message code="partType.kind.label" default="Kind" /></label>
                </td>
                <td valign="top" class="value ${hasErrors(bean: partTypeInstance, field: 'kind', 'errors')}">
                  <g:select name="kind.id" from="${org.ash.gao.part.PartKind.list()}" optionKey="id" value="${partTypeInstance?.kind?.id}" noSelection="['null': '']" />
                </td>
              </tr>
            
              <tr class="prop">
                <td valign="top" class="name">
                  <label for="parent"><g:message code="partType.parent.label" default="Parent" /></label>
                </td>
                <td valign="top" class="value ${hasErrors(bean: partTypeInstance, field: 'parent', 'errors')}">
                  <g:select name="parent.id" from="${org.ash.gao.part.PartType.list()}" optionKey="id" value="${partTypeInstance?.parent?.id}"  />
                </td>
              </tr>
            
              <tr class="prop">
                <td valign="top" class="name">
                  <label for="parts"><g:message code="partType.parts.label" default="Parts" /></label>
                </td>
                <td valign="top" class="value ${hasErrors(bean: partTypeInstance, field: 'parts', 'errors')}">
                  
<ul>
<g:each in="${partTypeInstance?.parts?}" var="p">
    <li><g:link controller="part" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="part" action="create" params="['partType.id': partTypeInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'part.label', default: 'Part')])}</g:link>

                </td>
              </tr>
            
              <tr class="prop">
                <td valign="top" class="name">
                  <label for="childsAll"><g:message code="partType.childsAll.label" default="Childs All" /></label>
                </td>
                <td valign="top" class="value ${hasErrors(bean: partTypeInstance, field: 'childsAll', 'errors')}">
                  
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
