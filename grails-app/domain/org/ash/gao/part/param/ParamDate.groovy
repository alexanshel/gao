package org.ash.gao.part.param

class ParamDate extends Param {

  Date          valueDate

  String toString() {
    "${valueDate.toString()}"
  }

  String getValue() {
    valueDate
  }

  void setValue(value) {
    this.valueDate = value
  }

  static constraints = {
  }
}
