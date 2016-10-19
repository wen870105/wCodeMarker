package com.wnick.data;

import com.wnick.db.TableMetadata;

/**
 * 
 * @author wsy
 * 2011-11-9
 */
public class EditJspData extends GenerateData{

	public EditJspData(TableMetadata tm) {
		super(tm);
	}

	@Override
	public String getContent()  {
		try {
			return getContentFromTemplate("edit.jsp.ftl");
		} catch (Exception e) {
			e.printStackTrace();
			return e.getMessage();
		}
		
	}

	@Override
	public String getPackageStoreDirectory() {
		return "jsp";
	}

	@Override
	public String getFileSuffix() {
		return "Edit.jsp";
	}
	

}
