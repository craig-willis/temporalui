
<%@ page import="edu.gslis.temporalui.TrecQuery" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'query.label', default: 'query')}" />
		<title><g:message code="query.show.label" default="Query details" /></title>
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
		<div id="available-query-intro" class="content" style="margin: 20px">
			In the box below, describes the role that time plays in the relevance of documents
			to this topic.  Questions to consider:
			<ul style="margin-left: 40px">
		    	<li>Is the topic temporally constrained? For example, does it refer to an event or set of events?
		    	<li>Are documents from all periods of time likely to be equally relevant?
		    	<li>What information did you use to come to this conclusion?
		    </ul>
		</div>		
		<div id="show-query" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list query">
			
			  <li class="fieldcontain">
				<span id="number-label" class="property-label">
					<g:message code="query.notes.label" default="Your notes" />
				</span>
			
				<span class="property-value" aria-labelledby="notes">
				  <g:form method="post" >
					<g:hiddenField name="id" value="${queryInstance.id}" />
					<fieldset class="form">
						<g:textArea style="width:500px; height: 150px;" id="notes" name="notes" value="${userQuery?.notes}"/>	<br/>		
						<g:actionSubmit class="save" action="update" value="Save" />					
					</fieldset>
			  	  </g:form>
			  	  </span>
				</li>
							
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
				<h1><g:message code="collection.collections" default="Collections" /></h1>
				
				<g:each in="${collections}" status="i" var="collection">
					<li class="fieldcontain">
						<span id="narrative-label" class="property-label"><g:message code="collection.name.label" default="Collection" /></span>					
						<span class="property-value" aria-labelledby="narrative"><g:fieldValue bean="${collection}" field="name"/></span>
					</li>
					<li class="fieldcontain">
						<span id="narrative-label" class="property-label"><g:message code="collection.desc.label" default="Description" /></span>					
						<span class="property-value" aria-labelledby="narrative"><g:fieldValue bean="${collection}" field="description"/></span>
					</li>
					
					<li class="fieldcontain">
						<span id="plot-label" class="property-label"><g:message code="query.plot.label" default="Plot" /></span>					
						<span class="property-value" aria-labelledby="plot">
							<g:img dir="static/images/plots/day/${collection.collectionId}" file="${queryInstance.number}.png"/><br/>
							<g:link class="query" action="search" id="${queryInstance.id}" params="[collectionId: collection.id]"><g:message code="query.results.label" default="View top 100 results" /></g:link></br>													
							<g:link class="query" action="showReldocs" id="${queryInstance.id}" params="[collectionId: collection.id]"><g:message code="query.reldocs.label" default="View relevant documents" /></g:link>						
						</span>
					</li>
				</g:each>
							
			</ol>
		</div>
	</body>
</html>
