
<%@ page import="edu.gslis.temporalui.TrecCollection" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'collections.label', default: 'Available collections')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-person" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link controller="logout" action="index">${message(code: 'logout.label', default: 'Logout')}</g:link></li>
			</ul>
		</div>
		<div id="available-collections-intro" class="content">
			List of collections
		</div>
		<div id="list-collections" class="content scaffold-list" role="main">
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			
			<table>
				<thead>
					<tr>
						<g:sortableColumn property="name" title="${message(code: 'collection.name.label', default: 'Name')}" />					
						<g:sortableColumn property="description" title="${message(code: 'collection.description.label', default: 'Description')}" />					
					</tr>
				</thead>
				<tbody>
				<g:each in="${collectionList}" status="i" var="collection">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">	
						<td><g:link controller="queries" action="index"  params="${[collectionId:collection.id]}">${fieldValue(bean: collection, field: "name")}</g:link></td>
						<td>${fieldValue(bean: collection, field: "description")}</td>
					</tr>
				</g:each>
				</tbody>
			</table>
		</div>
	</body>
</html>
