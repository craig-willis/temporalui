package edu.gslis.temporalui

class TrecQueryGroup {
	String name;
	String description;
	List collections;
	static hasMany = [collections: TrecCollection]

    static constraints = {
    }
	
	static mapping = {
		sort "name"
	}
	
	
}
