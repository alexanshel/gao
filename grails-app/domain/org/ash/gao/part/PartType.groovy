package org.ash.gao.part

import org.ash.gao.part.param.*;

class PartType {
    PartType parent
    String   name

    String toString() {
        if (parent != null)
          return "${name}"
        return name
    }
    def getChildsAll() {
      def tmp = []
      tmp = tmp + this.childs
      childs?.each {tmp = tmp + it.childsAll}
      tmp
    }
    static transients = ["childsAll"]
    static belongsTo = [
      parent: PartType,
      kind: PartKind
    ]
    static hasMany = [
      parts: Part,
      childs: PartType,
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
