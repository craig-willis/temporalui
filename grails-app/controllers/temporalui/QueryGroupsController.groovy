package temporalui

import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

import edu.gslis.temporalui.TrecQueryGroup

class QueryGroupsController {

	def springSecurityService
	
    def index() { 
		def user = springSecurityService.getCurrentUser()
		def config = SpringSecurityUtils.securityConfig
		if (user) 
		{
			def queryGroups = TrecQueryGroup.findAll([sort:"id"])

			[queryGroupList: queryGroups, listSize: queryGroups.size()]
		}
		else
		{
			redirect (controller: 'login', action: 'index')
		}		
	}
		
}
