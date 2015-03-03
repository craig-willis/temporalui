package edu.gslis.temporalui

class UserQuery {

	User user
	TrecQuery query
	String notes
	
    static constraints = {
		notes(maxSize: 2048)		
    }
}
