package org.ash.gao.common

class Manufacturer implements org.ash.gao.IGAOReference {
  String  name

  String toString() {
    name
  }
  static constraints = {
    name(unique: true)
  }
  static mapping = {
    sort name: "asc"
  }
}
