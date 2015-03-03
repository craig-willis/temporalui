
<%@ page import="edu.gslis.temporalui.TrecQuery" %>
<!DOCTYPE html>
<html>
	<head>
		<title>${result.docno}</title>
	</head>
	<body>
		<div>
		<table>
			<tr>
					<td width="100"><g:message code="docno.label" default="DocNo" /></td>					
					<td><g:fieldValue bean="${result}" field="docno"/></td>					
			</tr>
			<tr>
					<td><g:message code="date.label" default="Date" /></td>					
					<td><g:formatDate format="MM-dd-yyyy" date="${result.date}"/></td>					
			</tr>
					
			<tr>
					<td style="vertical-align: top"><g:message code="text.label" default="Content" /></td>					
					<td><code>${result.text}</code></td>					
			</tr>
		</table>
					

		</div>
	</body>
</html>
