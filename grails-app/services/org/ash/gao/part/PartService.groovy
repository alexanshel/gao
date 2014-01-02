package org.ash.gao.part

import org.ash.gao.common.Manufacturer
import org.ash.gao.part.param.*

class PartService {

  static transactional = true

  def getFiltred(filter, params) {
    //def filter = params.filter
    def filterOEM = filter.oem
    def filterPartType_id = filter.partType?.id
    def filterPartKind   =  filter.partKind?.id
    def filterParamKind  =  filter.paramKind?.id
    def filterParamValue1 = filter.paramValue1
    def filterParamValue2 = filter.paramValue2
    // if one of filter values is set
    if (filterOEM || filterPartType_id || filterPartKind || filterParamKind)  {
      def partTypeIds = []
      // filter by partTypes
      if (filterPartType_id) {
        def partType =  PartType.get(filterPartType_id)
        partTypeIds = [partType.id] + partType.childsAll*.id
      }
      def filterOEMTrunc = filterOEM?.toLowerCase()?.replaceAll("\\W", '')
      // getting result
      def parts = Part.withCriteria {
        and {
	      if (filterOEMTrunc)
            ilike('codeTrunc', '%' + filterOEMTrunc + '%')
          if (filterPartType_id)
            type {'in'('id', partTypeIds)}
          if (filterPartKind)
            type {
              kind {
                eq('id', filterPartKind)
              }
            }
          // params filter
          if (filterParamKind && filterParamValue1) {
            def paramKind = ParamKind.get(filterParamKind)
            parameters {
              if (paramKind instanceof ParamKindNumber) {
                and { 
                  kind { and {
                    eq('id', filterParamKind)
                    eq('class', 'org.ash.gao.part.param.ParamKindNumber')
                  }}
                  ge('valueNumber', Double.parseDouble(filterParamValue1))
                  if (filterParamValue2)
                    le('valueNumber', Double.parseDouble(filterParamValue2))
                }
              }
              else if (paramKind instanceof ParamKindString) {
                and {
                  kind { and {
                    eq('id', filterParamKind)
                    eq('class', 'org.ash.gao.part.param.ParamKindString')
                  }}
                  ge('valueString', filterParamValue1)
                  if (filterParamValue2)
                    le('valueString', filterParamValue2)
                }
              }
            }
          }
        }
      }
      // with cross parts
      if (filter.withCrosses) {
        def withCrosses = [] << parts;
        parts.each {withCrosses += (it.cross?.parts)?:[]}
        parts = withCrosses.flatten().unique()
      }
      [
        partInstanceList: parts,
        partInstanceTotal: parts.size()
      ]
    }
    else {
      params.max = 20 //Math.min(params.max ? params.int('max') : 10, 100)
      [partInstanceList: Part.list(params), partInstanceTotal: Part.count()]
    }
      
  }

  def completeAssign(Part part) {
    Manufacturer manufacturer = part.manufacturer
    if (manufacturer && !manufacturer.id && manufacturer.name) {
      // получили производителя без идентификатора,
      // пытаемся найти его, нормализовав строку
      // если удалось найти, подставляем найденый объект
      Manufacturer foundMan = Manufacturer.findByNameIlike(manufacturer.name.trim().toLowerCase())
      if (foundMan) part.manufacturer = foundMan
    }
  }

  def getParamKindClassMap() {
    def map = [:]
    ParamKind.list().each {
      map += ["${it.id}":it.class.simpleName]
    }
    map
  }
}
