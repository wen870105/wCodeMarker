<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="resource/css/blueprint/screen.css" type="text/css" rel="stylesheet">
<!--[if lt IE 8]><link rel="stylesheet" href="resource/css/blueprint/ie.css" type="text/css" media="screen, projection"><![endif]-->
<link href="resource/css/nav.css" type="text/css" rel="stylesheet" />
</head>
<body>
<div class="container">
<h1>创建</h1>
<!-- <form action="admin.form" method="post"> -->
<input type="hidden" name="method" value="create">
<fieldset>
姓名:<input type="text" name="name" value="" /><br />
描述:<input type="text" name="description" value="" /><br />
类型:<input type="text" name="type" value="" /><br />
<input type="submit">
</fieldset>
<!-- </form> -->
</div>
</body>
</html>