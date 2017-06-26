<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
	"http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<!--
	${tm.tableComment}	
	@author ${author}
 	@since ${date} 
 	wcodemarker生成工具备注:
 	1.基础方法尽量不要去修改,如果修改注意影响范围
 	2.默认主键名称是ID,如果不是需要修改对应的sql
 	3.默认生成的sql为单表相关
-->
<mapper namespace="${package}.dao.${className}Dao">
	
	<resultMap id="${className}-Map" type="${package}.domain.${className}">
		<#list tm.columnMetadata as c>
		<result property="${c.javaAttr}" column="${c.columnName}"/>
		</#list>
	</resultMap>
	
	<!-- 智能排序与分页 -->
	<sql id="QUERY_ORDER_LIMIT_CONDTION">
		<if test="orderField != null and orderField != '' and orderFieldType != null and orderFieldType != ''"><![CDATA[ORDER BY ${r'${orderField}'} ${r'${orderFieldType}'} ]]></if>
		<if test="startIndex != null and startIndex &gt;= 0 and pageSize != null and pageSize &gt; 0"><![CDATA[LIMIT ${r'#{startIndex}'},${r'#{pageSize}'}]]></if>
	</sql>
	
	<!-- 全部条件(更多功能可以通过queryData扩展实现)  -->
	<sql id="QUERY_WHERE_CLAUSE">
		<where>
			<#list tm.columnMetadata as c>
			<if test="${c.javaAttr} != null and ${c.javaAttr} != '' ">and ${c.columnName} = #${'{'?upper_case}${c.javaAttr}}</if>
			</#list>
		</where>
	</sql>
	
	<!-- 更新列字段,只要不为NULL则更新,除开主键列 -->
	<sql id="UPDATE_COLUMN_SET">
		<set>
			<#list tm.columnMetadata as c>
			<#if tm.primaryKey != c.columnName >
			<if test="${c.javaAttr} != null">${c.columnName} = #${'{'?upper_case}${c.javaAttr}},</if>
			</#if>
			</#list>
		</set>
	</sql>
	
	<!-- 插入记录 -->
	<insert id="add" keyProperty="id" useGeneratedKeys="true">
		insert into ${tableName}
		(<#list tm.columnMetadata as c> ${c.columnName}<#if c_has_next>,</#if></#list>)
		values
		(<#list tm.columnMetadata as c> #${'{'?upper_case}${c.javaAttr}}<#if c_has_next>,</#if></#list>)
	</insert>
	
	<!-- 删除记录,主键IN(array) -->
	<delete id="deleteByIds" parameterType="java.lang.reflect.Array" >
		DELETE FROM ${tableName} WHERE id IN
		<foreach collection="array" item="id" open="(" separator="," close=")">
			#${r'{'}id}
		</foreach>
	</delete>
	
	<!-- 删除,通过条件 -->
	<update id="deleteByCondtion">
		DELETE FROM ${tableName}
		<include refid="QUERY_WHERE_CLAUSE"/>
	</update>
	
	<!-- 修改记录通过主键 -->
	<update id="updateById">
		UPDATE ${tableName}
		<include refid="UPDATE_COLUMN_SET"/>
		WHERE id = #${r'{'}id}
	</update>
	
	<select id="selectById" resultMap="${className}-Map">
		select * from ${tableName} where id = #${r'{'}value}
	</select>
	
	<select id="selectOne" resultMap="${className}-Map" parameterType="${className}">
		select * from ${tableName} 
		<include refid="QUERY_WHERE_CLAUSE"/>		 
		order by id desc limit 1
	</select>
	
	<!-- 查询,通过条件 -->
	<select id="selectList" resultMap="${className}-Map" parameterType="${className}">
		select * from ${tableName} 
		<include refid="QUERY_WHERE_CLAUSE"/>
		<include refid="QUERY_ORDER_LIMIT_CONDTION"/>
	</select>
	
	<!-- 总数查询,通过条件 -->
	<select id="selectListCount" parameterType="${className}" resultType="int">
		SELECT COUNT(id) AS dataCount　from ${tableName} 
		<include refid="QUERY_WHERE_CLAUSE"/>
	</select>

	<!-- 查询,通过主键IN(array) -->
	<select id="selectByIds" parameterType="java.lang.reflect.Array" resultMap="${className}-Map">
		select * from ${tableName} 
		WHERE id IN
		<foreach collection="array" item="id" open="(" separator="," close=")">
			#${r'{'}id}
		</foreach>
	</select>
	
	<!-- 其它SQL语句 -->
	
	
	
	
</mapper>