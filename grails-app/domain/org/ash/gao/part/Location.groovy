package org.ash.gao.part

class Location implements org.ash.gao.IGAOReference {
  String   name
  String   url
  Location parent

  String toString() {
    if (parent != null)
      return "${name}(${parent})"
    else
      return "${name}"
  }

  static belongsTo = [parent: Location]
  static constraints = {
      parent()
      name(unique: true)
      url(nullable: true, maxSize: 200)
  }
  static mapping = {
    sort(name: "asc")
  }
}
