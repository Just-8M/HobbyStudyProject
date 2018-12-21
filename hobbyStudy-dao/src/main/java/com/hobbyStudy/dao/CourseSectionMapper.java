package com.hobbyStudy.dao;

import java.util.List;

import com.hobbyStudy.entity.CourseSections;

/**  
* @Description: TODO  
* @author shenjin 
* @date 2018年12月4日  
* @version V1.0  
*/
public interface CourseSectionMapper {

	
	/**  
	* @Title: getAll  
	* @Description: (这里用一句话描述这个方法的作用)  
	* @param     
	* @return List<CourseSections>  
	* @throws  
	*/  
	List<CourseSections> getAll(CourseSections courseSections);
	
}
