package org.ash.gao

import groovy.xml.MarkupBuilder


class GAOTagLibTagLib {
  static int currId = 0

  String generateId() {
    currId = currId + 1
    'gaoTL' + currId
  }
  
  String getJSONTree(node, childsProp, idProp, nameProp, url) {
    def result = ""
    //если имеет сначала получаем их
    if (node."${childsProp}"?.size() != 0) {
      node."${childsProp}"
        .sort {it."${nameProp}"}
        .each {
          result = result + getJSONTree(it, childsProp, idProp, nameProp, url) + ','
        }
      if (result) result = result.substring(0, result.length() - 1)
    }
    
    '{' +
    '"data" : {' +
      '"title" :' + '"' + node."${nameProp}" + '",' +
      '"attr" : { "href" : "' + url + node.id + '", "target": "_blank"}},' +
    '"attr" :' + '{ "id" : "treeNode' + node."${idProp}" + '"}' +
    ((result)?',"state" : "closed", "children" : [' + result + ']':'') + '}'
  }
  
  def treePrint = { attrs, body ->
    //def writer = new StringWriter()
    //def b = new MarkupBuilder writer:writer
    if (
       attrs?.root && 
       attrs?.childsProp && 
       attrs?.idProp && 
       attrs?.nameProp && 
       attrs?.url
    ) {
      def jsonTree = getJSONTree(attrs.root, attrs.childsProp, attrs.idProp, attrs.nameProp, attrs.url)
      out << '''
      <script script type="text/javascript" class="source">
        jQuery(function () {
            jQuery("#tree").jstree({
                "json_data" : { "data":[''' + jsonTree + ''']},
                "plugins" : [ "themes", "json_data", "search"]
            })
        });
      </script>
      '''
    }
  }
  /**
   *  Input поле с автозавершением
   *  
   *  @attr keyId      идентификатор hidden поля ключа
   *  @attr keyName    наименование hidden поля ключа
   *  @attr valueId    идентификатор hidden поля значения
   *  @attr valueName  наименование hidden поля значения
   *  @attr currKey    ключ по-умолчанию
   *  @attr currValue  значение по-умолчанию
   *  @attr controller имя контроллера
   *  @attr action     имя действия контроллера возвращающее JSON массив [{key = , value = },...]
   *  @attr minLength  минимальная длина ввода для появления списка (0 - список появляется при фокусе)
   */
  def autocomplete = {attrs, body ->
    def keyId      = attrs.remove('keyId')?:generateId()
    def keyName    = attrs.remove('keyName')
    def valueId    = attrs.remove('valueId')?:generateId()
    def valueName  = attrs.remove('valueName')
    def currKey    = attrs.remove('currKey')
    def currValue  = attrs.remove('currValue')
    def controller = attrs.remove('controller')
    def minLength  = attrs.remove('minLength')
    def action     = attrs.action?attrs.remove('action'):'autoCompleteJSON'
    out <<
    """
      <input type="hidden" id="${keyId}"   name="${keyName}"   value="${currKey}"/>
      <input type="text"   id="${valueId}" name="${valueName}" value="${currValue}" class="${attrs.remove('class')}"/>
      <script type="text/javascript" class="source">
        jQuery(function () {
          jQuery(document.getElementById('${valueId}'))
          .autocomplete({
            source:    "${g.createLink(controller: controller, action: action)}",
            minLength: ${minLength},
            select:    function (event, ui) {document.getElementById('${keyId}').value = ui.item.key;}
          });
        });
      </script>
    """
  }
}
