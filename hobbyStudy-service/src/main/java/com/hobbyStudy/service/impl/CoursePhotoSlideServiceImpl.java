package com.hobbyStudy.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hobbyStudy.dao.CoursePhotoSlideMapper;
import com.hobbyStudy.entity.CoursePhotoSlide;
import com.hobbyStudy.service.CoursePhotoSlideService;

/**  
* @Description: TODO  
* @author shenjin 
* @date 2018年11月19日  
* @version V1.0  
*/
@Service
public class CoursePhotoSlideServiceImpl implements CoursePhotoSlideService{

	@Autowired
	private CoursePhotoSlideMapper coursePhotoSlideMapper;
	
	// 查询轮番图
	@Override
	public List<CoursePhotoSlide> queryPhotoSilde(Integer count) {
		List<CoursePhotoSlide> resultList = coursePhotoSlideMapper.queryPhotoSilde(count);
		return resultList;
	}

}
