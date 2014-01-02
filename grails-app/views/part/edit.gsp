<%@ page import="org.ash.gao.part.Part"%>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <meta name="layout" content="main" />
  <g:set var="entityName" value="${message(code: 'part.label', default: 'Part')}" />
  <title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>
  <div class="body">
    <div class="page-header">
      <h3>${message(code: "part.edit.label")}</h3>
    </div>
    <g:if test="${flash.message}">
      <div class="alert alert-success">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${partInstance}">
      <div class="alert alert-error">
        <g:renderErrors bean="${partInstance}" as="list" />
      </div>
    </g:hasErrors>
    <g:form method="post">
      <g:hiddenField name="id" value="${partInstance?.id}" />
      <g:hiddenField name="version" value="${partInstance?.version}" />
      <div class="form-horizontal">
        <g:render template="editFields"/>
        <div class="control-group">
          <div class="controls">
            <button class="btn" onclick="window.history.back();" value="Back"></button>
            <g:actionSubmit
              class="btn btn-primary"
              action="update"
              value="${message(code: 'default.button.update.label', default: 'Update')}" />
            <g:actionSubmit class="btn btn-danger"
                action="delete"
                value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"
            />
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
