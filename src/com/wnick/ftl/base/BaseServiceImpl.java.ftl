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
public class BaseServiceImpl<T> implements BaseService<T> {

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
		return getDao().selectOne(t);
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
		try {
			Class<?> clz = condtion.getClass();
			clz.getMethod("setStartIndex", Integer.class).invoke(condtion, page.getStartIndex());
			clz.getMethod("setEndIndex", Integer.class).invoke(condtion, page.getEndIndex());
		} catch (Exception e) {
			throw new IllegalArgumentException("设置分页参数失败", e);
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