package com.wnick.data;

import com.wnick.db.TableMetadata;

/**
 * 
 * @author wsy
 * 2011-11-9
 */
public class ServiceData extends GenerateData {
	public ServiceData(TableMetadata tm) {
		super(tm);
	}

	@Override
	public String getContent() {
		try {
			return getContentFromTemplate("service.java.ftl");
		} catch (Exception e) {
			e.printStackTrace();
			return e.getMessage();
		}
	}

	@Override
	public String getFileSuffix() {
		return "Service.java";
	}

	@Override
	public String getPackageStoreDirectory() {
		return "service";
	}
}
