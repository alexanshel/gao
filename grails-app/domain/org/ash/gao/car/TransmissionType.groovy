package org.ash.gao.car

class TransmissionType {

    String name

    String toString() {
        name
    }

    static constraints = {
        name(unique: true)
    }
}
