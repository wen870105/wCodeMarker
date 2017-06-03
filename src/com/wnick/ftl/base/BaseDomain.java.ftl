<#include "copyright.ftl"/>
package ${package}.domain.base;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;

/**
 * 
 * @author Wen
 *
 * @CreateDate 2017年1月4日
 */
public class BaseDomain extends QueryCondition {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4597554221498486920L;

	@Override
	public String toString() {
		return ReflectionToStringBuilder.toString(this);
	}
}
