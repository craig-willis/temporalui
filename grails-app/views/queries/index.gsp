
<%@ page import="edu.gslis.temporalui.TrecCollection" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'queries.label', default: 'Available queries')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link controller="logout" action="index">${message(code: 'logout.label', default: 'Logout')}</g:link></li>
				<li><g:link controller="search" action="index">Search</g:link></li>
			</ul>
		</div>
		<div id="available-queries-intro" class="content" style="margin: 20px">
			Below is a list of topics in this topic set. For each topic, review the provided 
			information to determine whether time plays a role in whether documents are relevant.
		    Consider the following questions:
		    <ul style="margin-left: 40px">
		    	<li>Are documents from certain periods of time more (or less) relevant than others?
		    	<li>Are documents from all periods of time likely to be equally relevant?
		    	<li>Does the topic title, description or narrative refer to a specific event or set of events?
		    </ul>		    
		</div>
		<div id="list-queries" class="content scaffold-list" role="main">
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			
			<table>
				<thead>
					<tr>
						<g:sortableColumn property="name" title="${message(code: 'query.name.label', default: 'Name')}" />					
						<g:sortableColumn property="title" title="${message(code: 'query.title.label', default: 'Title')}" />					
					</tr>
				</thead>
				<tbody>
				<g:each in="${queryList}" status="i" var="query">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">	
						<td><g:link controller="queries" action="show" id="${query.id}">${fieldValue(bean: query, field: "number")}</g:link></td>
						<td>${fieldValue(bean: query, field: "title")}</td>
					</tr>
				</g:each>
				</tbody>
			</table>
		</div>
	</body>
</html>
