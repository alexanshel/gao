package org.ash.gao.part.param

class ParamNumber extends Param {

  Double          valueNumber

  String toString() {
    "${valueNumber.toString()}"
  }

  String getValue() {
    valueNumber
  }

  void setValue(value) {
    setValueNumber(value)
  }
  
  static constraints = {
    kind(validator: {it instanceof ParamKindNumber})
  }
}
