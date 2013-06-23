
<%@ page import="org.ash.gao.part.PartLocation" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'partLocation.label', default: 'PartLocation')}" />
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
                            <td valign="top" class="name"><g:message code="partLocation.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: partLocationInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="partLocation.location.label" default="Location" /></td>
                            
                            <td valign="top" class="value"><g:link controller="location" action="show" id="${partLocationInstance?.location?.id}">${partLocationInstance?.location?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="partLocation.priceIn.label" default="Price In" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: partLocationInstance, field: "priceIn")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="partLocation.qty.label" default="Qty" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: partLocationInstance, field: "qty")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="partLocation.priceOut.label" default="Price Out" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: partLocationInstance, field: "priceOut")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="partLocation.part.label" default="Part" /></td>
                            
                            <td valign="top" class="value"><g:link controller="part" action="show" id="${partLocationInstance?.part?.id}">${partLocationInstance?.part?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${partLocationInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
