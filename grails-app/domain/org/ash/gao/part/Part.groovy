package org.ash.gao.part

import org.ash.gao.common.*;
import org.ash.gao.part.param.*;
import org.ash.gao.IGAODomain

class Part implements IGAODomain {
    String    oemCode //код производителя
    PartType  type
    String    codeTrunc // усеченный код производителя 
                     //(нижний регистр букв, убраны пробелы ",", "-",
    List<PartLocation> locations
    List<Param>        parameters
    // наличие на складе
    def getQty() {
      //toList()?.
      locations?.sum {it.qty}
    }
    def getCrossQty() {
      (cross?.parts - [this])?.collect {it?.locations*.qty.sum()?:0}?.sum()
    }
    String toString() {
        "${oemCode} ${type} ${manufacturer?.name}"
    }
    def beforeInsert() {
      oemCode = oemCode.trim()
      codeTrunc = oemCode
        .toLowerCase()
        .replaceAll("\\s+", '')
    }
    def beforeUpdate() {
      oemCode = oemCode.trim()
      codeTrunc = oemCode
        .toLowerCase()
        .replaceAll("\\s+", '')
    }
    static transients = ["qty", "crossQty"]
    static hasMany = [
        locations: PartLocation,
        parameters: Param
    ]
    
    static belongsTo = [
        manufacturer: Manufacturer,
        type:  PartType,
        cross: PartCross
    ]
    static constraints = {
         oemCode(unique: ['manufacturer'])
         type(nullable: false)
         manufacturer(nullable: false)
         locations(nullable: true)
         cross(nullable: true)
         codeTrunc(nullable: true)
    }
    static mapping = {
      locations cascade: "all-delete-orphan"
      parameters cascade: "all-delete-orphan"
      manufacturer cascade: "all-delete-orphan"
      type cascade: "all-delete-orphan"
    }
}
