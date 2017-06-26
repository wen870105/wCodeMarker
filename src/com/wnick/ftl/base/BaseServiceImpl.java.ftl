<#include "copyright.ftl"/>
package ${package}.service.base;

import java.util.List;

import ${package}.domain.base.BaseDomain;
import ${package}.domain.base.BaseQuery;
import ${package}.dao.base.BaseDao;
import ${package}.domain.base.Page;

/**
 * 基础方法不建议修改,如需修改请修改对应的子类
 * @author wEn
 * @CreatDate: ${date} 
 */
public class BaseServiceImpl<T extends BaseDomain> implements BaseService<T> {

	@Override
	public void add(T t) {
		getDao().add(t);
	}

	@Override
	public int deleteByIds(long[] ids) {
		return getDao().deleteByIds(ids);
	}

	@Override
	public int deleteByCondtion(T t) {
		return getDao().deleteByCondtion(t);
	}

	@Override
	public int updateById(T t) {
		return getDao().updateById(t);
	}

	@Override
	public T selectById(long id) {
		return getDao().selectById(id);
	}

	@Override
	public T selectOne(T t) {
		t.setStartIndex(0);
		t.setOffset(1);
		List<T> l = getDao().selectList(t);
		return l!=null && l.size()>0 ? l.get(0) : null;
	}

	@Override
	public List<T> selectList(T t) {
		return getDao().selectList(t);
	}

	@Override
	public int selectListCount(T t) {
		return getDao().selectListCount(t);
	}

	@Override
	public List<T> selectByIds(long[] ids) {
		return getDao().selectByIds(ids);
	}

	/**
	 * 子类重写
	 */
	@Override
	public BaseDao<T> getDao() {
		throw new RuntimeException("当前Service的BaseDao为空");
	}

	@Override
	public Page<T> selectPage(T condtion, Page<T> page) {
		if(condtion instanceof BaseQuery){
			BaseQuery bq = condtion;
			bq.setStartIndex(page.getStartIndex());
			bq.setOffset(page.getPageSize());
		}else{
			throw new IllegalArgumentException("设置分页参数失败,参数不是BaseQuery的子类");
		}
		
		int size = getDao().selectListCount(condtion);
		if(size <= 0) {
			return page;
		}
		page.setTotalCount(size);
		page.setResult(getDao().selectList(condtion));
		return page;
	}
}