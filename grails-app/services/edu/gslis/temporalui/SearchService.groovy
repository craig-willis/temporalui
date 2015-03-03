package edu.gslis.temporalui


class SearchService {
	
	def runQuery(String collection, String query) {
		// Open an indri index wrapper, run the query, return the results
	}
	
	def plotResults(String collection, List<SearchResult> results) {
		// Generate a PNG image of the results density over time.
	}
}
