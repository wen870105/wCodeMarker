package com.wnick.db;

import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.apache.commons.dbcp.BasicDataSource;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ArrayHandler;
import org.apache.commons.dbutils.handlers.ArrayListHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.wnick.ResourceManager;
  
/**
 * 
 * @author wnick
 * wnick123@gmail.com
 *
 */
public class DBBase {  
      
    private static DBBase dbBase;  
      
    private QueryRunner run ;  

    private DBBase(DataSource dataSource){
    	this.run = new QueryRunner(dataSource);
    }  
    
    static{
    	dbBase = new DBBase(setupDataSource());
    }
      
    private static DataSource setupDataSource() { 
    	ResourceManager rm = ResourceManager.getInstance();
        BasicDataSource ds = new BasicDataSource();  
        ds.setDriverClassName(rm.getString("jdbc.driverClassName"));  
        ds.setUsername(rm.getString("jdbc.username"));  
        ds.setPassword(rm.getString("jdbc.password"));  
        ds.setUrl(rm.getString("jdbc.url"));
        return ds;  
    }  
      
    public static DBBase getInstance(){  
        return dbBase;  
    }  
      
      
    /** 
     * eg: 
     * select count(1) from user 
     *  
     * @param sql 
     * @param params 
     * @return 
     */  
    public int count(String sql, Object[] params){  
          
        Object o = getAnAttr(sql,params);  
        if(o instanceof Integer){  
            return (Integer) o;  
        }  
        if(o instanceof Long){  
            Long l = (Long)o;  
            return l.intValue();  
        }  
          
        String s = (String)o;  
        try{  
            return Integer.parseInt(s);  
        }catch (NumberFormatException e) {  
            return 0;  
        }  
    }  
       
     /** 
      * 获得第一个查询第一行第一列 
      * @param sql 
      * @param params 
      * @return 
      */  
    public Object getAnAttr(String sql, Object[] params){  
  
        showSql(sql);  
  
        Object s=null;  
        try {  
            s = run.query(sql, new ScalarHandler(1),params);  
        } catch (SQLException e) {  
            e.printStackTrace();  
        }  
        return s;  
    }  
    /** 
     * 查询返回单个对象 
     * @param sql 
     * @param clazz 
     * @return 
     */   
    public <T> T queryForObject(String sql,Object param[],Class<T> clazz){        
        T obj = null;  
        try {             
            showSql(sql);             
            obj = (T)run.query(sql,new BeanHandler(clazz), param);            
        } catch (SQLException e) {            
            e.printStackTrace();  
        }   
        return obj;  
    } 
    public Object[] queryForArray(String sql,Object param[]){
    	Object[] obj = null;  
        try {             
            showSql(sql);             
            obj = (Object[])run.query(sql,new ArrayHandler(), param);            
        } catch (SQLException e) {            
            e.printStackTrace();  
        }   
        return obj;  
    	
    }        
      
    /** 
     * 查询返回list对象 
     * @param sql 
     * @param clazz 
     * @return 
     */  
    public <T> List<T> queryForList(String sql,Object[] param,Class<T> clazz){  
        List<T> obj = null;  
        try {  
            showSql(sql);  
            obj = (List<T>)run.query(sql,new BeanListHandler(clazz),param);             
        } catch (SQLException e) {            
            e.printStackTrace();  
        }   
        return obj;  
    }
    
    public List<Object[]> queryForListArray(String sql,Object[] param){
    	List<Object[]> obj = null;
    	try {  
            showSql(sql);  
            obj = (List<Object[]>)run.query(sql,new ArrayListHandler(),param);             
        } catch (SQLException e) {            
            e.printStackTrace();  
        }   
    	return obj;
    } 
      
      
    /** 
     * 保存返回主键 
     * @param sql 
     * @param param 
     * @return 
     */  
    public int storeInfoAndGetGeneratedKey(String sql,Object[] param){  
        int pk=0;  
        try {  
            showSql(sql);  
            run.update(sql,param);  
            pk = ((Long)run.query("SELECT LAST_INSERT_ID()", new ScalarHandler(1))).intValue();   
        }catch(SQLException e) {  
            e.printStackTrace();  
        }  
        return pk;  
    }  
    /** 
     * 更新 
     * @param sql 
     * @return 
     */  
      
    public int update(String sql,Object[] param){  
        int i=0;  
        try {  
            showSql(sql);
            i = run.update(sql,param);  
        }catch(SQLException e) {  
            e.printStackTrace();  
        }  
        return i;  
  
    }  
      
    private void showSql(String sql){  
        if(Constants.SHOW_SQL){  
            System.out.println(sql);  
        }  
    } 
    
    private static class Constants{
    	private static final Boolean SHOW_SQL = ResourceManager.getInstance().getBoolean("showsql");
    }
}  