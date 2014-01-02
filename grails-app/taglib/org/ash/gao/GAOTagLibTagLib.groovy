package org.ash.gao

import grails.converters.JSON
import groovy.xml.MarkupBuilder


class GAOTagLibTagLib {
  def breadCrumbsServiceProxy
  def grailsApplication
  def grailsNavigation

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
    def chidlens = (result)?',"state" : "closed", "children" : [' + result + ']':''
    """
      {
        "data": {
           "title": "${node[nameProp]}",
           "attr": {
             "href": "${url + node.id}",
             "partTypeId": ${node[idProp]},
             "onclick": "alert('medved' + this.id)"
           },
        },
        "attr": {"id": "treeNode${node[idProp]}"}
        ${chidlens}
      }
    """
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
                "select_limit": 1,
                "json_data" : { "data":[''' + jsonTree + ''']},
                "plugins" : [ "themes", "json_data", "search", "ui"]
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
   *  @attr showClear  показывать кнопку "очистить"
   */
  def autocomplete = {attrs, body ->
    def keyId      = attrs.remove('keyId')?:generateId()
    def keyName    = attrs.remove('keyName')
    def valueId    = attrs.remove('valueId')?:generateId()
    def valueName  = attrs.remove('valueName')
    def currKey    = attrs.remove('currKey')
    def currValue  = attrs.remove('currValue')
    def controller = attrs.remove('controller')
    def minLength  = attrs.remove('minLength')?:3
    def showClear  = attrs.remove('showClear')?:true
    
    def action     = attrs.action?attrs.remove('action'):'autoCompleteJSON'
    // null не пичатаем
    if (currValue == null) currValue = ''

    if (showClear)
      out << 
        """
          <div class="input-append">
            <input type="hidden" id="${keyId}"   name="${keyName}"   value="${currKey}"/>
            <input type="text"   id="${valueId}" name="${valueName}" value="${currValue}" class="${attrs.remove('class')}"/>
            <button
              class="btn" 
              type="button"
              tabindex="-1"
              onclick="jQuery(document.getElementById('${valueId}')).val('');jQuery(document.getElementById('${keyId}')).val('');"
            ><i class="icon-remove"></i></button>
        """
    else
      out << """
        <input type="hidden" id="${keyId}"   name="${keyName}"   value="${currKey}"/>
        <input type="text"   id="${valueId}" name="${valueName}" value="${currValue}" class="${attrs.remove('class')}"/>
      """
    out <<
      """
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
      if (showClear) out << "</div>"
  }

  /**
   * Render the breadcrumbs
   */
  def breadcrumbs = {attrs ->
    def breadcrumbs  = breadCrumbsServiceProxy.getAndDestroyBreadCrumbsPath()
    def divider = grailsApplication.config.breadcrumbs.divider
    // выводим крошки, только есль навигация не активна
    out << grailsNavigation.getActivePath(request)
    if (grailsNavigation.getActiveNode(request).getRootScope().name != "mainMenu")
      out << render(
        plugin: 'groovy-breadcrumbs-plugin',
        template: "/tpl/breadcrumbs",
        model: [breadcrumbs: breadcrumbs, divider: divider]
      )
  }

  /**
   * Выводит хлебные крошки на основе Navigation API
   * код скопирован с NavigationTagLib
   */
  def breadcrumb = { attrs, body ->
    def rootName = grailsNavigation.getActiveNode(request)?.getRootScope()?.name
    if (rootName != "mainMenu")
      return
    def activePath = attrs.path?:grailsNavigation.getActivePath(request)
    def nodes = grailsNavigation.nodesForPath(activePath)
    def cssClass = attrs.class == null ? 'breadcrumb' : attrs.class
    def id = attrs.id ? " id=\"${attrs.id.encodeAsHTML()}\" " : ''

    if (!nodes) {
      return
      //TagLibUtils.warning('nav:breadcrumb', "No activation path for this request and no path attribute set, or path [${attrs.path}] cannot be resolved")
    } else {
      out << "<ul${id}"
      if (cssClass) {
          out << " class=\"${cssClass.encodeAsHTML()}\""
      }
      out << ">"
      def first = true
      int l = nodes.size()
      for (int i = 0; i < l - 1; i++) {
        def n = nodes[i]
        def linkArgsCloned = new HashMap(n.linkArgs)
        def text = g.message(code:n.titleMessageCode, default:n.titleDefault)
        out << "<li>${g.link(linkArgsCloned, text)}<span class=\"divider\">/</span></li>"
        first = false
      }
      def n = nodes[l - 1]
      def linkArgsCloned = new HashMap(n.linkArgs)
      def text = g.message(code:n.titleMessageCode, default:n.titleDefault)
      out << "<li class=\"active\">${text}</li>"
      out << "</ul>"
    }
  }

//  def modalDialog = { attrs, body ->
//    def keyId      = attrs.remove('id')?:generateId()
//    def remote     = attrs.remove('remote')
//
//    out <<
//    """
//        <script type="text/javascript" class="source">
//          jQuery('${id}').modal({
//            
//          })
//        </script>
//      """
//  }
}
