package org.ash.gao.part

class PartKind {
  String name

  String toString() {
    name
  }

  def beforeUpdate() {
    name = name.trim().toLowerCase().capitalize()
  }
  def beforeInsert() {
    name = name.trim().toLowerCase().capitalize()
  }
  static constraints = {
    name(unique: true)
  }
  static hasMany = [
    partTypes: PartType
  ]
}