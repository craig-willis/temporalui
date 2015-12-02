package temporalui

import edu.gslis.indexes.IndexWrapper
import edu.gslis.indexes.IndexWrapperFactory
import edu.gslis.searchhits.SearchHit
import edu.gslis.searchhits.SearchHits
import edu.gslis.temporalui.SearchResult
import edu.gslis.temporalui.TrecCollection


class SearchController {

    def index(long id) {		
		
		def query = params.query
		def collections = TrecCollection.findAll() 
		[collections: collections, collectionId: id, query: query]
	}
	
	def results() {
		def queryText = params.query
		def collection = TrecCollection.get(params.collectionId)
		
		def page = params.int("nextPage") ? params.int("nextPage") : 0
		def indexPath = collection.getPath();
		IndexWrapper index = IndexWrapperFactory.getIndexWrapper(indexPath)
		index.setTitleFieldName(collection.getTitleField());
		index.setTimeFieldName("epoch");
		queryText = queryText.replaceAll("\\p{Punct}", " ")
		SearchHits hits = index.runQuery(queryText.toLowerCase(), 10, 10*page, true)
		Iterator<SearchHit> it = hits.iterator()
		List<SearchResult> results = new ArrayList<SearchResult>();
		int estNumMatches = hits.getNumMatches()
		int pages = estNumMatches/10;
		while (it.hasNext()) {
			SearchHit hit = it.next()
			SearchResult result = new SearchResult();
			result.setDocno(hit.getDocno());
			long epoch = (long)(hit.getMetadataValue("epoch"));
			String title = hit.getMetadataValue(collection.getTitleField());
			result.setEpoch(epoch);
			result.setTitle(title);
			result.setDate(new Date(epoch*1000));
			result.setScore(hit.getScore());
			result.setDocid(hit.getDocID());
			result.setCollectionId(collection.id);
			result.setSnippet(hit.getSnippet())
			results.add(result)
		}
		
		[resultsList: results.sort {-it.score}, query: queryText, 
			collection: collection, page: page, pages: pages,
			estNumMatches: estNumMatches]
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
