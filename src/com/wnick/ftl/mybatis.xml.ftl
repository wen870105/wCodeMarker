<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
	"http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<!--
	${tm.tableComment}	
	@author ${author}
 	@since ${date} 
 	生成工具备注:ID大写的为BaseDao方法提供通用方法,如果不需要就删除
-->
<mapper namespace="${package}.dao.${className}Dao">
	
	<resultMap id="${className}-Map" type="${className}">
		<#list tm.columnMetadata as c>
		<result property="${c.javaAttr}" column="${c.columnName}"/>
		</#list>
	</resultMap>
	
	<insert id="add_" keyProperty="id" useGeneratedKeys="true">	
		insert into ${tableName}
		(<#list tm.columnMetadata as c> ${c.columnName}<#if c_has_next>,</#if></#list>) 
		values
		(<#list tm.columnMetadata as c> #${'{'?upper_case}${c.javaAttr}}<#if c_has_next>,</#if></#list>)
	</insert>
	
	<select id="get_" resultMap="${className}-Map">
		select * from ${tableName} where id = #${'{'?upper_case}value}
	</select>
	
	<select id="findList_" resultMap="${className}-Map" parameterType="${className}Query">
		select * from ${tableName}
		<where>
    	<#list tm.columnMetadata as c>
			<if test="${c.javaAttr} != null and ${c.javaAttr} != '' ">
				and ${c.columnName} = #${'{'?upper_case}${c.javaAttr}}
			</if>
		</#list>
		</where>
	</select>
	
	<update id="update_" parameterType="${className}">
		update ${tableName} 
			<set>
			<#list tm.columnMetadata as c>
			<if test="${c.javaAttr} != null and ${c.javaAttr} != '' ">
				${c.columnName} = #${'{'?upper_case}${c.javaAttr}},
			</if>
			</#list>
			</set>
	</update>

</mapper>