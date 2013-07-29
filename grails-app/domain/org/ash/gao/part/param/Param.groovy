package org.ash.gao.part.param

import groovy.beans.Bindable;

import org.ash.gao.part.Part;
import org.ash.gao.IGAOReference

class Param implements IGAOReference {

  ParamKind kind
  Double    valueNumber
  Date      valueDate
  String    valueString
  boolean   deleted

  String getValue() {
    if (kind?.instanceOf(ParamKindNumber))
      return valueNumber.toString();
    else if (kind?.instanceOf(ParamKindString))
      return valueString
    else if (kind?.instanceOf(ParamKindDate))
      return valueDate.toString()
    else 
      return null;
  }
  
  void setValue(String value) {
    if (kind?.instanceOf(ParamKindNumber))
      valueNumber = Double.parseDouble(value)
    else if (kind?.instanceOf(ParamKindString))
      valueString = value
    else if (kind?.instanceOf(ParamKindDate))
      valueDate = value
    else 
      return null;
  }
  
  String toString() {
    value
  }
  
  static transients = ["value", "deleted"]
  
  static constraints = {
    kind(nullable: false)
    value(bindable: true)
    valueNumber(nullable: true)
    valueString(nullable: true)
    valueDate(nullable: true)
  }
  static belongsTo = [
    part: Part
  ]
}
