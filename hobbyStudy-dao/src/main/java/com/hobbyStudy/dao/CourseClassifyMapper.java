package com.hobbyStudy.dao;

import java.util.List;

import com.hobbyStudy.entity.CourseClassify;

/**  
* @Description: 课程分类
* @author shenjin 
* @date 2018年11月20日  
* @version V1.0  
*/
public interface CourseClassifyMapper {
	/**
	*获取所有
	**/
	public List<CourseClassify> getAllClassify();
	/**
	 * 根据条件动态获取
	 * @param queryEntity
	 * @return
	 */
	public List<CourseClassify> queryByCondition(CourseClassify queryAll);
}
