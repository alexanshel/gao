package org.ash.gao.client

import org.ash.gao.car.Car;
import org.ash.gao.common.Image;

class Client {
  String    firstName
  String    middleName
  String    lastName
  String    phone
  SortedSet images

  static hasMany = [
    cars: Car,
    orders: ClientOrder,
    images: Image
  ]
  static constraints = {
    firstName()
    middleName()
    lastName()
    phone()
    images()
  }
}
