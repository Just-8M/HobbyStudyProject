package com.hobbyStudy.service;



import java.util.List;

import com.hobbyStudy.entity.Admin;
import com.hobbyStudy.entity.AdminOperateLog;

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

	/**
	 * @ToDo:管理员操作
	 * @param adminName
	 * @param string
	 * @Return :void
	 */
	void insertOperateRecord(String adminName, String operateRecord,String loginTime);

	/**
	 * @ToDo:查询管理员操作记录
	 * @return
	 * @Return :List<AdminOperateLog>
	 */
	List<AdminOperateLog> queryAdminOperate();
	
}
