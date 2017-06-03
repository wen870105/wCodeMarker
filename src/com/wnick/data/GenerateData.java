package com.wnick.data;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.StringWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import com.wnick.CountManager;
import com.wnick.ResourceManager;
import com.wnick.StringUtil;
import com.wnick.db.TableMetadata;

import freemarker.template.Configuration;
import freemarker.template.DefaultObjectWrapper;
import freemarker.template.Template;

public abstract class GenerateData {
	static final String PACKAGE_STR = ResourceManager.getInstance().getString("package");
	
	// 换行
	static final String NEWLINE_MARK = "\t\n";
	// 制表符
	static final String TABS_MARK = "\t";
	static final String TABS_MARK_2 = TABS_MARK + TABS_MARK;
	static final String TABS_MARK_3 = TABS_MARK_2 + TABS_MARK;
	
	protected TableMetadata tm;
	
	
	public GenerateData(TableMetadata tm) {
		this.tm = tm;
	}

	String getPackageDir(){
		return "d:\\"+PACKAGE_STR.replaceAll("\\.", "/")+ "/" +getPackageStoreDirectory();
	}
	
	String getFileName(){
		if(this.getFileSuffix().contains("xml") || this.getFileSuffix().contains("jsp")){
			return StringUtil.getLowerFirstName(tm.getTableNameWithoutPrefix())  + this.getFileSuffix();
		}else{
			return StringUtil.getUpperFirstName(tm.getTableNameWithoutPrefix())  + this.getFileSuffix();
		}
	}
	/**
	 * 
	 * @param tm
	 * @param directory 生成文件目录
	 * @param suffix 文件后缀  
	 * @return
	 */
	public String creatFile() {
		CountManager.increment();
		
		String packageString = getPackageDir();
		//存放目录 
		File dir = new File(packageString);
		if (!dir.exists()) {
			dir.mkdirs();
		}
		
		String path = dir.getPath() +"\\" +getFileName();
		// 判断java文件是否存在如果存在则删除原文件 
		File javafile = new File(path);
		
		if (javafile.exists()) {
			// 删除已存在文件
			if(ResourceManager.getInstance().getBoolean("fileexist.delete")){
				javafile.delete();
			}else{
				System.out.println(tm.getTableNameWithoutPrefix()+".java已经存在，跳过当前文件");
				return null;
			}
		}
		
		try {
			FileWriter file = new FileWriter(path);
			file.write(getContent());
			file.close();
			System.out.println("生成路径：" + javafile.getAbsolutePath());
		} catch (IOException e) {
			e.printStackTrace();
		} 
		
		return null;
	}
	
	/**
	 * 文件内容
	 * @param tm
	 * @return
	 */
	public abstract String getContent();
	
	/**
	 * 保存路径
	 * @return
	 */
	public abstract String getPackageStoreDirectory();
	
	/**
	 * 保存文件后缀格式
	 * 比如:
	 *  要保存xxxDao.java 
	 *  return "Dao.java"
	 * 
	 * @return
	 */
	public abstract String getFileSuffix();
	
	/**
	 * 从模版生成数据
	 * @param ftl
	 * @return
	 * @throws Exception
	 */
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
        // 表名
        m.put("tableName", tm.getTableName());
        // 没有前缀的表实例名称
        m.put("className", StringUtil.getUpperFirstName(tm.getTableNameWithoutPrefix()));
        m.put("classInstance", StringUtil.getLowerFirstName(tm.getTableNameWithoutPrefix()));
        m.put("author", rm.getString("author"));
        m.put("package", rm.getString("package"));
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        m.put("date", sdf.format(new Date()));
        m.put("tm", this.tm);
        /* 将模板和数据模型合并 */ 
        StringWriter sw=new StringWriter();  
        temp.process(m, sw); 
        sw.flush();
        sw.close(); 
        return sw.toString();
	}
}
