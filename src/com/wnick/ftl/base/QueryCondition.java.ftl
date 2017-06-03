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
public class QueryCondition implements Serializable{
	private static final long serialVersionUID = -4601897306615723268L;
	
	// 第几页
	private transient int currPage = 1;
	// 每页数量
	private transient int perItems = 10;
	// 查询分页参数
	private transient int start;
	private transient int offset;
	
	private transient String orderField;// 排序字段
	
	private transient String orderFieldType;// 排序字段类型
	
	private transient Map<String, Object> queryData;// 查询扩展
	
	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getOffset() {
		return offset<1?perItems:offset;
	}

	public void setOffset(int offset) {
		this.offset = offset;
	}

	
	public int getCurrPage() {
		return currPage<0 ? 1 : currPage;
	}

	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}

	public int getPerItems() {
		return perItems;
	}

	public void setPerItems(int pPerItems) {
		perItems = pPerItems;
	}

	public void initPagination() {
		setPerItems(perItems);
		// 页面最小值为1
		int pIndex = getCurrPage();
		int items = getPerItems();
		if (pIndex > 0) {
			setStart((pIndex - 1) * items);
		} else {
			setStart(0);
		}
		setOffset(getPerItems());
	}

	public String getOrderField() {
		return orderField;
	}

	public void setOrderField(String orderField) {
		this.orderField = orderField;
	}

	public String getOrderFieldType() {
		if("DESC".equalsIgnoreCase(orderFieldType) || "ASC".equalsIgnoreCase(orderFieldType)) {
			return orderFieldType.toUpperCase();
		}
		return null;
	}
	
	public void setOrderFieldType(String orderFieldType) {
		this.orderFieldType = orderFieldType;
	}
	
	public Map<String, Object> getQueryData() {
		if(queryData != null && queryData.size() > 0) {
			return queryData;
		}
		return null;
	}
	
	//添加其它查询数据
	public void addQueryData(String key,Object value) {
		if(queryData == null) {
			queryData = new HashMap<String, Object>();
		}
		queryData.put(key, value);
	}
}
