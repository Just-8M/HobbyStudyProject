package com.hobbyStudy.service;

import java.util.List;

import com.hobbyStudy.entity.CourseClassify;

/**  
* @Description: TODO  
* @author shenjin 
* @date 2018年11月20日  
* @version V1.0  
*/
public interface CourseClassifyService {

	/**
	*获取所有
	**/
	public List<CourseClassify> getAllClassify();
	
	/**
	 * 根据code获取
	 */
	public CourseClassify getCode(String code);
}
