package com.wnick.data;

import com.wnick.db.TableMetadata;

/**
 * 
 * @author wsy
 * 2011-11-9
 */
public class ServiceImplData extends GenerateData {
	public ServiceImplData(TableMetadata tm) {
		super(tm);
	}

	@Override
	public String getContent() {
		try {
			return getContentFromTemplate("serviceImpl.java.ftl");
		} catch (Exception e) {
			e.printStackTrace();
			return e.getMessage();
		}
	}

	@Override
	public String getFileSuffix() {
		return "ServiceImpl.java";
	}

	@Override
	public String getPackageStoreDirectory() {
		return "service";
	}
}
