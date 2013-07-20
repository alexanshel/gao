import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils
 
def loggedIn = { -> 
    springSecurityService.principal instanceof String
}
def loggedOut = { -> 
    !(springSecurityService.principal instanceof String)
}
def isAdmin = { -> 
    SpringSecurityUtils.ifAllGranted('ROLE_ADMIN')
}

navigation = {
    user {
        home(controller:'shop')
        login(controller:'login', action:'index', visible: loggedOut) 
        logout(controller:'logout', action:'index', visible: loggedIn)
    }
     
    //admin {
    //    superUserStuff controller:'admin', visible: isAdmin
   // }
}