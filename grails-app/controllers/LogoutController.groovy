import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

class LogoutController {
  static springSecurityService
  static navigation = [
    [ 
	  group:  'main', 
	  title: 'logout', 
	  action: 'index',
	  order: 99, 
	  isVisible: { springSecurityService.currentUser != null  }
    ]
  ]
	/**
	 * Index action. Redirects to the Spring security logout uri.
	 */
	def index = {
		// TODO  put any pre-logout code here
		redirect uri: SpringSecurityUtils.securityConfig.logout.filterProcessesUrl // '/j_spring_security_logout'
	}
}
