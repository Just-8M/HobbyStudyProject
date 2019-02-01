package com.hobbyStudy.service.impl;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hobbyStudy.dao.AdminMapper;
import com.hobbyStudy.entity.Admin;
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
	
	@Override
	public Admin queryAdminName(String adminName) {
		return adminMapper.queryAdminName(adminName);
	}
}
