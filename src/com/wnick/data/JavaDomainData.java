package com.wnick.data;

import com.wnick.db.TableMetadata;

/**
 * 生成java文件
 * 
 * @author Administrator
 * @email wnick123@gmail.com
 */
public class JavaDomainData extends GenerateData {

	public JavaDomainData(TableMetadata tm) {
		super(tm);
	}

	public String getContent() {
		try {
			return getContentFromTemplate("domain.java.ftl");
		} catch (Exception e) {
			e.printStackTrace();
			return e.getMessage();
		}
	}

	@Override
	public String getPackageStoreDirectory() {
		return "domain";
	}

	@Override
	public String getFileSuffix() {
		return ".java";
	}

}
