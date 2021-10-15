<#include "copyright.ftl"/>
package com.vv8.video.web;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.vv8.video.domain.${className};
import com.vv8.video.service.${className}Service;
import com.vv8.video.util.Pagination;

/**
 * 
 * @author ${author}
 * @since ${date}
 */
@Controller
@RequestMapping("/${classInstance}")  
public class ${className}Controller extends BaseController{
	
	protected final Log logger = LogFactory.getLog(getClass());
	
	private ${className}Service ${classInstance}Service;
	@Autowired
	public void set${className}Service(${className} ${classInstance}Service) {
		this.${classInstance}Service = ${classInstance}Service;
	}

	@RequestMapping(params="method=list")
	public String list(@RequestParam(required=false) Integer pageIndex,ModelMap mode) {
		${className} a = getBaseCondition(pageIndex,DEFAULT_PAGE_SIZE,${className}.class);
		Pagination p = this.${classInstance}Service.getAll${className}(a);
		p.setPageIndex(pageIndex==null?0:pageIndex);
		p.setPageSize(DEFAULT_PAGE_SIZE);
		mode.addAttribute("page", p);
		return "${classInstance}/list";
	}
	
	@RequestMapping(params="method=create")
	public String create(${className} ${classInstance},ModelMap mode){
		${classInstance}Service.save${className}(${classInstance});
		mode.addAttribute("${classInstance}",${classInstance});
		return "redirect:${classInstance}.form?method=list";
	}
	
	@RequestMapping(params="method=preEdit")
	public String preEdit(Long id,ModelMap mode){
		${className} a = this.${classInstance}Service.get${className}(id);
		System.out.println(a);
		mode.addAttribute("${classInstance}", a);
		return "${classInstance}/edit";
	}
	
	@RequestMapping(params="method=edit")
	public String edit(${className} submit${className},ModelMap mode){
		this.${classInstance}Service.edit${className}(submit${className});
		return "redirect:${classInstance}.form?method=list";
	}
}
