package com.wnick.db.handlers;

import java.util.ArrayList;
import java.util.List;

import com.wnick.db.ColumnMetadata;
import com.wnick.db.DBBase;
import com.wnick.db.TableMetadata;

/**
 * 
 * @author Administrator
 * @email wnick123@gmail.com
 */
public abstract class AbstractHandler implements IHandler{
	
	@Override
	public List<TableMetadata> getAllTableMetadata() {
		List<TableMetadata> lt = new ArrayList<TableMetadata>();
		
		List<Object[]> l = DBBase.getInstance().queryForListArray(getAllTableMetadataSql(), null);
		for(Object[] os : l){
			TableMetadata tm = new TableMetadata();
			tm.setTableName(os[0].toString());
			tm.setTableComment(os[1].toString());
			tm.setColumnMetadata(getColumnMetadata(tm.getTableName()));
			tm.setPrimaryKey(getPrimaryKey(tm.getTableName()));
			lt.add(tm);
		}
		return lt;
	}

	
	private List<ColumnMetadata> getColumnMetadata(String tableName) {
		List<ColumnMetadata> colus = new ArrayList<ColumnMetadata>();
		
		List<Object[]> l = DBBase.getInstance().queryForListArray(getColumnMetadataSql(), new Object[]{tableName});
		for(Object[] os : l){
			ColumnMetadata c =  new ColumnMetadata();
			c.setColumnName(os[0].toString());
			c.setDataType(os[1].toString());
			c.setColumnComment(os[2].toString());
			colus.add(c);
		}
		
		return colus;
	}
	
	abstract String getPrimaryKey(String tableName);
	/**
	 * 返回两个字段
	 * 第一个为表名称
	 * 第二个为表注释
	 * @return
	 */
	abstract String getAllTableMetadataSql();
	/**
	 * 返回三个字段
	 * 第一个为字段名称
	 * 第二个为字段类型
	 * 第三个为字段注释
	 * @return
	 */
	abstract String getColumnMetadataSql();
}
