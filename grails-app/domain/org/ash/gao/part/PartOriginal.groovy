package org.ash.gao.part

class PartOriginal extends Part {

    def beforeInsert = {
        if (!appliedTo?.contains(car))
            addToAppliedTo(car)
    }

    static constraints = {
        manufacturer(
            validator: {manuf, partOrig ->
                return partOrig.car.model.manufacturer == manuf
            }
        )
    }
}
