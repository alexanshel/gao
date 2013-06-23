package org.ash.gao.part.param


class Dict {

  Integer num
  String  name

  static constraints = {
  }
  static belongsTo = [
    paramKind: ParamKind
  ]
}
