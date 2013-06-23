package org.ash.gao.car

class FuelType implements org.ash.gao.IGAOReference {

    String name

    String toString() {
        name
    }

    static constraints = {
        name(unique: true)
    }
}
