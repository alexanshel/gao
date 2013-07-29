package org.ash.gao.part

import org.ash.gao.IGAODomain

class PartCross implements IGAODomain {
    
    String name

    String toString() {
        id
    }

    static hasMany = [
        parts: Part
    ]

    static constraints = {
        name()
        parts()
    }
}
