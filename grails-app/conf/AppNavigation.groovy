import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils
 
def loggedIn = { -> 
    springSecurityService.currentUser != null
}
def loggedOut = { ->
    springSecurityService.currentUser == null
    //!(springSecurityService.principal instanceof String)
}
def isAdmin = { -> 
    SpringSecurityUtils.ifAllGranted('ROLE_ADMIN')
}

navigation = {
    mainMenu {
        //home(controller:'shop', action: 'search', visible: loggedIn)
        shop(controller:'shop', action: 'searchForm', visible: loggedIn) {
          searchResult(controller: 'shop', action: 'searchAction')
          add(controller: 'part', action: 'create')
          edit(controller: 'part', action: 'edit')
        }
        references(visible: loggedIn, controller:'shop', action: 'references') {
          manufacturer(controller: 'manufacturer', action: 'list') {
            create()
            edit()
          }
          location(controller: 'location', action: 'list') {
            create()
            edit()
          }
          paramKind(controller: 'paramKind', action: 'list') {
            create()
            edit()
          }
          partType(controller: 'partType', action: 'tree') {
            create()
            edit()
          }
        }
        login( controller: 'login',  action: 'index', visible: loggedOut)
        logout(controller: 'logout', action: 'index', visible: loggedIn)
    }
     
    //admin {
    //    superUserStuff controller:'admin', visible: isAdmin
   // }
}