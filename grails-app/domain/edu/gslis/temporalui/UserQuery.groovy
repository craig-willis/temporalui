package edu.gslis.temporalui

class UserQuery {

	User user
	TrecQuery query
	String notes
	
	// Does the information need contain explicit temporal expressions?
	boolean explicitExpression = false;
	
	// Does the information need refer to an event or series of events?
	boolean eventDriven = false;
	// If so, how many events?
	int numEvents = 0;
	
	String eventDesc;
	
	int eventType = 0;
	
	// Where Do you think that relevant results are more likely to be found?
	int relQuadrant1 = 0;
	int relQuadrant2 = 0;
	int relQuadrant3 = 0;
	int relQuadrant4 = 0;
	
	// How temporal is this query?
	int temporality = 0;
	
    static constraints = {
		notes(maxSize: 2048, nullable:true, blank:true)	
		explicitExpression(nullable:false, blank:false)
		eventDriven(nullable:false, blank:false)
		numEvents(nullable:false, blank:false)
		eventDesc(nullable:true, blank:true)
		eventType(nullable:false, blank:false)
		relQuadrant1(nullable:false, blank:false)
		relQuadrant2(nullable:false, blank:false)
		relQuadrant3(nullable:false, blank:false)
		relQuadrant4(nullable:false, blank:false)
		temporality(nullable:false, blank:false)		
    }
}
