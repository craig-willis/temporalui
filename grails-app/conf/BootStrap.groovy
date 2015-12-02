import java.text.DateFormat

import java.text.SimpleDateFormat

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

		DateFormat df = new SimpleDateFormat("MM/dd/yyyy");
		// Check whether the test data already exists.
		if (!TrecCollection.count()) {
			TrecCollection ap = new TrecCollection(
				collectionId: "ap",
				description: "This collection consists of 242,918 Associated Press newswire articles covering the period from 2/11/1988 through 12/31/1990",
				name: "Associated Press",
				path: basePath + "/indexes/ap.temporal.title",
				plot: "ap.png",
				titleField: "headline",
				startDate: df.parse("2/11/1988"),
				endDate: df.parse("12/31/1990")
			).save(failOnError: true)
			
			TrecCollection latimes = new TrecCollection(
					collectionId: "latimes", 
					description: "Los Angeles Times (1989-1990)",
					name: "Los Angeles Times",
					plot: "latimes.png",					
					path: basePath + "/indexes/latimes.temporal",
					startDate: df.parse("1/1/1989"),
					endDate: df.parse("12/31/1990")	
				).save(failOnError: true)
				
			TrecCollection ft = new TrecCollection(
					collectionId: "ft",
					description: "Financial Times 1991 - 1994",
					name: "Financial Times",
					plot: "ft.png",					
					path: basePath + "/indexes/ft.temporal",
					startDate: df.parse("4/15/1991"),
					endDate: df.parse("12/31/1994")
				).save(failOnError: true)
				
			TrecCollection tweets2011 = new TrecCollection(
				collectionId: "tweets2011",
				description: "Microblog 2011",
				name: "Microblog 2011",
				plot: "tweets2011.png",				
				path: basePath + "/indexes/tweets2011.temporal",
				startDate: df.parse("1/24/2011"),
				endDate: df.parse("2/8/2011")
			).save(failOnError: true)
			
			TrecCollection blog06 = new TrecCollection(
				collectionId: "blog06",
				description: "The University of Glasgow collected Blog06 documents by polling 100,649 RSS and Atom feeds over an 11 week period (December 6, 2005 - February 21, 2006)",
				name: "Blog06",
				plot: "blog06.png",				
				path: basePath + "/indexes/blog06.temporal",
				startDate: df.parse("12/6/2005"),
				endDate: df.parse("2/21/2006")
			).save(failOnError: true)

			
			TrecQueryGroup trec1 = new TrecQueryGroup(
					name: "topics.51-100",
					description: "Topics 51-100 (TREC1)",
					timePeriod: "1992"
				).save(failOnError: true)
				readTopics(basePath + "/topics/topics.51-100", trec1)
			trec1.addToCollections(ap).save(failOnError: true)
			
			new TrecQrels(
				path: basePath + "/qrels/qrels.ap.51-100",
				collection: ap,
				group: trec1,
				).save(failOnError: true)
							
			TrecQueryGroup trec2 = new TrecQueryGroup(name: "topics.101-150",
					description: "Topics 101-150 (TREC2)",
					timePeriod: "1993"					
				).save(failOnError: true)
				readTopics(basePath + "/topics/topics.101-150", trec2)
			trec2.addToCollections(ap).save(failOnError: true)
			
			new TrecQrels(
				path: basePath + "/qrels/qrels.ap.101-150",
				collection: ap,
				group: trec2,
				).save(failOnError: true)

			TrecQueryGroup trec3 = new TrecQueryGroup(name: "topics.151-200",
					description: "Topics 151-200 (TREC3)",
					timePeriod: "1994"
				).save(failOnError: true)
				readTopics(basePath + "/topics/topics.151-200", trec3)
			trec3.addToCollections(ap).save(failOnError: true)
			
			new TrecQrels(
				path: basePath + "/qrels/qrels.ap.151-200",
				collection: ap,
				group: trec3,
				).save(failOnError: true)
						
		
			TrecQueryGroup trec6 = new TrecQueryGroup(name: "topics.301-350", 
				description: "Topics 301-350 (TREC6)",
					timePeriod: "1997"				
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
				description: "Topics 351-400 (TREC7)",
				timePeriod: "1998"
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
				description: "Topics 401-450 (TREC8)",
				timePeriod: "1999"
			).save(failOnError: true)
			readTopics(basePath + "/topics/topics.401-450", trec8)			
			trec8.addToCollections(latimes).save(failOnError: true)
			trec8.addToCollections(ft).save(failOnError: true)

			TrecQueryGroup b06 = new TrecQueryGroup(name: "topics.851-1050",
				description: "Topics 851-1050 (Blog06)",
				timePeriod: "2006-2008"
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
				description: "Topics MB1-50",
				timePeriod: "2011-2012"
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
				
			readTopicUrls(basePath + "/topic_urls.txt");
		}		
    }
    def destroy = {
    }
	
	def readTopicUrls(String path) {
		BufferedReader br = new BufferedReader(new FileReader(path));
		String line;
		while ((line = br.readLine()) != null) {
			String[] fields = line.split(",");
			String topicNum = fields[0];
			String url = fields[2];
			
			TrecQuery query = TrecQuery.findByNumber(topicNum)
			if (query) {
				query.setUrl(url)
			}
		}			
		br.close();
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

