package com.wnick;

import com.wnick.db.handlers.HandlerFacade;

public class Main {
	public static void main(String[] args) {
	    System.out.println("提示生成代码是注意包名,当前包名="+ResourceManager.getInstance().getString("package"));
		long s = System.currentTimeMillis();
		new HandlerFacade();
		long ret = System.currentTimeMillis() - s;
		System.out.println("生成文件数：" + CountManager.getCount() + ".用时" + ret + "ms");
	}
	
}

