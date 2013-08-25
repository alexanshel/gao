package org.ash.gao.ref

class ReferencesController {

    def index() {
      redirect(action: 'list')
    }
    
    def list() {
    }
    
    def test() {
      "hello world"
    }
}
