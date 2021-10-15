package com.wnick.data;

import com.wnick.db.TableMetadata;

/**
 * 
 * @author wsy
 * 2011-11-9
 */
public class IbatisDaoImplData extends GenerateData{

	public IbatisDaoImplData(TableMetadata tm) {
		super(tm);
	}

	@Override
	public String getContent()  {
		try {
			return getContentFromTemplate("daoImpl.java.ftl");
		} catch (Exception e) {
			e.printStackTrace();
			return e.getMessage();
		}
		
	}

	@Override
	public String getPackageStoreDirectory() {
		return "dao";
	}

	@Override
	public String getFileSuffix() {
		return "DaoImpl.java";
	}
	

}
