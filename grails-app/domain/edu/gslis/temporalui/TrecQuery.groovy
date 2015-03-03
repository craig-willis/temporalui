package edu.gslis.temporalui

class TrecQuery {
	
	String number;
	String title;
	String description;
	String narrative;
	TrecQueryGroup group;

    static constraints = {
		narrative(maxSize: 2048)
		description(maxSize: 2048)
    }
	
	static mapping = {
		sort "number"
	}
	
	String toString() {
		return title;
	}

	def show(Long id) {
		def query = TrecQuery.get(id)
		if (!query) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'query.label', default: 'Query'), id])
			redirect(action: "list")
			return
		}

		[queryInstance: query]
	}
}
