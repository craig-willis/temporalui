package temporalui

import edu.gslis.temporalui.TrecCollection
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

class CollectionsController {

	def springSecurityService
	
    def index() { 
		def user = springSecurityService.getCurrentUser()
		def config = SpringSecurityUtils.securityConfig
		if (user) 
		{
			Set<TrecCollection> collections = TrecCollection.findAll();

			[collectionList: collections, collectionSize: collections.size()]
		}
		else
		{
			redirect (controller: 'login', action: 'index')
		}		
	}
		
}
