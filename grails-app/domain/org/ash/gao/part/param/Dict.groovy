package org.ash.gao.part.param

import org.ash.gao.IGAOReference

class Dict implements IGAOReference {

  Integer num
  String  name

  static constraints = {
  }
  static belongsTo = [
    paramKind: ParamKind
  ]
}
