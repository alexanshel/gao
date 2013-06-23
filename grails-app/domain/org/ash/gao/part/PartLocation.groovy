package org.ash.gao.part

class PartLocation implements Comparable {
  Location location
  Integer  qty
  Double   priceIn
  Double   priceOut
  boolean deleted
  

  String toString() {
    "${location.name} [${qty}]"
  }
  static belongsTo = [
    part: Part, 
    location: Location
  ]
  static constraints = {
    part()
    location(unique:["part"])
    qty()
    priceIn(nullable: true)
    priceOut(nullable: true)
  }
  
  static transients = ['deleted']
  
  int compareTo(obj) {
    location.name.toLowerCase().trim() <=> obj.name.toLowerCase().trim()
  }

}
