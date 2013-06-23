package org.ash.gao.car

class Transmission {
    String  code
    Integer gearsQty

    String toString() {
        "${code} ${type.name} ${gearsQty} п."
    }

    static belongsTo = [
        type: TransmissionType,
         car: Car
    ]
    static constraints = {
        code()
        type()
        gearsQty()
    }
}
