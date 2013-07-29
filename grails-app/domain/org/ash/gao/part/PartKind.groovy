package org.ash.gao.part

import org.ash.gao.IGAOReference

class PartKind implements IGAOReference {
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