package ${package}.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ${package}.common.Pagination;
import ${package}.dao.${className}Dao;
import ${package}.dao.base.BaseDao;
import ${package}.domain.${className};
import ${package}.service.impl.BaseServiceImpl;
/**
 * 
 * @author ${author}
 * @since ${date}
 */
@Service("${classInstance}Service")
public class ${className}ServiceImpl extends BaseServiceImpl<${className}> implements ${className}Service {

	@Autowired
	private ${className}Dao ${classInstance}Dao;

	public BaseDao getDao() {
		return ${classInstance}Dao;
	}
	
	public void create(){}

	public Pagination<${className}> query${className}() {
		return null;
	}
}
 