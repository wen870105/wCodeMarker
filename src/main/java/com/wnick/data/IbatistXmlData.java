package com.wnick.data;

import com.wnick.db.TableMetadata;
/**
 * ibatis xml
 * @author wsy
 * 2011-11-3
 */
public class IbatistXmlData extends GenerateData{
	
	public IbatistXmlData(TableMetadata tm) {
		super(tm);
	}
	
	public String getContent() {
		try {
			return getContentFromTemplate("ibatis.xml.ftl");
		} catch (Exception e) {
			e.printStackTrace();
			return e.getMessage();
		}
	}
	
	public String getPackageStoreDirectory() {
		return "ibatis";
	}

	@Override
	public String getFileSuffix() {
		return ".xml";
	}
	
	
}
