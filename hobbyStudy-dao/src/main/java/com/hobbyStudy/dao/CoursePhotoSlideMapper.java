package com.hobbyStudy.dao;

import java.util.List;

import com.hobbyStudy.entity.CoursePhotoSlide;

/**  
* @Description: TODO  
* @author shenjin 
* @date 2018年11月15日  
* @version V1.0  
*/
public interface CoursePhotoSlideMapper {
	
	/**
	* @Title: queryPhotoSilde  
	* @Description: (查询轮番效果图)  
	* @param     
	* @return List<PhotoSlide>  
	* @throws
	 */
	public List<CoursePhotoSlide> queryPhotoSilde(Integer count);
}
