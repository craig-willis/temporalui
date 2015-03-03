
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
		<div id="available-collections-intro" class="content" style="margin: 20px">
		 	Select from the list of TREC topic sets below.  For each topic in the 
		 	set, note whether the topic has any sort of time-based or temporal relevance.
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
					</tr>
				</thead>
				<tbody>
				<g:each in="${queryGroupList}" status="i" var="queryGroup">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">	
						<td><g:link controller="queries" action="index" id="${queryGroup.id}">${fieldValue(bean: queryGroup, field: "name")}</g:link></td>
						<td>${fieldValue(bean: queryGroup, field: "description")}</td>
					</tr>
				</g:each>
				</tbody>
			</table>
		</div>
	</body>
</html>
