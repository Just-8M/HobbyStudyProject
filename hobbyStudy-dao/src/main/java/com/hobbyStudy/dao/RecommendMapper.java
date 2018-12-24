package com.hobbyStudy.dao;

import java.util.List;

import com.hobbyStudy.entity.Course;
import com.hobbyStudy.entity.RecommendPhotoSlide;

/**  
* @Description: Recommend  
* @author shenjin 
* @date 2018年12月15日  
* @version V1.0  
*/
public interface RecommendMapper {

	/**  
	* @Title: queryNavigationPhoto  
	* @Description: (查询轮番图 )  
	* @param     
	* @return List<RecommendPhotoSlide>  
	* @throws  
	*/  
	public List<RecommendPhotoSlide> queryNavigationPhoto(Integer count);
}
