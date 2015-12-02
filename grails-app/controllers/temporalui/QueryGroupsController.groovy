package temporalui

import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

import edu.gslis.temporalui.TrecQuery
import edu.gslis.temporalui.TrecQueryGroup
import edu.gslis.temporalui.UserQuery

class QueryGroupsController {

	def springSecurityService
	
    def index() { 
		def user = springSecurityService.getCurrentUser()
		def config = SpringSecurityUtils.securityConfig
		if (user) 
		{
			def queryGroups = TrecQueryGroup.findAll([sort:"id"])
			
			Map<Integer, Integer> completed = new HashMap<Integer, Integer>();
			for (TrecQueryGroup group: queryGroups) {
				Set<TrecQuery> queries = TrecQuery.findAllByGroup(group)
				def done = 0;
				def total = queries.size();
				for (TrecQuery query: queries) {
					def userQuery = UserQuery.findByQuery(query)
					if (userQuery) 
						done++;
				}
				completed.put(group.id, Math.round((done/total)*100))
			}

			[queryGroupList: queryGroups, listSize: queryGroups.size(), completed: completed]
		}
		else
		{
			redirect (controller: 'login', action: 'index')
		}		
	}
		
}
