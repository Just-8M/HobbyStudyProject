package com.hobbyStudy.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hobbyStudy.dao.CourseSectionMapper;
import com.hobbyStudy.entity.CourseSections;
import com.hobbyStudy.service.CourseSectionService;

/**  
* @Description: TODO  
* @author shenjin 
* @date 2018年12月4日  
* @version V1.0  
*/
@Service
public class CourseSectionServiceImpl  implements CourseSectionService{

	@Autowired
	private CourseSectionMapper courseSectionMapper;
	@Override
	public List<CourseSections> getAll(CourseSections courseSections) {
		return courseSectionMapper.getAll(courseSections);
	}
}
