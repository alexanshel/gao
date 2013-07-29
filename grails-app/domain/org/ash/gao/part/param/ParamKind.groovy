package org.ash.gao.part.param

import org.ash.gao.IGAOReference

class ParamKind implements IGAOReference {
  String    name

  String toString() {
    name
  }

  static constraints = {
    name(unique: true)
  }
}
