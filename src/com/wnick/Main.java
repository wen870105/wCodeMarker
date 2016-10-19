package com.wnick;

import com.wnick.db.handlers.HandlerFacade;

public class Main {
	public static void main(String[] args) {
		long s = System.currentTimeMillis();
		new HandlerFacade();
		long ret = System.currentTimeMillis() - s;
		System.out.println("生成文件数：" + CountManager.getCount() + ".用时" + ret + "ms");
	}
	
}

