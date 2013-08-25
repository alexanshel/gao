<%@ page import="org.ash.gao.part.PartType" %>
<g:formRemote name="PartTypeEditDialog" url="[controller: 'partType', action:'updateAJAX']">
  <div id="idPartTypeEditDialog" class="modal">
    <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
      <h3>${message(code: "partType.edit.label")}</h3>
    </div>
    <g:if test="${flash.message}">
      <div class="alert alert-success">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${paramKindInstance}">
      <div class="alert alert-error">
        <g:renderErrors bean="${paramKindInstance}" as="list" />
      </div>
    </g:hasErrors>
    <div class="modal-body">
      <g:hiddenField name="id" value="${partTypeInstance?.id}" />
      <g:hiddenField name="version" value="${partTypeInstance?.version}" />
      <div class="form-horizontal">
        <div class="control-group ${hasErrors(bean: partTypeInstance, field: 'name', 'error')}">
          <label class="control-label" for="name">${message(code: "partType.name.label")}</label>
          <div class="controls">
            <g:textField
              name="name"
              value="${partTypeInstance?.name}"
              valueOld="${partTypeInstance?.name}"
              class="savable-field"
            />
          </div>
        </div>
        <div class="control-group ${hasErrors(bean: partTypeInstance, field: 'kind', 'error')}">
          <label class="control-label" for="kind">${message(code: "partType.kind.label")}</label>
          <div class="controls">
            <g:select name="kind.id" from="${org.ash.gao.part.PartKind.list()}" optionKey="id" 
              value="${partTypeInstance?.kind?.id}"
              valueOld="${partTypeInstance?.kind?.id}"
              noSelection="['null': '']"
              class="savable-field"
            />
          </div>
        </div>
        <div class="control-group ${hasErrors(bean: partTypeInstance, field: 'parent', 'error')}">
          <label class="control-label" for="parent">${message(code: "partType.parent.label")}</label>
          <div class="controls">
            <g:select name="parent.id" from="${org.ash.gao.part.PartType.list()}" optionKey="id"
              value="${partTypeInstance?.parent?.id}"
              valueOld="${partTypeInstance?.parent?.id}"
              class="savable-field"
            />
          </div>
        </div>
      </div>
    </div>
    <div class="modal-footer">
      <a href="#" class="btn" data-dismiss="modal">${message(code: "default.close.label")}</a>
      <g:submitToRemote
        update="idPartTypeEditDialog" 
        action="updateAJAX"
        class="btn btn-primary"
        value="${message(code: 'partType.save.label')}"
        name="partTypeEditDialogSave"
        after="updateSaved()"
      />
      <button class="btn" onclick="updateSaved();" value="Test">Test</button>
    </div>
  </div>
  <script type="text/javascript">
    app.gao.partTypeDialog = {};
    app.gao.partTypeDialog.updateSaved = function (saved) {
      var dialog = jQuery("#idPartTypeEditDialog");
      var elements = jQuery("#idPartTypeEditDialog [valueOld]");
      var hasChanges = false;
      elements.each(function (){
        hasChanges = hasChanges || (this.value != this.getAttribute("valueOld"));
      });
      var saveButton = $("[name=partTypeEditDialogSave]", dialog);
      if (hasChanges) {
        saveButton.removeAttr("disabled");
      }
      else {
        saveButton.attr("disabled", "disabled");
      }
    }
    app.gao.partTypeDialog.init = function () {
      jQuery("#idPartTypeEditDialog .savable-field").each(function() {
        $(this).change(function () {app.gao.partTypeDialog.updateSaved();});
        this.setAttribute('valueOld', this.value);
      });
    }
    app.gao.partTypeDialog.init();
    app.gao.partTypeDialog.updateSaved();
    
  </script>
</g:formRemote>