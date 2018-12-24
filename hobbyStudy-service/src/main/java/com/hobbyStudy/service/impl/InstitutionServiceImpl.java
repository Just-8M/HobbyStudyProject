package com.hobbyStudy.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hobbyStudy.dao.InstitutionMapper;
import com.hobbyStudy.entity.Institution;
import com.hobbyStudy.service.InstitutionService;

/**  
* @Description: 学院机构功能
* @author shenjin 
* @date 2018年12月22日  
* @version V1.0  
*/
@Service
public class InstitutionServiceImpl implements InstitutionService{
	
	@Autowired
	private InstitutionMapper institutionMapper;

	//查询机构课程
	@Override
	public List<Institution> queryInstitutionCourse(String district) {
		return institutionMapper.queryInstitutionCourse(district);
	}
	// 查询机构相关课程信息详情
	@Override
	public Institution queryInstitutionDetail(Integer id) {
		return institutionMapper.queryInstitutionDetail(id);
	}

}
