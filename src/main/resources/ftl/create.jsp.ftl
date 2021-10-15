<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>wen</title>
</head>
<body>
<div class="container">
<h1>创建${tm.tableName}</h1>
<form action="{baseUrl.merchantBaseUrl}action/${tm.tableNameWithoutPrefix}/create" method="post">
<input type="hidden" name="method" value="create">
<fieldset>
<table cellspacing="0" cellpadding="0" border="0">
<#list tm.columnMetadata as c>
	<tr>
		<td>${c.columnName}:</td>
		<td><input type="text" class="text" name="${c.javaAttr}" value="" /></td>
	</tr>
</#list> 
</table>
<input type="submit" value="保存">
</fieldset>
</form>
</div>

</body>
</html>