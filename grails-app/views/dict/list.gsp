
<%@ page import="org.ash.gao.part.param.Dict" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'dict.label', default: 'Dict')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'dict.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'dict.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="num" title="${message(code: 'dict.num.label', default: 'Num')}" />
                        
                            <th><g:message code="dict.paramKind.label" default="Param Kind" /></th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${dictInstanceList}" status="i" var="dictInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${dictInstance.id}">${fieldValue(bean: dictInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: dictInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: dictInstance, field: "num")}</td>
                        
                            <td>${fieldValue(bean: dictInstance, field: "paramKind")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${dictInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
