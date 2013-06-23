package org.ash.gao.part.param

import org.apache.tools.ant.types.resources.selectors.InstanceOf;

class ParamString extends Param {

  String valueString

  String getValue() {
    valueString
  }

  void setValue(value) {
    this.valueString = value
  }
  
  String toString() {
    "${valueString.toString()}"
  }

  static constraints = {
    kind(validator: { it.kind instanceof ParamKindString })
  }
}
