package com.hobbyStudy.service;



import com.hobbyStudy.entity.Admin;

/**
 * @Description:管理员
 * @author shenjin
 * 
 */

public interface AdminService {
	/**
	 * @ToDo:查询管理员登录账号并且返回查找这个对象
	 * @param adminName
	 * @Return :Admin
	 */
	Admin queryAdminName(String adminName);
	
}
