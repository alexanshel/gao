package org.ash.gao.common

class Image {
  byte[] data
  String name
  
  static constraints = {
    name(nullable: true)
    data(size: 0..1024*1024*5)
  }
}
