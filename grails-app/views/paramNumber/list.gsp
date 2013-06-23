
<%@ page import="org.ash.gao.part.param.ParamNumber" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'paramNumber.label', default: 'ParamNumber')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'paramNumber.id.label', default: 'Id')}" />
                        
                            <th><g:message code="paramNumber.kind.label" default="Kind" /></th>
                   	    
                            <th><g:message code="paramNumber.part.label" default="Part" /></th>
                   	    
                            <g:sortableColumn property="valueNumber" title="${message(code: 'paramNumber.valueNumber.label', default: 'Value Number')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${paramNumberInstanceList}" status="i" var="paramNumberInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${paramNumberInstance.id}">${fieldValue(bean: paramNumberInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: paramNumberInstance, field: "kind")}</td>
                        
                            <td>${fieldValue(bean: paramNumberInstance, field: "part")}</td>
                        
                            <td>${fieldValue(bean: paramNumberInstance, field: "valueNumber")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${paramNumberInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
