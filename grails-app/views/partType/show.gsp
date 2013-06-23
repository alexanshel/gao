
<%@ page import="org.ash.gao.part.PartType" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'partType.label', default: 'PartType')}" />
    <title><g:message code="default.show.label" args="[entityName]" /></title>
  </head>
  <body>
    <div class="nav">
      <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
      <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
      <span class="menuButton"><g:link class="create" action="create" params="['parent.id': partTypeInstance.id]"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
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
              <td valign="top" class="name"><g:message code="partType.id.label" default="Id" /></td>
              
              <td valign="top" class="value">${fieldValue(bean: partTypeInstance, field: "id")}</td>
              
            </tr>
          
            <tr class="prop">
              <td valign="top" class="name"><g:message code="partType.name.label" default="Name" /></td>
              
              <td valign="top" class="value">${fieldValue(bean: partTypeInstance, field: "name")}</td>
              
            </tr>
          
            <tr class="prop">
              <td valign="top" class="name"><g:message code="partType.childs.label" default="Childs" /></td>
              
              <td valign="top" style="text-align: left;" class="value">
                <ul>
                <g:each in="${partTypeInstance.childs}" var="c">
                  <li><g:link controller="partType" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
                </g:each>
                </ul>
              </td>
              
            </tr>
          
            <tr class="prop">
              <td valign="top" class="name"><g:message code="partType.kind.label" default="Kind" /></td>
              
              <td valign="top" class="value"><g:link controller="partKind" action="show" id="${partTypeInstance?.kind?.id}">${partTypeInstance?.kind?.encodeAsHTML()}</g:link></td>
              
            </tr>
          
            <tr class="prop">
              <td valign="top" class="name"><g:message code="partType.parent.label" default="Parent" /></td>
              
              <td valign="top" class="value"><g:link controller="partType" action="show" id="${partTypeInstance?.parent?.id}">${partTypeInstance?.parent?.encodeAsHTML()}</g:link></td>
              
            </tr>
          
            <tr class="prop">
              <td valign="top" class="name"><g:message code="partType.parts.label" default="Parts" /></td>
              
              <td valign="top" style="text-align: left;" class="value">
                <ul>
                <g:each in="${partTypeInstance.parts}" var="p">
                  <li><g:link controller="part" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
                </g:each>
                </ul>
              </td>
              
            </tr>
          
            <tr class="prop">
              <td valign="top" class="name"><g:message code="partType.childsAll.label" default="Childs All" /></td>
              
              <td valign="top" class="value">${fieldValue(bean: partTypeInstance, field: "childsAll")}</td>
              
            </tr>
          
          </tbody>
        </table>
      </div>
      <div class="buttons">
        <g:form>
          <g:hiddenField name="id" value="${partTypeInstance?.id}" />
          <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
          <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
        </g:form>
      </div>
    </div>
  </body>
</html>
