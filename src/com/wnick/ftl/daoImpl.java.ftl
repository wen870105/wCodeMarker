package ${package};

import java.util.List;
import com.tj.tjk.dao.base.impl.BaseDaoImpl;
import com.tj.tjk.exception.BusinessException;
import org.springframework.stereotype.Service;

/**
 * 
 * @author ${author}
 * @since ${date}
 */
@Service("${classInstance}Dao")
public class ${className}DaoImpl extends BaseDaoImpl<${className}, Long> implements ${className}Dao {

	public ${className}DaoImpl() {
		super(${className}.class);
	} 
	
}
