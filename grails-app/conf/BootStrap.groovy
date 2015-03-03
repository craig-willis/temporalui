import edu.gslis.temporalui.TrecCollection
import edu.gslis.temporalui.TrecQrels
import edu.gslis.temporalui.TrecQuery
import edu.gslis.temporalui.TrecQueryGroup
import edu.gslis.temporalui.User


class BootStrap {

    def init = { servletContext ->
		
		def basePath = "/Users/cwillis/dev/uiucGSLIS/temporalui"
		//def basePath = "/home/willis8/temporalui"
		
		new User(username: "willis8", password: "test", enabled: true, accountExpired: false, 
			accountLocked: false, passwordExpired: false, email: "willis8@illinois.edu").save(failOnError: true)

		// Check whether the test data already exists.
		if (!TrecCollection.count()) {
			TrecCollection ap = new TrecCollection(
				collectionId: "ap",
				description: "Associated Press (1988 - 1989)",
				name: "Associated Press",
				path: basePath + "/indexes/ap.temporal.title",
				titleField: "headline"
			).save(failOnError: true)
			
			TrecCollection latimes = new TrecCollection(
					collectionId: "latimes", 
					description: "Los Angeles Times (1989-1990)",
					name: "Los Angeles Times",
					path: basePath + "/indexes/latimes.temporal"
				).save(failOnError: true)
				
			TrecCollection ft = new TrecCollection(
					collectionId: "ft",
					description: "Financial Times 1991 - 1994",
					name: "Financial Times",
					path: basePath + "/indexes/ft.temporal"
				).save(failOnError: true)
				
			TrecCollection tweets2011 = new TrecCollection(
				collectionId: "tweets2011",
				description: "Microblog 2011",
				name: "Microblog 2011",
				path: basePath + "/indexes/tweets2011.temporal"
			).save(failOnError: true)
			
			TrecCollection blog06 = new TrecCollection(
				collectionId: "blog06",
				description: "The University of Glasgow collected Blog06 documents by polling 100,649 RSS and Atom feeds over an 11 week period (December 6, 2005 - February 21, 2006)",
				name: "Blog06",
				path: basePath + "/indexes/blog06.temporal"
			).save(failOnError: true)

			
			TrecQueryGroup trec1 = new TrecQueryGroup(name: "topics.51-100",
					description: "Topics 51-100 (TREC1)"
				).save(failOnError: true)
				readTopics(basePath + "/topics/topics.51-100", trec1)
			trec1.addToCollections(ap).save(failOnError: true)
			
			new TrecQrels(
				path: basePath + "/qrels/qrels.ap.51-100",
				collection: ap,
				group: trec1,
				).save(failOnError: true)
							
			TrecQueryGroup trec2 = new TrecQueryGroup(name: "topics.101-150",
					description: "Topics 101-150 (TREC2)"
				).save(failOnError: true)
				readTopics(basePath + "/topics/topics.101-150", trec2)
			trec2.addToCollections(ap).save(failOnError: true)
			
			new TrecQrels(
				path: basePath + "/qrels/qrels.ap.101-150",
				collection: ap,
				group: trec2,
				).save(failOnError: true)

			TrecQueryGroup trec3 = new TrecQueryGroup(name: "topics.151-200",
					description: "Topics 151-200 (TREC3)"
				).save(failOnError: true)
				readTopics(basePath + "/topics/topics.151-200", trec3)
			trec3.addToCollections(ap).save(failOnError: true)
			
			new TrecQrels(
				path: basePath + "/qrels/qrels.ap.151-200",
				collection: ap,
				group: trec3,
				).save(failOnError: true)
						
		
			TrecQueryGroup trec6 = new TrecQueryGroup(name: "topics.301-350", 
				description: "Topics 301-350 (TREC6)"
			).save(failOnError: true)
			readTopics(basePath + "/topics/topics.301-350", trec6)
			trec6.addToCollections(latimes).save(failOnError: true)
			trec6.addToCollections(ft).save(failOnError: true)
			
			new TrecQrels(
				path: basePath + "/qrels/qrels.latimes.301-350",
				collection: latimes,
				group: trec6,
			).save(failOnError: true)
			
			new TrecQrels(
				path: basePath + "/qrels/qrels.ft.301-350",
				collection: ft,
				group: trec6,
			).save(failOnError: true)
			
			TrecQueryGroup trec7 = new TrecQueryGroup(name: "topics.351-400", 
				description: "Topics 351-400 (TREC7)"
			).save(failOnError: true)
			readTopics(basePath + "/topics/topics.351-400", trec7)
			trec7.addToCollections(latimes).save(failOnError: true)
			trec7.addToCollections(ft).save(failOnError: true)
			new TrecQrels(
				path: basePath + "/qrels/qrels.latimes.351-400",
				collection: latimes,
				group: trec7,
				).save(failOnError: true)
			new TrecQrels(
				path: basePath + "/qrels/qrels.ft.351-400",
				collection: ft,
				group: trec7,
			).save(failOnError: true)
									
			TrecQueryGroup trec8 = new TrecQueryGroup(name: "topics.401-450", 
				description: "Topics 401-450 (TREC8)"
			).save(failOnError: true)
			readTopics(basePath + "/topics/topics.401-450", trec8)			
			trec8.addToCollections(latimes).save(failOnError: true)
			trec8.addToCollections(ft).save(failOnError: true)

			TrecQueryGroup b06 = new TrecQueryGroup(name: "topics.851-1050",
				description: "Topics 851-1050 (Blog06)"
			).save(failOnError: true)
			readTopics(basePath + "/topics/06-08.all-blog-topics", b06)
			b06.addToCollections(blog06).save(failOnError: true)
			
			new TrecQrels(
				path: basePath + "/qrels/qrels.latimes.401-450",
				collection: latimes,
				group: trec8,
			).save(failOnError: true)
			new TrecQrels(
				path: basePath + "/qrels/qrels.ft.401-450",
				collection: ft,
				group: trec8,
			).save(failOnError: true)
			
			TrecQueryGroup tw2011 = new TrecQueryGroup(name: "topics.tweets2011",
				description: "Topics MB1-50"
			).save(failOnError: true)
			readIndriTopics(basePath + "/topics/topics.microblog2011.indri", tw2011)
			tw2011.addToCollections(tweets2011).save(failOnError: true)
			new TrecQrels(
				path: basePath + "/qrels/qrels.microblog2011",
				collection: tweets2011,
				group: tw2011,
			).save(failOnError: true)

			new TrecQrels(
				path: basePath + "/qrels/08.qrels.positive.all-topics",
				collection: blog06,
				group: b06,
			).save(failOnError: true)
				

		}		
    }
    def destroy = {
    }
	
