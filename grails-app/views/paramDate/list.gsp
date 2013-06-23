
<%@ page import="org.ash.gao.part.param.ParamDate" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'paramDate.label', default: 'ParamDate')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'paramDate.id.label', default: 'Id')}" />
                        
                            <th><g:message code="paramDate.kind.label" default="Kind" /></th>
                   	    
                            <th><g:message code="paramDate.part.label" default="Part" /></th>
                   	    
                            <g:sortableColumn property="valueDate" title="${message(code: 'paramDate.valueDate.label', default: 'Value Date')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${paramDateInstanceList}" status="i" var="paramDateInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${paramDateInstance.id}">${fieldValue(bean: paramDateInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: paramDateInstance, field: "kind")}</td>
                        
                            <td>${fieldValue(bean: paramDateInstance, field: "part")}</td>
                        
                            <td><g:formatDate date="${paramDateInstance.valueDate}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${paramDateInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
