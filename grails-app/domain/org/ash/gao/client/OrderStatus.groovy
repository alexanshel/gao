package org.ash.gao.client

class OrderStatus {
    String name

    static hasMany = [orders: ClientOrder]
    static constraints = {
    }
}