	def readTopics(String path, TrecQueryGroup group) throws Exception {
		BufferedReader br = new BufferedReader(new FileReader(path));
		String line;
		String field = "";
		String value = "";
		Map<String, String> fields = new HashMap<String, String>();
		while ((line = br.readLine()) != null) {

			if (line.startsWith("<")) {
				fields.put(field, value.replaceAll("  *", " "));
				if (line.startsWith("</top>")) {
					String num = fields.get("num").replaceAll("Number:", "").trim();
					String title = fields.get("title").replaceAll("Title:", "").replaceAll("Topic:", "").trim();
					String desc = fields.get("desc").replaceAll("Description:", "").trim();
					String narr = fields.get("narr").replaceAll("Narrative:", "").trim();
					new TrecQuery(number: num, title: title, description: desc, 
						narrative: narr, group: group).save(failOnError: true);
				}
				else if (!line.startsWith("<top>")) {
					field = line.substring(1, line.indexOf(">"));
					value = line.substring(line.indexOf(">") + 1, line.length());
					value = value.replaceAll("</num>", "")
					value = value.replaceAll("</title>", "")
					
				}
			}
			else {
				value += " " + line;
			}
		}
		br.close();
	}
	
	def readIndriTopics(String path, TrecQueryGroup group) throws Exception {
		BufferedReader br = new BufferedReader(new FileReader(path));
		String line;
		String field = "";
		String value = "";
		Map<String, String> fields = new HashMap<String, String>();
		while ((line = br.readLine()) != null) {

			if (line.startsWith("<")) {
				fields.put(field, value.replaceAll("  *", " "));
				if (line.startsWith("</query>")) {
					String num = fields.get("number").replaceAll("</number>", "").trim();
					String title = fields.get("text").replaceAll("</text>", "").trim();
					String desc = "";
					String narr = "";
					new TrecQuery(number: num, title: title, description: desc,
						narrative: narr, group: group).save(failOnError: true);
				}
				else if (!line.startsWith("<query>")) {
					field = line.substring(1, line.indexOf(">"));
					value = line.substring(line.indexOf(">") + 1, line.length());
				}
			}
			else {
				value += " " + line;
			}
		}
		br.close();
	}
	
}

