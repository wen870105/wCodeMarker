<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
	"http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<!--
	${tm.tableComment}	
	@author ${author}
 	@since ${date} 
-->
<mapper namespace="${package}.dao.${className}Dao">
	
	<resultMap id="${className}-Map" type="${package}.domain.${className}">
		<#list tm.columnMetadata as c>
		<result property="${c.javaAttr}" column="${c.columnName}"/>
		</#list>
	</resultMap>
	
	
	
	
	
	
</mapper>