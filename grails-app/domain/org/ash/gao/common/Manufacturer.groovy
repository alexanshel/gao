package org.ash.gao.common

class Manufacturer implements org.ash.gao.IGAOReference {

  String  name

  void setName(String name) {
    // лишние пробелы не нужны
    this.name = name?.trim()
  }

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
