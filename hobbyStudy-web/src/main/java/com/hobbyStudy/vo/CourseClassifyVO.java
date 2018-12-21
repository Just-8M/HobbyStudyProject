package com.hobbyStudy.vo;

import java.util.ArrayList;
import java.util.List;

import com.hobbyStudy.entity.Course;
import com.hobbyStudy.entity.CourseClassify;

/**
 * 
* @Description:页面展示 value object 
* @author shenjin 
* @date 2018年12月4日  
* @version V1.0
 */
public class CourseClassifyVO extends CourseClassify{
	//二级分类
	private List<CourseClassify> subClassifyList = new ArrayList<CourseClassify>();

	//课程推荐列表
	private List<Course> recomdCourseList ;
	
	public List<CourseClassify> getSubClassifyList() {
		return subClassifyList;
	}
	
	public void setSubClassifyList(List<CourseClassify> subClassifyList) {
		this.subClassifyList = subClassifyList;
	}

	public List<Course> getRecomdCourseList() {
		return recomdCourseList;
	}

	public void setRecomdCourseList(List<Course> recomdCourseList) {
		this.recomdCourseList = recomdCourseList;
	}
	
}
