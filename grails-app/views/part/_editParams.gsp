<%@ page import="org.ash.gao.part.Part"%>
<%@ page import="org.ash.gao.part.param.*" %>
<div class="list">
  <g:javascript>
    var paramsSize = ${partInstance?.parameters?.size()?:0};
    var paramKindMap = ${paramKindMapJson};

    function addPartParameter() {
      var newL = $('#idTmpl').clone().appendTo('#idParametersTB').removeAttr('id').addClass('location');
      $('[name^="parameters[#]"]', newL).each(function () {
        var el = $(this);
        el.attr('name', el.attr('name').replace('#', paramsSize));
        el.attr('id', el.attr('id').replace('#', paramsSize));
        el.removeAttr('disabled')
      });
      paramsSize = paramsSize + 1;
      newL.show();
      onParamKindChange(newL.find('select.parameter-kind-id'));
      newL.find('.parameter-value').keypress(function( event ) {
        var $target = $(event.target);
        console.log(event);
        if ($target.is('.ParamKindNumber')) {
          if (event.which == (','.charCodeAt(0)))
            event.preventDefault();
        }
      });
    }
    function remPartParameter(button) {
      var lRow = $(button).closest('tr');
      // если объект уже существует в БД, устанавливаем deleted и скрываем строчку
      if (lRow.is('.persist')) {
        $('.part-parameter-deleted', lRow).val('true');
        lRow.hide();
      }
      else // если запись ещё не существует в БД - просто удаляем строчку
        lRow.remove();
    }
    function onParamKindChange(select) {
      var jSelect = jQuery(select);
      var cssClass = paramKindMap[jSelect.val()];
      jSelect.closest('tr').find('.parameter-value').addClass(cssClass);
    }
  </g:javascript>
  <g:hiddenField name="location-size" id="location-size" value="${partInstance?.parameters?.size()}" />
  <table class="table-bordered">
    <thead>
      <tr>
        <th><g:message code="partParameter.kind.label"    default="Kind" /></th>
        <th><g:message code="partParameter.value.label"   default="Value" /></th>
        <th><g:message code="partParameter.control.label" default="Remove" /></th>
      </tr>
    </thead>
    <tbody id="idParametersTB">

      <g:each in="${partInstance?.parameters?}" var="partParameterInstance" status="i">
        <tr class="persist ${(i % 2) == 0 ? 'odd' : 'even'}">
          <td valign="top" class="value ${hasErrors(bean: partParameterInstance, field: 'kind.id', 'errors')}">
            <g:hiddenField name="parameters[${i}].id"      value="${partParameterInstance.id}" class="part-parameter-id"/>
            <!-- признак того, что запись удалена (для js) -->
            <g:hiddenField name="parameters[${i}].deleted" value="false" class="part-parameter-deleted"/>
            <g:select
              name="parameters[${i}].kind.id" 
              from="${ParamKind.list()}"
              optionKey="id"
              value="${partParameterInstance?.kind?.id}"
              class="parameter-kind-id"
              onchange="onParamKindChange(this);"
            />
          </td>
          <td valign="top" class="value ${hasErrors(bean: partParameterInstance, field: 'value', 'errors')}">
            <g:textField name="parameters[${i}].value" 
              value="${partParameterInstance?.value}"
              class="parameter-value"
            />
          </td>
          <td valign="top" class="value">
            <span class="button">
              <button onclick="remPartParameter(this);" value="add" type="button" class="btn btn-danger">
                <i class="icon-remove"></i>
              </button>
            </span>
          </td>
        </tr>
      </g:each>

      <!-- шаблонная строка -->
      <tr style="display: none" id="idTmpl">
        <td valign="top" class="value">
          <g:select
            name="parameters[#].kind.id" 
            from="${org.ash.gao.part.param.ParamKind.list()}"
            optionKey="id"
            value="${partParameterInstance?.kind?.id}"
            class="parameter-kind-id"
            onchange="onParamKindChange(this);"
            disabled="true"
          />
        </td>
        <td valign="top" class="value ${hasErrors(bean: partParameterInstance, field: 'value', 'errors')}">
          <g:textField name="parameters[#].value" class="parameter-value" disabled="disabled"/>
        </td>
        <td valign="top" class="value">
          <button onclick="remPartParameter(this);" value="add" type="button" class="btn btn-danger">
            <i class="icon-remove"></i>
          </button>
        </td>
      </tr>

    </tbody>
  </table>
  <div class="btn-toolbar">
    <button onclick="addPartParameter();" value="add" type="button" class="btn">
      <i class="icon-plus-sign"></i>
    </button>
  </div>
</div>