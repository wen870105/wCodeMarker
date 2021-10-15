package ${package}.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import ${package}.domain.UserTest;
import ${package}.domain.base.Page;
import ${package}.service.UserTestService;

@Controller
@RequestMapping("/demo")
public class DemoAction {
	@Autowired
	private UserTestService service;

	
	private static int counter = 1;
	@RequestMapping("")
	public String index() {
	    System.out.println("test add");
	    UserTest bean = new UserTest();
	    bean.setName("test1111");
	    bean.setPhone(123456);
	    service.add(bean);
	    bean = new UserTest();
	    bean.setName("test22222");
	    bean.setPhone(123456);
	    service.add(bean);
	    System.out.println("***************************");
	    
	    
	    System.out.println("test selectOne");
	    UserTest query = new UserTest();
	    query.setName("test1111");
	    UserTest ret = service.selectOne(query);
	    System.out.println(ret.toString());	    
	    System.out.println("***************************");
	    
	    
	    System.out.println("test selectList");
	    UserTest query2 = new UserTest();
	    List<UserTest> list = service.selectList(query2);
	    if(list!=null){
	        for (UserTest u : list) {
	            System.out.println(u.toString());
            }
	    }
	    System.out.println("***************************");
	    
	    System.out.println("test selectPage");
	    Page<UserTest> page = new Page<UserTest>();
	    page.setPageSize(10);
	    page.setCurrentPage(1);
	    Page<UserTest> retPage = service.selectPage(query2, page);
	    System.out.println("count =" + retPage.getTotalCount());
	    System.out.println("list =" + retPage.getResult());
		return "index";
	}
	
}
