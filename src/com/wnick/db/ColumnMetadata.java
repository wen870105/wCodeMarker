package com.wnick.db;

import java.util.concurrent.atomic.AtomicBoolean;

import com.wnick.StringUtil;

/**
 * 
 * @author Administrator
 * @email wnick123@gmail.com
 */
public class ColumnMetadata {

	private String columnName;
	private String columnComment;
	private String dataType;

	// 首字母小写的字段属性
	private String javaAttr;
	// 首字母大写的字段属性
	private String javaMethod;
	private String javaType;
	
	private AtomicBoolean flag = new AtomicBoolean(false);
	
	private void init(){		
		if(flag.compareAndSet(false, true) ){
			javaAttr = StringUtil.getLowerFirstName(columnName);
			javaMethod = StringUtil.getUpperFirstName(columnName);
			javaType = getJavaType(dataType);
		}
	}

	// 首字母小写
	public String getColumnField() {
		return StringUtil.getLowerFirstName(columnName);
	}

	public String getColumnName() {
		return columnName;
	}

	public void setColumnName(String columnName) {
		this.columnName = columnName;
	}

	public String getDataType() {
		return dataType;
	}

	public void setDataType(String dataType) {
		this.dataType = dataType;
	}

	public String getColumnComment() {
		return columnComment;
	}

	public void setColumnComment(String columnComment) {
		this.columnComment = columnComment;
	}

	public String getJavaAttr() {
		init();
		return javaAttr;
	}

	public void setJavaAttr(String javaAttr) {
		this.javaAttr = javaAttr;
	}

	public String getJavaType() {
		init();
		return javaType;
	}

	public void setJavaType(String javaType) {
		this.javaType = javaType;
	}

	public String getJavaMethod() {
		init();
		return javaMethod;
	}

	public void setJavaMethod(String javaMethod) {
		this.javaMethod = javaMethod;
	}

	private String getJavaType(String type) {
		if (type.contains("varchar")|| type.contains("text")) {
			return "String";
		}
		if (type.contains("char") || type.contains("bit")) {
			return "boolean";
		}
		if (type.contains("Timestamp") || type.contains("date") || type.contains("datetime")) {
			return "Date";
		}		
		if (type.equalsIgnoreCase("int") || type.equalsIgnoreCase("tinyint")) {
			return "Integer";
		}
		if (type.contains("bigint")) {
			return "Long";
		}
		return StringUtil.getUpperFirstName(type);
	}
}
