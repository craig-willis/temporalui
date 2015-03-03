
<%@ page import="edu.gslis.temporalui.TrecCollection" %>
<!DOCTYPE html>
<html>
	<head>
		<title>${query} - ${collection.name}</title>
		<style>
			body {
    			font-family: "Arial", San-Serif;
    			margin-left: 200px;
    			margin-right: 300px;
			}
		</style>
	</head>
	<body>		
	<h2>Searching <g:link controller="search" action="index">${collection.name}</g:link></h2>
		<div style="border: none">
		  <g:form method="post">
			<g:textField style="width: 600px; height: 20px" id="query" name="query" value="${query}"/>	
			<g:hiddenField name="collectionId" value="${collection.id}"/>
			<g:actionSubmit style="font-size: large; height: 20px" action="results" value="Search" />					
	  	  </g:form>
		</div>
		<hr size=1>
		<div style="color: #606060">
		 	About ${estNumMatches} results
		</div>		
		<div id="list-results">
			
				<g:each in="${resultsList}" status="i" var="result">
				<div style="margin-top: 20px">
							<g:link controller="search" action="showDoc" id="${result.docid}" params="[collectionId: result.collectionId, docno: result.docno]">${fieldValue(bean: result, field: "title")}</g:link><br/> 
							<div style="color: green; font-size:small; margin-top: 3px; margin-bottom: 3px"><g:formatDate format="MM/dd/yyyy" date="${result.date}"/></div>
							<div style="font-size: 13px; margin: 0px; color: #606060">
								${result.snippet}
							</div>
				</div>
				</g:each>
		</div>
		<hr size=1>
		<div>	
		<g:if test="${page > 0}">				
			<span style="margin-right: 20px">	
				<g:link controller="search" action="results" 
					params="[collectionId: collection.id, query: query, nextPage: page-1]">
					Previous</g:link>
			</span>
		</g:if>
		<g:if test="${page < pages}">				
			<span>			
				<g:link controller="search" action="results" 
					params="[collectionId: collection.id, query: query, nextPage: page+1]">
					Next</g:link> 
			</span>
		</g:if>			
		</div>
	</body>
</html>
