package temporalui

import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

import edu.gslis.indexes.*
import edu.gslis.searchhits.SearchHit
import edu.gslis.searchhits.SearchHits
import edu.gslis.temporalui.SearchResult
import edu.gslis.temporalui.TrecCollection
import edu.gslis.temporalui.TrecQrels
import edu.gslis.temporalui.TrecQuery
import edu.gslis.temporalui.TrecQueryGroup
import edu.gslis.temporalui.UserQuery

class QueriesController {

	def springSecurityService
	
	def index() {
		def user = springSecurityService.getCurrentUser()
		def config = SpringSecurityUtils.securityConfig
		if (user)
		{
			def queryGroup = TrecQueryGroup.get(params.id)
			def queries = TrecQuery.findAllByGroup(queryGroup, [sort:"id"])
			//Set<TrecCollectionQueryGroup> groups = TrecCollectionQueryGroup.findAllByCollection(collection);
			//Set<TrecQuery> queries = new HashSet<TrecQuery>()
			//for (TrecCollectionQueryGroup group: groups) {
			//	TrecQueryGroup queryGroup = group.getGroup();
			// queries.addAll(TrecQuery.findAllByGroup(queryGroup))
			//}
			
			def userQueries = UserQuery.findByUser(user)
			Set<Long> queryIds = new HashSet<Long>()			
			for (UserQuery userQuery: userQueries) {
				queryIds.add(userQuery.query.id)
			}
			
			[queryList: queries, querySize: queries.size(), queryGroup: queryGroup.id, userQueries: queryIds]
		}
		else
		{
			redirect (controller: 'login', action: 'index')
		}
	}		
	
	def show(Long id) {
		def query = TrecQuery.get(id);
		def queryGroup = query.getGroup();		
		def collections =  queryGroup.getCollections().sort{it.id};
		
		def user = springSecurityService.getCurrentUser()
		
		def userQuery = UserQuery.findByUserAndQuery(user, query)
		
		[queryInstance: query, collections: collections, userQuery: userQuery, queryGroup: queryGroup]
	}
	
	def search(Long id) {
		def query = TrecQuery.get(id)
		def collection = TrecCollection.get(params.collectionId)
		def page = params.page
		def indexPath = collection.getPath();
		IndexWrapper index = IndexWrapperFactory.getIndexWrapper(indexPath)
		def queryText = query.getTitle();
		queryText = queryText.replaceAll("\\p{Punct}", " ")
		SearchHits hits = index.runQuery(queryText.toLowerCase(), 10, 0, true)
		Iterator<SearchHit> it = hits.iterator()
		List<SearchResult> results = new ArrayList<SearchResult>();
		while (it.hasNext()) {
			SearchHit hit = it.next()
			SearchResult result = new SearchResult();
			result.setDocno(hit.getDocno());
			long epoch = (long)(hit.getMetadataValue("epoch"));
			result.setEpoch(epoch);
			result.setDate(new Date(epoch*1000));
			result.setScore(hit.getScore());
			result.setDocid(hit.getDocID());
			result.setCollectionId(collection.id);
			
			/*def text = index.getDocText(hit.getDocID());
			if (text.length() > 300) {
				text = text.substring(0, 300);
			}*/
			result.setSnippet(hit.getSnippet())			
			results.add(result)
		}
		
		[resultsList: results.sort {-it.score}, query: query]
	}
	
	def showReldocs(Long id) {
		def query = TrecQuery.get(id)
		def queryGroup = query.getGroup();
		
		def collection = TrecCollection.get(params.collectionId)
		def indexPath = collection.getPath();
		IndexWrapper index = IndexWrapperFactory.getIndexWrapper(indexPath)
		def qrelsPath = TrecQrels.findByGroupAndCollection(queryGroup, collection)
		BufferedReader br = new BufferedReader(new FileReader(qrelsPath.getPath()))
		String line
		List<String> relDocs = new ArrayList<String>()
		List<SearchResult> results = new ArrayList<SearchResult>();
		
		while ((line = br.readLine()) != null) {
			//301 0 LA010290-0076 0
			String[] fields = line.split(" ");
			if (fields[0].equals(query.getNumber()) && !fields[3].equals("0")) {
				relDocs.add(fields[2])
			}
		}
		for (String relDoc: relDocs) {
			SearchHit hit = index.getSearchHit(relDoc, null);
			SearchResult result = new SearchResult();
			result.setDocno(relDoc);
			long epoch = (long)(hit.getMetadataValue("epoch"));
			result.setEpoch(epoch);
			result.setDate(new Date(epoch*1000));
			result.setScore(hit.getScore());
			result.setDocid(hit.getDocID());
			result.setCollectionId(collection.id);

			def text = index.getDocText(hit.getDocID());
			if (text.length() > 300) {
				text = text.substring(0, 300);
			}
			result.setSnippet(text)
			
			results.add(result)
		}
		
		[resultsList: results.sort {it.epoch}, query: query]
	}
	
	
	def update(Long id) {
		def query = TrecQuery.get(id)
		def user = springSecurityService.getCurrentUser()
		def userQuery = UserQuery.findByUserAndQuery(user, query)
		if (!userQuery)
			userQuery = new UserQuery(user: user, query: query)
		userQuery.setExplicitExpression(params.boolean("explicitExpression"))
		userQuery.setEventDriven(params.boolean("eventDriven"))
		if (params.numEvents)
			userQuery.setNumEvents(params.int("numEvents"))
		userQuery.setEventType(params.int("eventType"))
		userQuery.setTemporality(params.int("temporality"))
		userQuery.setRelQuadrant1(params.int("relQuadrant1"))
		userQuery.setRelQuadrant2(params.int("relQuadrant2"))
		userQuery.setRelQuadrant3(params.int("relQuadrant3"))
		userQuery.setRelQuadrant4(params.int("relQuadrant4"))
		userQuery.setEventDesc(params.eventDesc)
		userQuery.setNotes(params.notes)
		userQuery.save()
		
		redirect (controller: "queries", action: 'show', id: id+1)
		
	}
	
	def showDoc(Long id) {
		def collection = TrecCollection.get(params.collectionId)
		def docno = params.docno
		def indexPath = collection.getPath();
		IndexWrapper index = IndexWrapperFactory.getIndexWrapper(indexPath)
		SearchHit hit = index.getSearchHit(docno, null);
		def text = index.getDocText(hit.getDocID());
		SearchResult result = new SearchResult()
		result.setDocno(docno);
		long epoch = (long)(hit.getMetadataValue("epoch"));
		result.setEpoch(epoch);
		result.setDate(new Date(epoch*1000));
		result.setScore(hit.getScore());
		result.setDocid(hit.getDocID());
		result.setCollectionId(collection.id);
		result.setText(text.replaceAll("\n", "<BR/>"));
		
		[result: result]

	}
}
