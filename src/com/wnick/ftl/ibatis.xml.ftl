<?xml version="1.0" encoding="UTF-8"?>	
<!DOCTYPE sqlMap 
    PUBLIC "-//iBATIS.com//DTD SQL Map 2.0//EN" 
    "http://ibatis.apache.org/dtd/sql-map-2.dtd">	
	
<!--当前所有属性(方便查看)：	
	select 	
		<#list tm.columnMetadata as c> 	
		${c.columnName} as ${c.javaAttr} <#if c_has_next>,</#if>
		</#list>
	from ${tableName}	
 -->	
<sqlMap namespace="${classInstance?upper_case}">

	<typeAlias alias="${className}" type="${package}.${className}"/>
	
	<resultMap id="${className}-Map" class="${className}">
		<#list tm.columnMetadata as c> 	
		<result property="${c.javaAttr}" column="${c.columnName}"/>	
		</#list>
	</resultMap>
	
	<insert id="ADD">	
		insert into ${tableName}
		(<#list tm.columnMetadata as c> ${c.columnName}<#if c_has_next>,</#if></#list>) 
		values
		(<#list tm.columnMetadata as c> #${c.javaAttr}#<#if c_has_next>,</#if></#list>)
		<selectKey resultClass="Long" keyProperty="id" >
        	select LAST_INSERT_ID() as value
		</selectKey>
	</insert>

	<!-- 根据ID获取参数信息 -->
    <select id="FIND-BY-ID" parameterClass="java.lang.Long" resultMap="${className}-Map">
        select * from ${tableName} where id = #id#
    </select>
    
   	<sql id="query${className}Sql">
		select * from ${tableName}
        <dynamic prepend=" WHERE ">
        	<#list tm.columnMetadata as c>
        	<isNotEmpty prepend=" AND " property="${c.javaAttr}">${c.columnName} = #${c.javaAttr}#</isNotEmpty> 	
			</#list>       	 	
        </dynamic>
	</sql>
	
	<select id="query${className}Count" resultClass="java.lang.Integer" parameterClass="${className}">
		select count(1) from(
			<include refid="query${className}Sql"/>
		) as temp
	</select>
	
	<select id="query${className}" resultMap="${className}-Map" parameterClass="${className}">
		<include refid="query${className}Sql"/> limit #start#,#offset#
	</select>
	
	<select id="FIND-LIST" resultMap="${className}-Map" parameterClass="${className}">
		<include refid="query${className}Sql"/>
	</select>
	
    <update id="UPDATE" parameterClass="${className}">
		update ${tableName} 
			<dynamic prepend="set">
				<#list tm.columnMetadata as c> 	
				<isNotEmpty property="${c.javaAttr}" prepend="  , " >${c.columnName} = #${c.javaAttr}#</isNotEmpty>
				</#list>
			</dynamic> 
	</update>
	
</sqlMap>