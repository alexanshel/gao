package org.ash.gao.part

import org.ash.gao.part.param.*;
import org.ash.gao.IGAODomain

class PartType implements IGAODomain {
  String name

  String toString() {
    return name
  }

  static belongsTo = [
    kind  : PartKind
  ]
  static hasMany = [
    parts     : Part,
    paramKinds: ParamKind
  ]
  static constraints = {
    name(unique: true)
    kind(nullable: true)
  }
  static mapping = {
    sort name: "asc"
  }
}
