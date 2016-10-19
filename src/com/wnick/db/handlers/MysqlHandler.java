package com.wnick.db.handlers;

import java.util.List;

import com.wnick.ResourceManager;
import com.wnick.db.DBBase;
import com.wnick.db.TableMetadata;

/**
 * 
 * @author Administrator
 * @email wnick123@gmail.com
 */
public class MysqlHandler extends AbstractHandler{

	@Override
	/**
	 * 
	 */
	String getPrimaryKey(String tableName) {
		List<Object[]> l = DBBase.getInstance().queryForListArray(String.format(PRIMARYKEY_SQL, tableName), null);
		for(Object[] os : l){
			if(os[3].toString().toLowerCase().indexOf("pri") > -1){
				return os[0].toString();
			}
		}
		return null;
	}

	// 数据库名称
	private String dataBaseName;
	
	public MysqlHandler() {
		this.dataBaseName = ResourceManager.getInstance().getString("jdbc.dbname");
	}
	private static final String PRIMARYKEY_SQL="describe %s";
	
	private static final String COLUMN_SQL = 
		"select column_name,data_type,column_comment from "
		+ " information_schema.columns " 
		+ " where table_schema = '%s'"
		+ " and table_name = ? ";
	
	private static final String TABLE_SQL = 
		"select table_name,table_comment " 
		+ " from information_schema.tables "
		+ " where table_schema = '%s'";
		
	
	@Override
	String getColumnMetadataSql() {
		return String.format(COLUMN_SQL, dataBaseName);
	}

	@Override
	String getAllTableMetadataSql() {
		return String.format(TABLE_SQL, dataBaseName);
	}
	
	
}
