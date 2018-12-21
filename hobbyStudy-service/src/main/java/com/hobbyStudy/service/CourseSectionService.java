package com.hobbyStudy.service;

import java.util.List;

import com.hobbyStudy.entity.CourseSections;

/**  
* @Description: TODO  
* @author shenjin 
* @date 2018年12月4日  
* @version V1.0  
*/
public interface CourseSectionService {

	/**
	*获取所有
	**/
	public List<CourseSections> getAll(CourseSections courseSections);
}
