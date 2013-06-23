package org.ash.gao.client

class OrderDetailStatus {
    String name

    static hasMany = [orderDetails: OrderDetail]
    static constraints = {
    }
}
