
<%@ page import="edu.gslis.temporalui.TrecCollection" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'queries.label', default: 'Search results')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link controller="logout" action="index">${message(code: 'logout.label', default: 'Logout')}</g:link></li>
				<li><g:link controller="queries" action="show" id="${query.id}"><g:message code="query.detais.label" default="Back to query details" /></g:link>				
			</ul>
		</div>
		<div id="available-queries-intro" class="content" style="margin: 20px">
			Below are all of the judged relevant documents for query ${query.getNumber()}: "${query.getTitle()}", ordered by publication date.
			Click on the document number to view the complete document text.
		</div>
		<div id="list-results" class="content scaffold-list" role="main">
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			
			<table>
				<thead>
					<th>
						<g:message code="reldocs.label" default="Relevant documents" />
					</th>
				</thead>
				<tbody>
				<g:each in="${resultsList}" status="i" var="result">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">	
						<td>
							<g:link controller="queries" action="showDoc" id="${result.docid}" params="[collectionId: result.collectionId, docno: result.docno]">${fieldValue(bean: result, field: "docno")}</g:link> 
							(<g:formatDate format="yyyy-MM-dd" date="${result.date}"/>)</br>
							<div style="font-size: 13px; margin: 10px">${fieldValue(bean: result, field: "snippet")}...</div>
						</td>
					</tr>
				</g:each>
				</tbody>
			</table>
		</div>
	</body>
</html>
