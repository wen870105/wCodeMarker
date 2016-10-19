package com.wnick.db.handlers;

import java.util.List;

import com.wnick.ResourceManager;
import com.wnick.data.GenerateData;
import com.wnick.data.IbatisDaoData;
import com.wnick.data.IbatisDaoImplData;
import com.wnick.data.IbatistXmlData;
import com.wnick.data.JavaDomainData;
import com.wnick.data.MybatistXmlData;
import com.wnick.data.ServiceData;
import com.wnick.data.ServiceImplData;
import com.wnick.db.TableMetadata;

/**
 * 
 * @author wsy
 * 2011-11-3
 */
public class HandlerFacade {
	
	public HandlerFacade() {
		MysqlHandler h = new MysqlHandler();
		List<TableMetadata> tms = h.getAllTableMetadata();
		//String[] arr = ResourceManager.getInstance().getArray("table.excute");
		for (TableMetadata tm : tms) {
		
			if (!isExcludeTable(tm.getTableName())) {
				createFiles(new JavaDomainData(tm));
				createFiles(new IbatistXmlData(tm));
				createFiles(new IbatisDaoData(tm));
				createFiles(new IbatisDaoImplData(tm));
//				createFiles(new CreateJspData(tm));
				createFiles(new ServiceData(tm));
				createFiles(new ServiceImplData(tm));
				createFiles(new MybatistXmlData(tm));
				
				/*
				createFiles(new ActionData(tm));
				
				
				createFiles(new ListJspData(tm));
				createFiles(new EditJspData(tm));
				*/
			}
			
		}
	}

	// 只生成相应文件
	private boolean isExcuteTable(String tableName){
		String[] arr = ResourceManager.getInstance().getArray("table.excute");
		for(String a : arr){
			if(tableName.indexOf(a) > -1)
				return true;
		}
		return false;
	}
	
	// 排除表不生成相应文件
	private boolean isExcludeTable(String tableName){
		String[] arr = ResourceManager.getInstance().getArray("table.exclude.tables");
		for(String a : arr){
			if(tableName.toLowerCase().contains(a.toLowerCase()))
				return true;
		}
		return false;
	}
	
	private void createFiles(GenerateData gd){
		gd.creatFile();
	}
}
