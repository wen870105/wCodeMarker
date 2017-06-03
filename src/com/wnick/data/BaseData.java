package com.wnick.data;

import com.wnick.db.TableMetadata;
/**
 * mybatis xml
 * @author Wen
 * @CreatDate: 2016年5月19日
 */
public class BaseData extends SimpleGenerateData{
	private String ftl = null;
	private String dir = null;
	private String name = null;
	public BaseData(TableMetadata tm) {
		super(tm);
	}
	
	@Override
	String getFileName() {
		return name;
	}
	
	@Override
	public String getContent() {
		try {
			return getContentFromTemplate(ftl);
		} catch (Exception e) {
			e.printStackTrace();
			return e.getMessage();
		}
	}
	
	@Override
	public String getPackageStoreDirectory() {
		return dir;
	}
	
	@Override
	public String creatFile() {
		ftl = "base/BaseDao.java.ftl";
		dir = "dao/base";
		name = "BaseDao.java";
		super.creatFile();
		
		ftl = "base/BaseService.java.ftl";
		dir = "service/base";
		name = "BaseService.java";
		super.creatFile();
		
		ftl = "base/BaseServiceImpl.java.ftl";
		dir = "service/base";
		name = "BaseServiceImpl.java";
		super.creatFile();
		
		
		ftl = "base/BaseDomain.java.ftl";
		dir = "domain/base";
		name = "BaseDomain.java";
		super.creatFile();
		
		ftl = "base/Page.java.ftl";
		dir = "domain/base";
		name = "Page.java";
		super.creatFile();
		
		ftl = "base/QueryCondition.java.ftl";
		dir = "domain/base";
		name = "QueryCondition.java";
		super.creatFile();
		return null;
	}
}
