package org.ash.gao.client

import org.ash.gao.part.Location;
import org.ash.gao.part.Part;

class OrderDetail {
    Part              part
    Location          location
    String            code
    Integer           qty
    Double            price
    Date              dateCreated
    OrderDetailStatus status

    static belongsTo = [order: ClientOrder]
    static constraints = {
    }
}
