
<%@ page import="org.ash.gao.part.PartLocation" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'partLocation.label', default: 'PartLocation')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'partLocation.id.label', default: 'Id')}" />
                        
                            <th><g:message code="partLocation.location.label" default="Location" /></th>
                   	    
                            <g:sortableColumn property="priceIn" title="${message(code: 'partLocation.priceIn.label', default: 'Price In')}" />
                        
                            <g:sortableColumn property="qty" title="${message(code: 'partLocation.qty.label', default: 'Qty')}" />
                        
                            <g:sortableColumn property="priceOut" title="${message(code: 'partLocation.priceOut.label', default: 'Price Out')}" />
                        
                            <th><g:message code="partLocation.part.label" default="Part" /></th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${partLocationInstanceList}" status="i" var="partLocationInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${partLocationInstance.id}">${fieldValue(bean: partLocationInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: partLocationInstance, field: "location")}</td>
                        
                            <td>${fieldValue(bean: partLocationInstance, field: "priceIn")}</td>
                        
                            <td>${fieldValue(bean: partLocationInstance, field: "qty")}</td>
                        
                            <td>${fieldValue(bean: partLocationInstance, field: "priceOut")}</td>
                        
                            <td>${fieldValue(bean: partLocationInstance, field: "part")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${partLocationInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
