package com.wnick;

import java.util.concurrent.atomic.AtomicInteger;

/**
 * 
 * @author wsy
 *
 * 2011-11-10
 */
public class CountManager {
	private static AtomicInteger counter = new AtomicInteger(0);
	
	private CountManager() {
		// TODO Auto-generated constructor stub
	}
	
	public static void increment(){
		counter.incrementAndGet();
	}
	
	public static int getCount(){
		return counter.get();
	}
	
	
}
