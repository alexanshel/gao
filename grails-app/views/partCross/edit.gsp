
<%@ page import="org.ash.gao.part.PartCross" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'partCross.label', default: 'PartCross')}" />
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
            <g:hasErrors bean="${partCrossInstance}">
            <div class="errors">
                <g:renderErrors bean="${partCrossInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${partCrossInstance?.id}" />
                <g:hiddenField name="version" value="${partCrossInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="partCross.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: partCrossInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${partCrossInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="parts"><g:message code="partCross.parts.label" default="Parts" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: partCrossInstance, field: 'parts', 'errors')}">
                                    
<ul>
<g:each in="${partCrossInstance?.parts?}" var="p">
    <li><g:link controller="part" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="part" action="create" params="['partCross.id': partCrossInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'part.label', default: 'Part')])}</g:link>

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
