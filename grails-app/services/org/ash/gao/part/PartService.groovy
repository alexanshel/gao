package org.ash.gao.part

class PartService {

  static transactional = true

  def getFiltred(params) {
    def filterOEM = params.filterOEM
    def filterPartType_id = (params.filter.partType.id && params.filter.partType.id != 'null')?:null
    def filterPartKind   = (params.filter.partKind && params.filter.partKind != 'null')?:null
    def filterParamKind  = (params.filter.paramKind && params.filter.paramKind != 'null')?:null
    def filterParamValue1 = (params.filter.paramValue1 && params.filter.paramValue1 != 'null')?:null
    def filterParamValue2 = (params.filter.paramValue2 && params.filter.paramValue2 != 'null')?:null
    // if one of filter values is set
    if (filterOEM || filterPartType_id || filterPartKind || filterParamKind)  {
      def partTypeIds = []
      // filter by partTypes
      if (filterPartType_id) {
        def partType =  PartType.get(Long.parseLong(params.filterPartType_id))
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
                eq('id', Long.parseLong(params.filterPartKind))
              }
            }
          // params filter
          if (filterParamKind && filterParamValue1)
            parameters {
              and {
                kind {
                  and {
                    eq('id', Long.parseLong(filterParamKind))
                    eq('class', 'org.ash.gao.part.param.ParamKindNumber')
                  }
                }
                ge('valueNumber', Double.parseDouble(filterParamValue1))
                if (filterParamValue2)
                  le('valueNumber', Double.parseDouble(filterParamValue2))
              }
              and {
                kind {
                  and {
                    eq('id', Long.parseLong(filterParamKind))
                    eq('class', 'org.ash.gao.part.param.ParamKindString')
                  }
                }
                ge('valueString', filterParamValue1)
                if (filterParamValue2)
                  le('valueString', filterParamValue2)
              }
            }
        }
      }
      // with cross parts
      if (params.withCrosses == 'on') {
        def withCrosses = [] << parts;
        parts.each {withCrosses += (it.cross?.parts)?:[]}
        parts = withCrosses.flatten().unique()
      }
      [
        partInstanceList: parts,
        partInstanceTotal: parts.size(),
        filter: params.filter
      ]
    }
    else {
      params.max = Math.min(params.max ? params.int('max') : 10, 100)
      [partInstanceList: Part.list(params), partInstanceTotal: Part.count()]
    }
      
  }
}
