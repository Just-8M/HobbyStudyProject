package com.hobbyStudy.service;

import java.util.List;

import com.hobbyStudy.entity.CoursePhotoSlide;

/**  
* @Description: TODO  
* @author shenjin 
* @date 2018年11月19日  
* @version V1.0  
*/
public interface CoursePhotoSlideService {

	/**
	* @Title: queryPhotoSilde  
	* @Description: (查询轮番效果图)  
	* @param     
	* @return List<PhotoSlide>  
	* @throws
	 */
	public List<CoursePhotoSlide> queryPhotoSilde(Integer count);
}
