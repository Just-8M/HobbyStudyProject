package com.hobbyStudy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hobbyStudy.entity.AdminOperateLog;

/**
 * @Description
 * @author shenjin
 * 
 */
public interface AdminOperateRecord {
	
	//  登录操作
	void insertOperateRecord(@Param("adminName")String adminName,
			@Param("operateRecord")String operateRecord,
			@Param("loginTime")String loginTime);
	//   管理员操作记录
	List<AdminOperateLog> queryAdminOperate();
}
