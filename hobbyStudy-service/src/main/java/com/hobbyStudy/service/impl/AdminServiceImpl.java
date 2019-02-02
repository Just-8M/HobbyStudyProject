package com.hobbyStudy.service.impl;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hobbyStudy.dao.AdminMapper;
import com.hobbyStudy.dao.AdminOperateRecord;
import com.hobbyStudy.entity.Admin;
import com.hobbyStudy.entity.AdminOperateLog;
import com.hobbyStudy.service.AdminService;

/**
 * @Description :  admin 实现类
 * @author shenjin
 * 
 */
@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminMapper adminMapper;
	
	@Autowired
	private AdminOperateRecord adminOperateRecord;
	
	@Override
	public Admin queryAdminName(String adminName) {
		return adminMapper.queryAdminName(adminName);
	}
	@Override
	public void insertOperateRecord(String adminName, String operateRecord,String loginTime) {
		adminOperateRecord.insertOperateRecord(adminName,operateRecord,loginTime);
	}
	@Override
	public List<AdminOperateLog> queryAdminOperate() {
		return adminOperateRecord.queryAdminOperate();
	}
}
