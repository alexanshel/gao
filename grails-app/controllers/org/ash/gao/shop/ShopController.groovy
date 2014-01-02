package org.ash.gao.shop

import org.ash.gao.part.PartType

class ShopController {
  static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

  def partService

  // по умолчанию сразу редиректим на поиск (т.к. почти всегда работа начинатся с поиска)
  def index() {
    redirect(action: 'searchForm')
  }


  def searchForm(SearchCommand sc) {
    render(
      model: [filter: sc],
      view: 'search/displaySearchForm'
    )
  }

  def searchAction(SearchCommand sc) {
    render([
      model: partService.getFiltred(sc, params) + [filter: sc],
      view: "search/displayResults"
    ])
  }

  // поток поиска
  def searchFlow = {
    defaultParams {
      action {
        // фильтр сохраняем во flow
        [filter: flow.filter?:new SearchCommand()]
      }
      on("success").to("displaySearchForm")
    }
    displaySearchForm {
      on("search") {SearchCommand sc ->
        flow.filter = sc
        partService.getFiltred(sc, params) + [filter: flow.filter]
      }.to("displayResults")
    }
    // результат поиска
    displayResults {
      on("searchAgain").to("defaultParams")
    }
  }
 
  // добавление товара
  def newPartFlow = {
    displayFirstParams {
      on("addCostOrAddParams")
      .to("displayLocationsParams")
    }
    displayLocationsParams() {
      on("ok").to("")
    }
  }
  
  def createPart() {
    def paramsNew = [:];

    if (params?.oem) paramsNew.oemCode = params.oem
    if (params.part?.type?.id) paramsNew["type.id"] = params.part.type.id
    if (params.part?.kind?.id) paramsNew["kind.id"] = params.part.kind.id

    redirect(controller: "part", action: "create", params: paramsNew)
  }

  // справочники
  def references() {
    []
  }
}
