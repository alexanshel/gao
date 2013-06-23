package org.ash.gao.part.param

class ParamKind {
  String    name

  String toString() {
    name
  }

  static constraints = {
    name(unique: true)
  }
}
