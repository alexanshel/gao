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
        <!-- OEM -->
        <div class="control-group ${hasErrors(bean: partTypeInstance, field: 'oemCode', 'error')}">
          <label for="oemCode" class="control-label"><g:message code="part.oemCode.label" default="Oem Code"/></label>
          <div class="controls"><g:textField name="oemCode" value="${partInstance?.oemCode}"/></div>
        </div>
        <!-- Тип детали -->
        <div class="control-group ${hasErrors(bean: partTypeInstance, field: 'type', 'error')}">
          <label for="type" class="control-label"><g:message code="part.type.label" default="Type"/></label>
          <div class="controls">
            <g:autocomplete
              id="AutoType"
              nameId="type.id"
              action="autoCompleteJSON"
              controller="partType"
              class="long"
              currKey="${partInstance?.type?.id}"
              currValue="${partInstance?.type?.name}"
            />
            <g:link 
              controller="partType"
              action="editDialog"
              data-toggle="modal"
              data-target="#modal"
              class="btn"
            >
              <i class="icon-plus-sign"></i>
            </g:link>
          </div>
        </div>
        <!-- Производитель -->
        <div class="control-group ${hasErrors(bean: partTypeInstance, field: 'manufacturer', 'error')}">
          <label for="manufacturer" class="control-label"><g:message code="part.manufacturer.label" default="Manufacturer" /></label>
          <div class="controls">
            <g:autocomplete
              id="AutoManufacturer"
              nameId="manufacturer.id"
              controller="manufacturer"
              minLength="0"
              class="long"
              currKey="${partInstance?.manufacturer?.id}"
              currValue="${partInstance?.manufacturer?.name}"
            />
          </div>
        </div>
        <!-- Редактор складов -->
        <div class="control-group">
          <label for="locations" class="control-label"><g:message code="part.locations.label" default="Locations" /></label>
          <div class="controls">
            <g:render template="editLocations"/>
          </div>
        </div>
        <!-- Редактор параметров -->
        <div class="control-group">
          <label class="control-label">
            <g:message code="part.parameters.label" default="Parameters"/>
          </label>
          <div class="controls">
            <g:render template="editParams"/>
          </div>
        </div>
        <!-- Редактор заменителей -->
        <div class="control-group ${hasErrors(bean: partInstance, field: 'cross', 'error')} display-none">
          <label class="control-label" for="cross">
            <g:message code="part.cross.label" default="Cross" />
          </label>
          <div class="controls">
            <g:select name="cross.id"
              from="${org.ash.gao.part.PartCross.list()}"
              optionKey="id" value="${partInstance?.cross?.id}"
              noSelection="['null': '']"
            />
          </div>
        </div>
        <div class="control-group">
          <div class="controls">
            <button class="btn" onclick="window.history.back();" value="Back"></button>
            <g:actionSubmit
              class="btn"
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
