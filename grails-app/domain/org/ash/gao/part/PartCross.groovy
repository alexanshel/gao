package org.ash.gao.part

class PartCross {
    
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
