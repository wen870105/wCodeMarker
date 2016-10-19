<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="../header/include.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>管理列表</title>
<link href="<%=path%>/resource/css/blueprint/screen.css" type="text/css" rel="stylesheet">
<!--[if lt IE 8]><link rel="stylesheet" href="<%=path%>/resource/css/blueprint/ie.css" type="text/css" media="screen, projection"><![endif]-->
<link href="<%=path%>/resource/css/nav.css" type="text/css" rel="stylesheet" />
</head>

<body>
<div class="container">
<h1>${tm.talbeField}列表</h1>
<table cellspacing="0" cellpadding="0" border="0">
	<thead>
	<tr>
	<#list tm.columnMetadata as c> 
		<th class="">${c.columnName}</th>
	</#list>
		<th class="">操作</th>
	</tr> 
	</thead>
	<tbody>
		<c:forEach items="${r"${page.list}"}" var="a" varStatus="status">
			<tr <c:if test="${r"${status.index % 2 != 0}"}">class="even"</c:if>>
			<#list tm.columnMetadata as c> 
				<td>${r"${a."}${c.columnField} ${"}"}</td>
			</#list>
				<td><a href="${tm.talbeField}.form?method=preEdit&id=${r"${a.id}"}">编辑</a></td>
			</tr>

		</c:forEach>
	</tbody>
</table>
<div><n:nav pageIndex="${r"${page.pageIndex}"}"
	pageSize="${r"${page.pageSize}"}" navigationUrl="admin.form"
	recordCount="${r"${page.totalCount}"}" /></div>

<br>
<a href="${tm.talbeField}/${tm.talbeField}Create.jsp">新建</a> <br>


</div>
</body>
</html>