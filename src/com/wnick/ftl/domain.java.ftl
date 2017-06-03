<#include "copyright.ftl"/>
package ${package}.domain;

import java.util.Date;
import ${package}.domain.base.BaseDomain;

/**
 * ${tm.tableComment}
 * @author ${author}
 * @since ${date}
 */
public class ${className} extends BaseDomain{
<#list tm.columnMetadata as c>
	// ${c.columnComment}
	private ${c.javaType} ${c.javaAttr};
</#list>
<#list tm.columnMetadata as c>

	public void set${c.javaMethod}(${c.javaType} ${c.javaAttr}) {
		this.${c.javaAttr} = ${c.javaAttr};
	}

<#if c.javaType == "boolean">
	public ${c.javaType} is${c.javaMethod}() {
		return ${c.javaAttr};
	}
<#else>
	public ${c.javaType} get${c.javaMethod}() {
		return ${c.javaAttr};
	}
</#if>
</#list> 
}