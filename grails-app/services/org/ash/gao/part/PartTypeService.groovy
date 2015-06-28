package org.ash.gao.part

class PartTypeService {

  static transactional = true

  /**
   * Подчищает типы, которые уже не используются
   * (на форме создания товара новый тип создаётся автоматически, при необходимости)
   */
  def cleanupPartTypes() {
    // получаем типы у которых нет деталей
    def types = PartType.withCriteria {
      and {
        isEmpty("parts")
      }
    }
    log.info("Part types to delete: " + types.size())
    // удаляем все
    types.each {
      it.delete(flush: true)
    }

  }
}
