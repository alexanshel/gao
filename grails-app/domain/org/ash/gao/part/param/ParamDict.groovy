package org.ash.gao.part.param

/**
 * @author ASh
 * Параметр типа словарь
 */
class ParamDict extends Param {

  Dict          valueDict

  String toString() {
    "${valueDict.toString()}"
  }

  static constraints = {
  }
}
