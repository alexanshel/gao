
<%@ page import="org.ash.gao.part.param.ParamKindNumber" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'paramKindNumber.label', default: 'ParamKindNumber')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'paramKindNumber.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'paramKindNumber.name.label', default: 'Name')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${paramKindNumberInstanceList}" status="i" var="paramKindNumberInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${paramKindNumberInstance.id}">${fieldValue(bean: paramKindNumberInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: paramKindNumberInstance, field: "name")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${paramKindNumberInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
