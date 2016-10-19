package ${package}.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tj.tjk.base.impl.BaseServiceImpl;
import com.tj.tjk.pojo.Pagination;
/**
 * 
 * @author ${author}
 * @since ${date}
 */
@Service("${classInstance}Service")
public class ${className}ServiceImpl extends BaseServiceImpl<${className}, Long> implements ${className}Service {

	private ${className}Dao ${classInstance}Dao;

	@Autowired
	public ${className}ServiceImpl(${className}Dao ${classInstance}Dao) {
		super(${classInstance}Dao);
		this.${classInstance}Dao = ${classInstance}Dao;
	}
	
	public void create(){}

	public Pagination<${className}> query${className}() {
		return null;
	}
}
 