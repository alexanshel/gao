
<%@ page import="org.ash.gao.part.PartLocation" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'partLocation.label', default: 'PartLocation')}" />
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
            <g:hasErrors bean="${partLocationInstance}">
            <div class="errors">
                <g:renderErrors bean="${partLocationInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="location"><g:message code="partLocation.location.label" default="Location" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: partLocationInstance, field: 'location', 'errors')}">
                                    <g:select name="location.id" from="${org.ash.gao.part.Location.list()}" optionKey="id" value="${partLocationInstance?.location?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="priceIn"><g:message code="partLocation.priceIn.label" default="Price In" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: partLocationInstance, field: 'priceIn', 'errors')}">
                                    <g:textField name="priceIn" value="${fieldValue(bean: partLocationInstance, field: 'priceIn')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="qty"><g:message code="partLocation.qty.label" default="Qty" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: partLocationInstance, field: 'qty', 'errors')}">
                                    <g:textField name="qty" value="${fieldValue(bean: partLocationInstance, field: 'qty')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="priceOut"><g:message code="partLocation.priceOut.label" default="Price Out" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: partLocationInstance, field: 'priceOut', 'errors')}">
                                    <g:textField name="priceOut" value="${fieldValue(bean: partLocationInstance, field: 'priceOut')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="part"><g:message code="partLocation.part.label" default="Part" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: partLocationInstance, field: 'part', 'errors')}">
                                    <g:select name="part.id" from="${org.ash.gao.part.Part.list()}" optionKey="id" value="${partLocationInstance?.part?.id}"  />
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
