package org.ash.gao.car

class Engine {
    String   code
    Double   volume
    Integer  valveQty
    Boolean  turbo
    FuelType fuel

    String toString() {
        code
    }

    static constraints = {
        code(unique: true)
        fuel()
        volume()
        valveQty()
        turbo()
    }
}
