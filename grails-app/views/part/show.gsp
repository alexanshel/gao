
<%@ page import="org.ash.gao.part.Part" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'part.label', default: 'Part')}" />
    <title><g:message code="default.show.label" args="[entityName]" /></title>
  </head>
  <body>
    <div class="nav">
      <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
      <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
      <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
      <span class="menuButton"><g:link class="create" action="create" id="${partInstance?.id}"><g:message code="part.actions.add-cross" default="Add Cross"/></g:link></span>
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
                            <td valign="top" class="name"><g:message code="part.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: partInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="part.oemCode.label" default="Oem Code" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: partInstance, field: "oemCode")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="part.type.label" default="Type" /></td>
                            
                            <td valign="top" class="value"><g:link controller="partType" action="show" id="${partInstance?.type?.id}">${partInstance?.type?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="part.manufacturer.label" default="Manufacturer" /></td>
                            
                            <td valign="top" class="value"><g:link controller="manufacturer" action="show" id="${partInstance?.manufacturer?.id}">${partInstance?.manufacturer?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="part.locations.label" default="Locations" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${partInstance.locations}" var="l">
                                    <li><g:link controller="partLocation" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="part.cross.label" default="Cross" /></td>
                            
                            <td valign="top" class="value">
                              <g:if test="${partInstance?.cross?.id}">
                                <g:link controller="partCross" action="show" id="${partInstance?.cross?.id}">
                                  <g:message code="default.button.view.label" default="view"/>
                                </g:link>
                              </g:if>
                            </td>
                            
                        </tr>
                      <g:each 
                        in="${partInstance.parameters}"
                        status="i"
                        var="partParameter"
                      >
                        <tr class="prop">
                          <td valign="top" class="name">${partParameter.kind.name}</td>
                          <td valign="top" class="value">${partParameter}</td>
                        </tr> 
                      </g:each>
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${partInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
