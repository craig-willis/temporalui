package edu.gslis.temporalui

class TrecCollection 
{
	
	String collectionId;
	String name;
	String description;
	String path;
	String titleField;
	
	static mapping = {
		sort 'name':'asc'
	}
	
    static constraints = {
		titleField nullable: true
    }
	
	String toString() {
		return name;
	}
	
}
