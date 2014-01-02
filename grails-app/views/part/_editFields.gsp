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
      keyName="type.id"
      valueName="type.name"
      controller="partType"
      currKey="${partInstance?.type?.id ?: ''}"
      currValue="${partInstance?.type?.name ?: ''}"
      class="long"
    />
    <g:link
      controller="partType"
      tabindex="-1"
      action="editDialog"
      data-toggle="modal"
      data-target="#modal"
      class="btn">
      <i class="icon-plus-sign"></i>
    </g:link>
  </div>
</div>
<!-- Производитель -->
<div class="control-group ${hasErrors(bean: partTypeInstance, field: 'manufacturer', 'error')}">
  <label for="AutoManufacturer" class="control-label">
    <g:message code="part.manufacturer.label" default="Manufacturer"/>
  </label>

  <div class="controls">
    <g:autocomplete
      id="AutoManufacturer"
      keyName="manufacturer.id"
      valueName="manufacturer.name"
      controller="manufacturer"
      minLength="0"
      class="long"
      currKey="${partInstance?.manufacturer?.id ?: ''}"
      currValue="${partInstance?.manufacturer?.name ?: ''}"
    />
  </div>
</div>
<!-- Редактор складов -->
<div class="control-group">
  <label for="locations" class="control-label"><g:message code="part.locations.label" default="Locations"/></label>

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
<!-- Редактор заменителей ! не показываем -->
<div class="control-group ${hasErrors(bean: partInstance, field: 'cross', 'error')} display-none">
  <label class="control-label" for="cross">
    <g:message code="part.cross.label" default="Cross"/>
  </label>

  <div class="controls">
    <g:select name="cross.id"
              from="${org.ash.gao.part.PartCross.list()}"
              optionKey="id" value="${partInstance?.cross?.id}"
              noSelection="['null': '']"/>
  </div>
</div>