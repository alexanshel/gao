package org.ash.gao.car

import org.ash.gao.client.Client;
import org.ash.gao.common.*

class Car {
    Date         dateBegin
    Date         dateEnd
    Engine       engine
    Transmission transmission
    Country      country
    String       vinCode

    String toString() {
      "${model} ${dateBegin.format('MM-yy')}-${dateEnd.format('MM-yy')} ${engine}"
    }

    static belongsTo = [
      model:  CarModel,
      client: Client
    ]

    static hasMany = [
    ]

    static constraints = {
        model()
        dateBegin()
        dateEnd()
        engine()
        transmission()
        country()
    }
    //static embedded = [
    //    'engine'
    //]
}