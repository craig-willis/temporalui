
<%@ page import="edu.gslis.temporalui.TrecQuery" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'query.label', default: 'query')}" />
		<title><g:message code="query.show.label" default="Topic ${queryInstance.number}: ${queryInstance.title}" /></title>
		<tooltip:resources/>
	</head>
	<body>
		<a href="#show-query" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link controller="queries" action="index" id="${queryInstance.group.id}"><g:message code="query.list.label" default="Back to topic list" /></g:link></li>
				<g:if test="${queryInstance.id > 1}">				
					<li><g:link controller="queries" action="show" id="${queryInstance.id - 1}"><g:message code="query.previous.label" default="Previous query" /></g:link></li>
				</g:if>
				<li><g:link controller="queries" action="show" id="${queryInstance.id + 1}"><g:message code="query.next.label" default="Next query" /></g:link></li>
				<li><g:link controller="search" action="index" target="_blank">Search</g:link></li>				
				<li><g:link controller="logout" action="index">${message(code: 'logout.label', default: 'Logout')}</g:link></li>				
			</ul>
		</div>
		
		<div id="available-query-intro" class="content">
		<h1>Instructions:</h1>
		<div style="margin: 25px; font-size: 15px">
		Review the topic description and collection details then answer the questionnaire below. 
		Please pay close attention to the time constraints of the collection. It is important that you
		understand the concepts in the topic description at the time of the collection.
		If you are unfamiliar with a concept, <g:link controller="search" action="index" target="_blank">search</g:link>
		the collection, review the associated URL below, or use your favorite search engine to find out more about the topic.
		</div>
		
		</div>		
		<div id="show-query" class="content scaffold-show" role="main">
			<h1>Topic description:</h1>
			<div style="margin: 25px; font-size: 15px">
			The following topic was created for the Text REtreival Conference (TREC)
			by an assessor. Each assessor was responsible for determining whether documents returned by 
			a retrieval system are relevant to the expressed need. The topic consists
			of a short title, one sentence description, and longer narrative section. The narrative 
			is intended to provide a complete description of the criteria the assessor used to judge 
			a document's relevance.
			
			A link has been provided to an external refence (usually Wikipedia) for this topic. An estimated
			topic creation date has also been provided.
			</div>			  	  
			<ol class="property-list query">			
				<li class="fieldcontain">
					<span id="number-label" class="property-label"><g:message code="query.number.label" default="Number" /></span>					
					<span class="property-value" aria-labelledby="query-label"><g:fieldValue bean="${queryInstance}" field="number"/></span>					
				</li>
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="query.title.label" default="Title" /></span>					
					<span class="property-value" aria-labelledby="title"><g:fieldValue bean="${queryInstance}" field="title"/></span>
				</li>
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="query.description.label" default="Description" /></span>					
					<span class="property-value" aria-labelledby="description"><g:fieldValue bean="${queryInstance}" field="description"/></span>
				</li>
				<li class="fieldcontain">
					<span id="narrative-label" class="property-label"><g:message code="query.narrative.label" default="Narrative" /></span>					
					<span class="property-value" aria-labelledby="narrative"><g:fieldValue bean="${queryInstance}" field="narrative"/></span>
				</li>
				<li class="fieldcontain">
					<span id="narrative-label" class="property-label"><g:message code="query.narrative.label" default="More info" /></span>					
					<span class="property-value" aria-labelledby="narrative"><a href="${queryInstance.url}" target="_blank"><g:fieldValue bean="${queryInstance}" field="url"/></a></span>
				</li>
				<li class="fieldcontain">
					<span id="narrative-label" class="property-label"><g:message code="query.timePeriod.label" default="Year created" /></span>					
					<span class="property-value" aria-labelledby="narrative"><g:fieldValue bean="${queryGroup}" field="timePeriod"/></span>
				</li>									
			</ol>
			<h1><g:message code="collection.collections" default="Test Collection:" /></h1>	
			<div style="margin-left: 25px; margin-right: 25px; margin-top: 25px">
				This topic was originally created in the context of a TREC test collection. TREC test collections
				consist of one or more document collections, each covering distinct time periods. A description 
				of each document collection associated with this topic is provided below.
			</div>
			<ol class="property-list query">				
				<g:each in="${collections}" status="i" var="collection">
					<li class="fieldcontain">
						<span id="name-label" class="property-label"><g:message code="collection.name.label" default="Collection" /></span>					
						<span class="property-value" aria-labelledby="name"><g:fieldValue bean="${collection}" field="name"/></span>
					</li>
					<li class="fieldcontain">
						<span id="start-label" class="property-label"><g:message code="collection.start.label" default="Start date" /></span>					
						<span class="property-value" aria-labelledby="start"><g:formatDate format="MM-dd-yyyy" date="${collection.startDate}"/></br>
