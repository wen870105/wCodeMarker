<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="../header/include.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=path%>/resource/css/blueprint/screen.css" type="text/css" rel="stylesheet">
<!--[if lt IE 8]><link rel="stylesheet" href="<%=path%>/resource/css/blueprint/ie.css" type="text/css" media="screen, projection"><![endif]-->
<link href="<%=path%>/resource/css/nav.css" type="text/css" rel="stylesheet" />
</head>
<body>
<div class="container">
<h1>编辑${tm.talbeField}</h1>
<form action="<%=path%>/${tm.talbeField}.form" method="post">
<input type="hidden" name="method" value="edit">
<form:hidden path="${tm.talbeField}.id"/>
	<fieldset>
	
	<table cellspacing="0" cellpadding="0" border="0">
	<#list tm.columnMetadata as c>
		<#if c.columnName != tm.primaryKey && c.columnName != "CREATE_DATETIME"> 
		<tr>
			<td>${c.columnName}:</td>
			<td><form:input path="${tm.talbeField}.${c.columnField}" cssClass="text"/></td>
		</tr>
		</#if>
	</#list> 
	</table>
	<input type="submit">
	</fieldset>
</form>



</div>
</body>
</html>