package org.ash.gao.car

import org.ash.gao.common.Manufacturer

class CarModel {
    String name

    String toString() {
        name
    }

    static belongsTo = [
        manufacturer: Manufacturer
    ]

    static hasMany = [
      cars: Car
    ]

    static constraints = {
        name(unique: true)
        manufacturer()
        cars(nullable: true)
    }
}
