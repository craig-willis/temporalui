
<%@ page import="edu.gslis.temporalui.TrecQuery" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'query.label', default: 'query')}" />
		<title><g:message code="query.show.label" default="Query details" /></title>
		<tooltip:resources/>
	</head>
	<body>
		<a href="#show-query" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link controller="queries" action="index" id="${queryInstance.group.id}"><g:message code="query.list.label" default="Back to query list" /></g:link></li>
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
		<div style="margin: 25px">
		Review the information need and collection details then answer the questionnaire below. 
		Pay close attention to the time constraints of the collection.  It is important that you
		understand the concepts in the information need at the time of the collection.
		If you are unfamiliar with a concept, <g:link controller="search" action="index" target="_blank">search</g:link>
		the collection, review the associated URL below, or find out about it using your favorite search engine.

		</div>
		
		</div>		
		<div id="show-query" class="content scaffold-show" role="main">
			<h1>Information need:</h1>
			  	  
			<ol class="property-list query">
			
			  <li class="fieldcontain">
							
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
			</ol>
			<h1><g:message code="collection.collections" default="Collections:" /></h1>			
			<ol class="property-list query">				
				<g:each in="${collections}" status="i" var="collection">
					<li class="fieldcontain">
						<span id="narrative-label" class="property-label"><g:message code="collection.name.label" default="Collection" /></span>					
						<span class="property-value" aria-labelledby="narrative"><g:fieldValue bean="${collection}" field="name"/></span>
					</li>
					<li class="fieldcontain">
						<span id="narrative-label" class="property-label"><g:message code="collection.desc.label" default="Description" /></span>					
						<span class="property-value" aria-labelledby="narrative"><g:fieldValue bean="${collection}" field="description"/><br/><br/>
						<g:link controller="search" action="index" id="${collection.id}" params="[query: queryInstance.title]" target="_blank">Search this collection</g:link></span>
					</li>
					
					
					<%-- >li class="fieldcontain">
						<span id="plot-label" class="property-label"><g:message code="query.plot.label" default="Plot" /></span>					
						<span class="property-value" aria-labelledby="plot">
							<g:img dir="static/images/plots/day/${collection.collectionId}" file="${queryInstance.number}.png"/><br/>
							<g:link class="query" action="search" id="${queryInstance.id}" params="[collectionId: collection.id]"><g:message code="query.results.label" default="View top 100 results" /></g:link></br>													
							<g:link class="query" action="showReldocs" id="${queryInstance.id}" params="[collectionId: collection.id]"><g:message code="query.reldocs.label" default="View relevant documents" /></g:link>						
						</span>
					</li--%>
				</g:each>							
			</ol>
			
			<h1>Answer the following questions about this information need:</h1>
			
	   	    <g:form method="post" >
			<g:hiddenField name="id" value="${queryInstance.id}" />
			
			<div style="margin-left: 100px; margin-right: 20px">
			<table style="border: none">			
				<tr>							
					<td width="200px">
					<span>Does it contain any <a href=""></span>explicit temporal expressions</a>?</span>
					</td><td>					
					<span>
						<g:radioGroup name="explicitExpression"
            				labels="['Yes','No']" values="['true','false']" value="${userQuery?.explicitExpression}">
    	        			<span style="margin-left: 15px">${it.radio} <g:message code="${it.label}" /> </span>
						</g:radioGroup>	
					</span>	
					</td>				
				</tr>				
				<tr>							
					<td>
					<span>Does it contain any <a href="">implicit temporal expressions</a>?</span>	
					</td><td>					
					<span>
						<g:radioGroup name="implicitExpression"
              				labels="['Yes','No']" values="['true','false']" value="${userQuery?.explicitExpression}">
              				<span style="margin-left: 15px">${it.radio} <g:message code="${it.label}" /> </span>
						</g:radioGroup>		
					</span>	
					</td>				
				</tr>				
				<tr>							
					<td>
						<span>Does it refer to specific <a href="">events</a>?</span>
					</td><td>							
					<span>
              			<g:radioGroup name="eventDriven"
              				labels="['Yes','No']" values="['true','false']" value="${userQuery?.eventDriven}">
              				<span style="margin-left: 15px">${it.radio} <g:message code="${it.label}" /> </span>
						</g:radioGroup>						
					</span>	
					</td>				
				</tr>				
				<tr>							
					<td>
					<span style="margin-left: 15px">If yes, is it a single event, two events, or more than two events?</span>					
					</td><td>	
					<span>
						<g:radioGroup name="numEvents"
              				labels="['1', '2', 'More than 2']" values="[1,2,3]" value="${userQuery?.numEvents}">
              				<span style="margin-left: 15px">${it.radio} <g:message code="${it.label}" /> </span>
						</g:radioGroup>						
					</span>	
					</td>				
				</tr>		
				<tr>							
					<td>
					<span>Imagine that the collection is divided into four equal quadrants. Rank the quadrants
					based on how likely you are to find a relevant document at that time.</span>	
					</td><td>					
					<span>
						 <g:select name="relQuadrant1" from="${1..4}" value="${userQuery?.relQuadrant1}"
         					 	noSelection= "['':'']"/>&nbsp; Quadrant 1<br/>
						 <g:select name="relQuadrant2" from="${1..4}" value="${userQuery?.relQuadrant1}"
         					 	noSelection= "['':'']"/>&nbsp; Quadrant 2<br/>
						 <g:select name="relQuadrant3" from="${1..4}" value="${userQuery?.relQuadrant1}"
         					 	noSelection= "['':'']"/>&nbsp; Quadrant 3<br/>
						 <g:select name="relQuadrant4" from="${1..4}" value="${userQuery?.relQuadrant1}"
         					 	noSelection= "['':'']"/>&nbsp; Quadrant 4<br/>
       				</span>
					</td>					
				</tr>										
				<tr>							
					<td>
					<span>How important is time to the relevant documents for this query?</span>	
					</td><td>					
					<span>
						<g:radioGroup name="temporality"
              				labels="['0','1', '2', '3', '4']" values="[0,1,2,3,4]" value="${userQuery?.temporality}">
              				<span style="margin-left: 15px">${it.radio} <g:message code="${it.label}" /> </span>
						</g:radioGroup>							
					</span>
					</td>					
				</tr>				
				<tr>							
					<td>
					<span>Comments?</span>					
					<span>						             				              				
						<g:textArea style="width:500px; height: 100px;" id="notes" name="notes" value="${userQuery?.notes}"/>	<br/>								
					</span>					
				</tr>		
				<tr><td colspan=2>	<g:actionSubmit class="save" action="update" value="Save" /></td></tr>	
				</table>
 			</div>					
			  	  
			</g:form>			
		</div>
	</body>
</html>
