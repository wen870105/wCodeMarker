package com.wnick.data;

import java.io.File;
import java.io.StringWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import com.wnick.ResourceManager;
import com.wnick.db.TableMetadata;

import freemarker.template.Configuration;
import freemarker.template.DefaultObjectWrapper;
import freemarker.template.Template;
/**
 * mybatis xml
 * @author Wen
 * @CreatDate: 2016年5月19日
 */
public abstract class SimpleGenerateData extends GenerateData{
	
	public SimpleGenerateData(TableMetadata tm) {
		super(tm);
	}
	
	/**
	 * 从模版生成数据
	 * @param ftl
	 * @return
	 * @throws Exception
	 */
	@Override
	String getContentFromTemplate(String ftl) throws Exception{
		ResourceManager rm = ResourceManager.getInstance();
		Configuration cfg = new Configuration(); 
        File f = new File("src/com/wnick/ftl");
        cfg.setDirectoryForTemplateLoading(f); 
        cfg.setObjectWrapper(new DefaultObjectWrapper()); 
        /* 在整个应用的生命周期中，这个工作你可以执行多次 */  
        /* 获取或创建模板*/ 
        Template temp = cfg.getTemplate(ftl); 
        /* 创建数据模型 */ 
        Map<String,Object> m = new HashMap<String, Object>();
        m.put("author", rm.getString("author"));
        m.put("package", rm.getString("package"));
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        m.put("date", sdf.format(new Date()));
        /* 将模板和数据模型合并 */ 
        StringWriter sw=new StringWriter();  
        temp.process(m, sw); 
        sw.flush();
        sw.close(); 
        return sw.toString();
	}
	

	@Override
	public String getFileSuffix() {
		return ".java";
	}
	
	
}
