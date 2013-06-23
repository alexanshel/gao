package org.ash.gao.common

class Country {
    String name

    String toString() {
        name
    }
    
    static constraints = {
        name(unique: true)
    }
}
