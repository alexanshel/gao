package org.ash.gao.shop

class ShopController {
  static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

  def partService

  // по умолчанию сразу редиректим на поиск (т.к. почти всегда работа начинатся с поиска)
  def index() {
    redirect(action: 'search')
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
        print(sc.oem)
        partService.getFiltred(sc, params) + [filter: flow.filter]
      }.to("displayResults")
    }
    // результат поиска
    displayResults {
      on("searchAgain").to("defaultParams")
    }
  }
 
  // добавление товара
  def newPart() {
    displayFirstParams {
      on("addCostOrAddParams")
      .to("displayLocationsParams")
    }
    displayLocationsParams() {
      on("ok").to("")
    }
  }

  // справочники
  def references() {
    
  }
}
