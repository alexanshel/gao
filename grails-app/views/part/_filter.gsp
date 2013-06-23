<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@page import="org.ash.gao.part.PartType"%>
<g:form method="post">
  <div class="dialog">
    <table>
      <tbody>
        <tr class="prop">
          <td class="name">
            <label for="name">
              <g:message code="part.oemCode.label" default="OEM" />
            </label>
          </td>
          <td class="value">
            <g:textField name="filterOEM" value="${filterOEM}" id="filterOEM"/>
          </td>
        </tr>
        <tr class="prop">
          <td class="name">
            <label for="name">
              <g:message code="part.type.label" default="Type" />
            </label>
          </td>
          <td class="value">
            <gui:autoComplete
              id="filterPartType"
              controller="partType"
              action="autoCompleteJSON"
              value="${filterPartType}"
              class="long"
            />
          </td>
        </tr>
        <tr class="prop">
          <td class="name">
            <label for="name">
              <g:message code="partType.kind.label" default="Kind" />
            </label>
          </td>
          <td class="value">
            <g:select 
              name="filterPartKind" 
              from="${org.ash.gao.part.PartKind.list()}"
              noSelection="${[null: message(code: 'part.filterPartType.all-value.label', default: 'Any')]}"
              optionKey="id"
              value="${filterPartKind}"
            />
          </td>
        </tr>
        <tr class="prop">
          <td class="name">
            <label for="name">
              <g:message code="part.filter.withCrosses.label" default="With Crosses"/>
            </label>
          </td>
          <td class="value">
            <g:checkBox name="withCrosses" value="${withCrosses}"/>
          </td>
        </tr>
        <tr class="prop">
          <td valign="top" class="name">
            <label for="name">
              <g:message code="part.filter.param.label" default="Param"/>
            </label>
          </td>
          <td valign="top" class="value">
            <g:select 
              name="filterParamKind" 
              from="${org.ash.gao.part.param.ParamKind.list()}"
              noSelection="${[null: message(code: 'part.filter.no-value.label', default: 'No')]}"
              optionKey="id"
              value="${filterParamKind}"
            />
            <span id="number">
              <g:message code="part.filter.param.from.label" default="from"/>
              <g:textField name="filterParamValue1" value="${filterParamValue1}"></g:textField>
              <g:message code="part.filter.param.to.label" default="to"/>
              <g:textField name="filterParamValue2" value="${filterParamValue2}"></g:textField>
            </span>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
  <div class="buttons">
    <span class="button">
      <g:actionSubmit action="list" value="${message(code: 'part.filterButton.label', default: 'Filter')}"/>
    </span>
    <span class="button">
      <g:actionSubmit 
        action="list" 
        onclick="
          \$('filterOEM').writeAttribute('disabled', 'disabled');
          \$('filterPartType').writeAttribute('disabled', 'disabled');
        " 
        value="${message(code: 'part.filterButtonAll.label', default: 'All')}" 
      />
    </span>
  </div>
</g:form>
