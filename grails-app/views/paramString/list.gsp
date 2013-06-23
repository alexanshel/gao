
<%@ page import="org.ash.gao.part.param.ParamString" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'paramString.label', default: 'ParamString')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'paramString.id.label', default: 'Id')}" />
                        
                            <th><g:message code="paramString.kind.label" default="Kind" /></th>
                   	    
                            <th><g:message code="paramString.part.label" default="Part" /></th>
                   	    
                            <g:sortableColumn property="valueString" title="${message(code: 'paramString.valueString.label', default: 'Value String')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${paramStringInstanceList}" status="i" var="paramStringInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${paramStringInstance.id}">${fieldValue(bean: paramStringInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: paramStringInstance, field: "kind")}</td>
                        
                            <td>${fieldValue(bean: paramStringInstance, field: "part")}</td>
                        
                            <td>${fieldValue(bean: paramStringInstance, field: "valueString")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${paramStringInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
