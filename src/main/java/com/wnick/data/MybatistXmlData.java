package com.wnick.data;

import com.wnick.db.TableMetadata;
/**
 * mybatis xml
 * @author Wen
 * @CreatDate: 2016年5月19日
 */
public class MybatistXmlData extends GenerateData{
	
	public MybatistXmlData(TableMetadata tm) {
		super(tm);
	}
	
	public String getContent() {
		try {
			return getContentFromTemplate("mybatis.xml.ftl");
		} catch (Exception e) {
			e.printStackTrace();
			return e.getMessage();
		}
	}
	
	public String getPackageStoreDirectory() {
		return "mybatis";
	}

	@Override
	public String getFileSuffix() {
		return ".xml";
	}
	
	
}
