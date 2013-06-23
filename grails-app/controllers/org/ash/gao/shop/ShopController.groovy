package org.ash.gao.shop

class ShopController {
  static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
  static navigation = [
    [group: 'shop', order: 1, action: 'search',     title: 'search', path: 'searchResult'],
    [group: 'shop', order: 2, action: 'newPart',    title: 'newPart'],
    [group: 'shop', order: 3, action: 'references', title: 'references']
  ]

  def partService

  // по умолчанию сразу редиректим на поиск (т.к. почти всегда работа начинатся с поиска)
  def index() {
    redirect(action: 'search')
  }

  // поиск товара
  def search() {
    // дефолтные значения фильтра
    params.filter = params.filter?:[
      OEM: '',
      partType: [id: '', name: ''],
      partKind: '',
      withCrosses: true,
      paramKind: ''
    ]
    [filter: params.filter]
  }

  // результат поиска
  def searchResult() {
    partService.getFiltred(params)
  }
  
  // добавление товара
  def newPart() {
    
  }

  // справочники
  def references() {
    
  }
}