</span>
					</li>					
					<li class="fieldcontain">
						<span id="start-label" class="property-label"><g:message code="collection.name.label" default="End date" /></span>					
						<span class="property-value" aria-labelledby="end"><g:formatDate format="MM-dd-yyyy" date="${collection.endDate}"/></span>
					</li>					
					<li class="fieldcontain">
						<span id="desc-label" class="property-label"><g:message code="collection.desc.label" default="Description" /></span>					
						<span class="property-value" aria-labelledby="desc"><g:fieldValue bean="${collection}" field="description"/><br/><br/>
						<g:link controller="search" action="index" id="${collection.id}" params="[query: queryInstance.title]" target="_blank">Search in this collection</g:link></span>
								<g:link class="query" action="showReldocs" id="${queryInstance.id}" params="[collectionId: collection.id]"><g:message code="query.reldocs.label" default="View relevant documents" /></g:link>						
				
					</li>
					
					
					<%--li class="fieldcontain">
						<span id="plot-label" class="property-label"><g:message code="query.plot.label" default="Plot" /></span>					
						<span class="property-value" aria-labelledby="plot">
							<g:img dir="static/images/plots/" file="${collection.plot}"/><br/>						
							<g:img dir="static/images/plots/day/${collection.collectionId}" file="${queryInstance.number}.png"/><br/>
							<g:link class="query" action="search" id="${queryInstance.id}" params="[collectionId: collection.id]"><g:message code="query.results.label" default="View top 100 results" /></g:link></br>													
							<g:link class="query" action="showReldocs" id="${queryInstance.id}" params="[collectionId: collection.id]"><g:message code="query.reldocs.label" default="View relevant documents" /></g:link>						
						</span>
					</li --%>
				</g:each>							
			</ol>
			
			<h1>Answer the following questions about the topic:</h1>
			<div style="margin: 25px">
				Some topics are concerned with a very specific period in time while others are 
				concerned with broad concepts that are largely independent of time.
				Topics may refer to specific dates (e.g., 2015), concepts with known time periods (e.g., Christmas, Super Bowl),				
				specific events (e.g., Tohoku tsunami), or a general class of events (e.g., earthquakes). In some cases,
				the collection timeframe is so short that a single specific event may cover the entire collection duration.
				Keep these points in mind as you answer the questions below.
			</div>			
	   	    <g:form method="post" >
			<g:hiddenField name="id" value="${queryInstance.id}" />
			
			<div style="margin-left: 100px; margin-right: 20px">
			<table style="border: none">			
				<tr>						
					<td>
					<span>Does the topic mention any specific dates or time periods?</span>
					<div>
						<g:radioGroup name="explicitExpression"
            				labels="['Yes','No']" values="['true','false']" value="${userQuery?.explicitExpression}">
    	        			<span style="margin-left: 15px">${it.radio} <g:message code="${it.label}" /> </span>
						</g:radioGroup>	
					</div>	
					</td>				
				</tr>						
				<tr>	
					<td>
					<span>Does it refer to a specific event or set of events in the collection time period?</span>					
					<div>
              			<g:radioGroup name="eventDriven"
              				labels="['Yes','No']" values="['true','false']" value="${userQuery?.eventDriven}">
              				<span style="margin-left: 15px">${it.radio} <g:message code="${it.label}" /> </span>
						</g:radioGroup>						
					</div>	
					</td>				
				</tr>
				<tr>	
					<td>
					<span>If yes, is it a single event, two events, or more than two events?</span>					
					<div>
						<g:radioGroup name="numEvents"
              				labels="['Single event', 'Two events', 'More than two events', 'I do not know']" values="[1,2,3,0]" value="${userQuery?.numEvents}">
              				<span style="margin-left: 15px">${it.radio} <g:message code="${it.label}" /> </span>
						</g:radioGroup>						
					</div>	
					</td>				
				</tr>					
				<tr>	
					<td>
					<span>Briefly describe the event(s) and provide rough time period:</span>					
					<div>
						<g:textArea style="width:80%; height: 50px;" id="eventDesc" name="eventDesc" value="${userQuery?.eventDesc}"/>	<br/>													
					</div>	
					</td>				
				</tr>								

				<tr>	
					<td>
					<span>Classify the events based on their 
					pattern of occurrence: cyclical (like a holiday, election, or sporting event), 
					predictable (like a movie release) or random (like a natural disaster) </span>					
					<div>
						<g:radioGroup name="eventType"
              				labels="['Cyclical', 'Predictable', 'Random', 'I do not know']" values="[1,2,3,0]" value="${userQuery?.eventType}">
              				<span style="margin-left: 15px">${it.radio} <g:message code="${it.label}" /> </span><br/>
						</g:radioGroup>						
					</div>	
					</td>				
				</tr>						
				<tr>	
					<td>
					<span>Imagine that each collection is divided into four equal periods. Rank the periods
					based on how likely you are to find relevant documents during that time. You can assign the
					same ranking to multiple quadrants.</span>	
					<div>
					<g:each in="${collections}" status="i" var="collection">	
						<b>${collection.name}</b>
						<div style="margin-left: 50px">
						<g:set var="quadrants" value="${collection.getQuadrants()}" />			
						<span>
							 <g:select name="relQuadrant1" from="${1..4}" value="${userQuery?.relQuadrant1}"
	         					 	noSelection= "['':'']"/>&nbsp; ${quadrants[0]}<br/>
							 <g:select name="relQuadrant2" from="${1..4}" value="${userQuery?.relQuadrant2}"
	         					 	noSelection= "['':'']"/>&nbsp; ${quadrants[1]}<br/>
							 <g:select name="relQuadrant3" from="${1..4}" value="${userQuery?.relQuadrant3}"
	         					 	noSelection= "['':'']"/>&nbsp; ${quadrants[2]}<br/>
							 <g:select name="relQuadrant4" from="${1..4}" value="${userQuery?.relQuadrant4}"
	         					 	noSelection= "['':'']"/>&nbsp; ${quadrants[3]}<br/>
	       				</span>
	       				</div>
					</g:each>	
					</div>
					</td>					
				</tr>										
				<tr>		
					<td>
					<span>Considering the time period of the collection, how important do you think time is to the relevant documents for this query? 
					"Not important" means that relevant documents can occur at any time in the collection. "Very important" means					
					that relevant documents are highly likely to occur only at a particular time.
					</span>	
					<div>
						<g:radioGroup name="temporality"
              				labels="['Not important','Slighly important', 'Moderately imporant', 'Important', 'Very imporant']" values="[1,2,3,4,5]" value="${userQuery?.temporality}">
              				<span style="margin-left: 15px">${it.radio} <g:message code="${it.label}" /> </span><br/>
						</g:radioGroup>							
					</div>
					</td>					
				</tr>				
				<tr>	
					<td>
					<span>Do you have any comments?</span>					
					<div>						             				              				
						<g:textArea style="width:500px; height: 100px;" id="notes" name="notes" value="${userQuery?.notes}"/>	<br/>								
					</div>					
				</tr>		
				<tr><td>	<g:actionSubmit class="save" action="update" value="Save" /></td></tr>	
				</table>
 			</div>					
			  	  
			</g:form>			
		</div>
	</body>
</html>
