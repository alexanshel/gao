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
        shop(controller:'shop', action: 'search', visible: loggedIn)
        references(visible: loggedIn) {
           partTypes(controller:'shop', action: 'search', visible: loggedIn)
           params(controller:'param', action: 'index', visible: loggedIn)
        }
        login(controller:'login', action:'index', visible: loggedOut) 
        logout(controller:'logout', action:'index', visible: loggedIn)
    }
     
    //admin {
    //    superUserStuff controller:'admin', visible: isAdmin
   // }
}