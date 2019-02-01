package com.hobbyStudy.dao;



import com.hobbyStudy.entity.Admin;

/**
 * @Description:Dao层
 * @author shenjin
 * 
 */
public interface AdminMapper {
	
	//  查询管理员登录账号并且返回查找这个对象
	Admin queryAdminName(String adminName);
	
}
