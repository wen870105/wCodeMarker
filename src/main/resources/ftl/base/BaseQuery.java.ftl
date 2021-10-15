<#include "copyright.ftl"/>
package ${package}.domain.base;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;


/**
 * 基础组件不建议修改
 * @Author: wEn
 * @CreatDate: ${date}
 * @Version:
 */
public class BaseQuery implements Serializable{
	private static final long serialVersionUID = 1L;

	// 分页起始属性
	private int startIndex = 1;

	private int offset;

	private String orderField;// 排序字段

	private String orderFieldType;// 排序字段类型

	private Map<String, Object> queryData;// 查询扩展

	public int getOffset() {
		return offset < 1 ? 0 : offset;
	}

	public void setOffset(int offset) {
		this.offset = offset;
	}

	public int getStartIndex() {
		return startIndex < 0 ? 1 : startIndex;
	}

	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}

	public String getOrderField() {
		return orderField;
	}

	public void setOrderField(String orderField) {
		this.orderField = orderField;
	}

	public String getOrderFieldType() {
		if ("DESC".equalsIgnoreCase(orderFieldType) || "ASC".equalsIgnoreCase(orderFieldType)) {
			return orderFieldType.toUpperCase();
		}
		return null;
	}

	public void setOrderFieldType(String orderFieldType) {
		this.orderFieldType = orderFieldType;
	}

	public Map<String, Object> getQueryData() {
		if (queryData != null && queryData.size() > 0) {
			return queryData;
		}
		return null;
	}

	// 添加其它查询数据
	public void addQueryData(String key, Object value) {
		if (queryData == null) {
			queryData = new HashMap<String, Object>();
		}
		queryData.put(key, value);
	}
}
