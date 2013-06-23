<%@ page import="org.ash.gao.part.Part"%>
<div class="list">
  <g:javascript>
    var locationSize = ${partInstance?.locations?.size()?:0};
    function addPartLocation() {
      var newL = $('#idLocationTmpl').clone().appendTo('#idLocationsTB').removeAttr('id').addClass('location');
      $('[name^="locations[#]"]', newL).each(function () {
        var el = $(this);
        el.attr('name', el.attr('name').replace('#', locationSize));
        el.attr('id', el.attr('id').replace('#', locationSize));
        el.removeAttr('disabled')
      });
      locationSize = locationSize + 1;
      newL.show();
    }
    function remPartLocation(button) {
      var lRow = $(button).closest('tr.location');
      // получаем идентификатор расположения
      var partLocationId = $('.part-location-id', lRow).val();
      // если объект уже существует в БД, устанавливаем deleted и скрываем строчку
      if (lRow.is('.persist')) {
        $('.part-location-deleted', lRow).val('true');
        lRow.hide();
      }
      else // если запись ещё не существует в БД - просто удаляем строчку
        lRow.remove();
    }
  </g:javascript>
  <g:hiddenField name="location-size" id="location-size" value="${partInstance?.locations?.size()}" />
  <table>
    <thead>
      <tr>
        <th><g:message code="partLocation.location.label" default="Location" /></th>
        <th><g:message code="partLocation.qty.label"      default="Qty" /></th>
        <th><g:message code="partLocation.priceIn.label"  default="Price In" /></th>
        <th><g:message code="partLocation.priceOut.label" default="Price Out" /></th>
        <th><g:message code="partLocation.control.label"  default="Control" /></th>
      </tr>
    </thead>
    <tbody id="idLocationsTB">
      <g:each in="${partInstance?.locations?}" var="partLocationInstance" status="i">
        <tr class="persist location ${(i % 2) == 0 ? 'odd' : 'even'}">
          <td valign="top" class="value ${hasErrors(bean: partLocationInstance, field: 'location.id', 'errors')}">
            <g:hiddenField name="locations[${i}].id"      value="${partLocationInstance.id}" class="part-location-id"/>
            <g:hiddenField name="locations[${i}].deleted" value="false" class="part-location-deleted"/>
            <g:select
              name="locations[${i}].location.id" 
              from="${org.ash.gao.part.Location.list()}"
              optionKey="id"
              value="${partLocationInstance?.location?.id}"
              class="location-id"
            />
          </td>
          <td valign="top" class="value ${hasErrors(bean: partLocationInstance, field: 'qty', 'errors')}">
            <g:textField name="locations[${i}].qty" value="${partLocationInstance?.qty}" class="location-qty"/>
          </td>
          <td valign="top" class="value ${hasErrors(bean: partLocationInstance, field: 'priceIn', 'errors')}">
            <g:textField name="locations[${i}].priceIn" value="${partLocationInstance?.priceIn}" class="location-price-in"/>
          </td>
          <td valign="top" class="value ${hasErrors(bean: partLocationInstance, field: 'priceOut', 'errors')}">
            <g:textField name="locations[${i}].priceOut" value="${partLocationInstance?.priceOut}" class="location-price-out"/>
          </td>
          <td valign="top" class="value">
            <span class="button">
              <button onclick="remPartLocation(this);" value="add" type="button">
                <g:message code="default.button.delete.label" default="delete"/>
              </button>
            </span>
          </td>
        </tr>
      </g:each>
      <tr style="display: none" id="idLocationTmpl">
        <td valign="top" class="value">
          <g:select 
            disabled="true"
            name="locations[#].location.id" from="${org.ash.gao.part.Location.list()}"
            optionKey="id" value="${partLocationInstance?.location?.id}"
          />
        </td>
        <td valign="top" class="value"><g:textField name="locations[#].qty" value="0" disabled="disabled"/></td>
        <td valign="top" class="value"><g:textField name="locations[#].priceIn" value="0" disabled="disabled"/></td>
        <td valign="top" class="value"><g:textField name="locations[#].priceOut" value="0" disabled="disabled"/></td>
        <td valign="top" class="value">
          <span class="button">
            <button onclick="remPartLocation(this);" value="add" type="button">
              <g:message code="default.button.delete.label" default="delete"/>
            </button>
          </span>
        </td>
      </tr>
    </tbody>
  </table>
  <div class="buttons">
    <button onclick="addPartLocation();" value="add" type="button"><g:message code="default.button.add.label" default="add"/></button>
  </div>
</div>