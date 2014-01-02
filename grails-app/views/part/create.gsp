
<%@ page import="org.ash.gao.part.Part" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'part.label', default: 'Part')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
  </head>
  <body>
    <div class="body">
    <h1><g:message code="part.edit.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
      <div class="message">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${partInstance}">
      <div class="errors">
        <g:renderErrors bean="${partInstance}" as="list" />
      </div>
    </g:hasErrors>
    <g:form action="save" method="post" >
        <div class="form-horizontal">
            <g:render template="editFields"/>
            <div class="control-group">
                <div class="controls">
                    <g:submitButton class="btn btn-primary" name="create" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </div>
            </div>
        </div>
    </g:form>
  </div>
  <div class="modal hide" id="modal">
    <div class="modal-body"></div>
  </div>
  </body>
</html>
