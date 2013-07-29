/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package org.ash.gao.shop

import org.ash.gao.part.PartType
import org.ash.gao.part.PartKind
import org.ash.gao.part.param.ParamKind
/**
 *
 * @author ash
 */
@grails.validation.Validateable
class SearchCommand implements Serializable {
  String    oem
  PartType  partType    = new PartType(id: null, name: '')
  PartKind  partKind    = new PartKind(id: null, name: '')
  ParamKind paramKind   = new ParamKind(id: null, name: '')
  boolean   withCrosses = true
  String    paramValue1
  String    paramValue2
  
  static constraints = {}
  
  public String toString() {
    """
    oem=${oem};partType=${partType};partKind=${partKind};paramKind=${paramKind};
    withCrosses=${withCrosses};paramValue1=${paramValue1};paramValue2=${paramValue2}
    """
  }
}

