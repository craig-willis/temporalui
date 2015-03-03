
<%@ page import="edu.gslis.temporalui.TrecQuery" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'query.label', default: 'query')}" />
		<title><g:message code="query.show.label" default="Document details" /></title>
	</head>
	<body>
		<a href="#show-query" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link controller="logout" action="index">${message(code: 'logout.label', default: 'Logout')}</g:link></li>				
			</ul>
		</div>
		<div id="available-query-intro" class="content" style="margin: 20px">			
		</div>		
		<div id="show-query" class="content scaffold-show" role="main">
			<h1><g:message code="show.label"  default="Show document" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list query">				
				<li class="fieldcontain">
					<span id="docno-label" class="property-label"><g:message code="docno.label" default="DocNo" /></span>					
					<span class="property-value" aria-labelledby="docno-label"><g:fieldValue bean="${result}" field="docno"/></span>					
				</li>
				<li class="fieldcontain">
					<span id="date-label" class="property-label"><g:message code="date.label" default="Date" /></span>					
					<span class="property-value" aria-labelledby="date"><g:formatDate format="yyyy-MM-dd" date="${result.date}"/></span>					
				</li>
				<li class="fieldcontain">
					<span id="text-label" class="property-label"><g:message code="text.label" default="Text" /></span>					
					<span class="property-value" aria-labelledby="text-label">${result.text}</span>					
				</li>

							
			</ol>
		</div>
	</body>
</html>
