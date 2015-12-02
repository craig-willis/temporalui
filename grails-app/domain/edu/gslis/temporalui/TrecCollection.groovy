package edu.gslis.temporalui

import java.text.DateFormat
import java.text.SimpleDateFormat


class TrecCollection 
{
	
	String collectionId;
	String name;
	String description;
	String path;
	String titleField;
	String plot;
	Date startDate;
	Date endDate;
	
	static mapping = {
		sort 'name':'asc'
	}
	
    static constraints = {
		titleField nullable: true
    }
	
	String toString() {
		return name;
	}
	
	String[] getQuadrants() {
		String fmt = "MM/dd/yyyy";
		String[] quadrants = new String[4];
		int diff = endDate.minus(startDate)/4;
		Date d1 = startDate.plus(diff);
		Date d2 = d1.plus(diff);
		Date d3 = d2.plus(diff);
		quadrants[0] = startDate.format(fmt)  + "-" + d1.format(fmt);
		quadrants[1] = d1.format(fmt)  + "-" + d2.format(fmt);
		quadrants[2] = d2.format(fmt)  + "-" + d3.format(fmt);
		quadrants[3] = d3.format(fmt)  + "-" + endDate.format(fmt);
	
		return quadrants;		
	}
	
}
