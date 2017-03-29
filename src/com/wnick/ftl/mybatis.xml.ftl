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
	
	<resultMap id="${className}-Map" type="${package}.domain.${className}">
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
	
	<select id="getById_" resultMap="${className}-Map">
		select * from ${tableName} where id = #${'{'?upper_case}value}
	</select>
	
	<sql id="querySql">
		select * from ${tableName}
		<where>
    	<#list tm.columnMetadata as c>
			<if test="${c.javaAttr} != null and ${c.javaAttr} != '' ">
				and ${c.columnName} = #${'{'?upper_case}${c.javaAttr}}
			</if>
		</#list>
		</where>
	</sql>
	
	<select id="findOne_" resultMap="${className}-Map" parameterType="${className}">
		<include refid="querySql"/> order by id desc limit 1
	</select>
	
	<select id="findList_" resultMap="${className}-Map" parameterType="${className}">
		<include refid="querySql"/>
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
			where id = #${'{'?upper_case}id}
	</update>

	<select id="queryPageCount" resultType="int" parameterType="${className}">
		select count(1) from (
			<include refid="querySql"/>
		) tmp
	</select>
	
	<select id="queryPage" resultMap="${className}-Map" parameterType="${className}">
		<include refid="querySql"/>
		limit #${'{'?upper_case}start}, #${'{'?upper_case}offset}
	</select>

</mapper>