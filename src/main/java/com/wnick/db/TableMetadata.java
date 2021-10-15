package com.wnick.db;

import java.util.List;

import com.wnick.ResourceManager;

/**
 * 
 * @author wsy 2011-11-3
 */
public class TableMetadata {

	private String tableName;
	// 没有前缀的表名
	private String tableNameWithoutPrefix = null;
	private String tableComment;
	private String primaryKey;
	private List<ColumnMetadata> columnMetadata;


	/**
	 * 没有前缀的表名
	 * @return
	 */
	public String getTableNameWithoutPrefix() {
		if( tableNameWithoutPrefix == null){
			String prefix = ResourceManager.getInstance().getString("table.prefix");
			int idx = tableName.indexOf(prefix);
			if(idx > -1){
				tableNameWithoutPrefix = tableName.split(prefix)[1];
			}else{
				tableNameWithoutPrefix = tableName;
			}
		}
		return tableNameWithoutPrefix;
	}

	public String getPrimaryKey() {
		return primaryKey;
	}

	public void setPrimaryKey(String primaryKey) {
		this.primaryKey = primaryKey;
	}

	public List<ColumnMetadata> getColumnMetadata() {
		return columnMetadata;
	}

	public void setColumnMetadata(List<ColumnMetadata> columnMetadata) {
		this.columnMetadata = columnMetadata;
	}

	
	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	public String getTableComment() {
		return tableComment;
	}

	public void setTableComment(String tableComment) {
		this.tableComment = tableComment;
	}

}
