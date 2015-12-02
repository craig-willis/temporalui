
<%@ page import="edu.gslis.temporalui.TrecCollection" %>
<!DOCTYPE html>
<html>
	<head>
		<title>Search</title>
		<style>
			body {
    			font-family: "Arial", San-Serif;
    			margin-left: 200px;
    			margin-right: 200px;
			}
		</style>		
	</head>
	<body>
		<div style="text-align: center; margin-top: 200px">
			<g:img  dir="static/images/" file="indri.jpg" height="150px" style="opacity: 0.8; margin-bottom: 20px" alt="Indri"/>
		  <g:form method="post">
				<g:textField style="margin-left: 110px; width: 500px; font-size: 15px" id="query" name="query" value="${query}"/>	
				<g:select style="font-size: 15px" name="collectionId" from="${collections}" optionKey="id" value="${collectionId}"/><br/>
				<g:actionSubmit style="font-size: 30px; margin-top: 15px" action="results" value="Search" />					
	  	  </g:form>
		</div>
	</body>
</html>
