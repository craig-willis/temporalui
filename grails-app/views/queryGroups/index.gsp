
<%@ page import="edu.gslis.temporalui.TrecCollection" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'querygroup.label', default: 'Available query groups')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-person" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link controller="logout" action="index">${message(code: 'logout.label', default: 'Logout')}</g:link></li>
			</ul>
		</div>
		<div id="available-collections-intro" class="content" style="margin: 20px; font-size: 15px">
			Each year since 1992, NIST has developed test collections for the evaluation of
			information retrieval systems through the Text REtreival Conference (TREC). Test collections
			consist of a set of documents, topics, and relevance judgments.  Below are links to 
			topic sets created for many of the test collections since 1992. 
			
			For each topic set, you will be asked to review each topic and answer a set of questions.			
		</div>
		<div id="list-collections" class="content scaffold-list" role="main">
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			
			<table>
				<thead>
					<tr>
						<g:sortableColumn property="name" title="${message(code: 'querygroup.name.label', default: 'Topic set')}" />								
						<g:sortableColumn property="description" title="${message(code: 'querygroup.description.label', default: 'Description')}" />
						<g:sortableColumn property="created" title="${message(code: 'querygroup.created.label', default: 'Created')}" />
						<g:sortableColumn property="progress" title="${message(code: 'querygroup.progress.label', default: 'Progress')}" />								
					</tr>
				</thead>
				<tbody>
				<g:each in="${queryGroupList}" status="i" var="queryGroup">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">	
						<td><g:link controller="queries" action="index" id="${queryGroup.id}">${fieldValue(bean: queryGroup, field: "name")}</g:link></td>
						<td>${fieldValue(bean: queryGroup, field: "description")}</td>
						<td>${fieldValue(bean: queryGroup, field: "timePeriod")}</td>
						<td>
							<div style="border: 1px solid black; width: 100px; height: 10px">
								<div style="background: green; height: 10px; width: ${completed.get(queryGroup.id)}px">&nbsp;</div>
							</div>
							(${completed.get(queryGroup.id)}%)
						</td>
					</tr>
				</g:each>
				</tbody>
			</table>
		</div>
	</body>
</html>
