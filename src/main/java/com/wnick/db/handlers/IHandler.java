package com.wnick.db.handlers;

import java.util.List;

import com.wnick.db.TableMetadata;

/**
 * 
 * @author Administrator
 * @email wnick123@gmail.com
 */
public interface IHandler {
	List<TableMetadata> getAllTableMetadata();
}
