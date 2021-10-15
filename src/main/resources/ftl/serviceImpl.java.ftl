<#include "copyright.ftl"/>
package ${package}.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ${package}.dao.${className}Dao;
import ${package}.dao.base.BaseDao;
import ${package}.domain.${className};
import ${package}.service.base.BaseServiceImpl;
/**
 * ${tm.tableComment}
 * @author ${author}
 * @since ${date}
 */
@Service("${classInstance}Service")
public class ${className}ServiceImpl extends BaseServiceImpl<${className}> implements ${className}Service {

	@Autowired
	private ${className}Dao ${classInstance}Dao;

	public BaseDao<${className}> getDao() {
		return ${classInstance}Dao;
	}
	
}
 