<#include "copyright.ftl"/>
package ${package}.service.base;

import java.util.List;

import ${package}.dao.base.BaseDao;
import ${package}.domain.base.Page;


/**
 * 基础方法不建议修改,如需修改请修改对应的子类
 * @author wEn
 * @CreatDate: ${date} 
 */
public interface BaseService<T>{
	
	public void add(T t);
	
	public int deleteByIds(long[] ids);
	
	public int deleteByCondtion(T t);
	
	public int updateById(T t);
	
	public T selectById(long id);

	public T selectOne(T t);
	
	public List<T> selectList(T t);

	public int selectListCount(T t) ;
	
	public List<T> selectByIds(long[] ids) ;
	
	public BaseDao<T> getDao();
	
	public Page<T> selectPage(T condition, Page<T> page);
}
