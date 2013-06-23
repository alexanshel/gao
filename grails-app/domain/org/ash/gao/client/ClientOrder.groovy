package org.ash.gao.client

class ClientOrder {
    Integer     id
    Date        dateCreated
    Date        dateClose
    Client      client
    OrderStatus status

    static hasMany = [orderDetails: OrderDetail]
    static belongsTo = [client: Client]
    static constraints = {
    }
}
