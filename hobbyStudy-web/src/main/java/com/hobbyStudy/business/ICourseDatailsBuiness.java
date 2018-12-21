package com.hobbyStudy.business;

import java.util.List;

import com.hobbyStudy.vo.CourseSectionsVO;

/**
 * @Description: 课程详情页面
 * @author shenjin
 * @date 2018年12月4日
 * @version V1.0
 */
public interface ICourseDatailsBuiness {
	/**
	 * 
	 * @Title: getCourseSections 
	 * @Description: (获取课程章节) 
	 * @param @return
	 * List<CourseSectionsVO> 
	 * @throws
	 */
	List<CourseSectionsVO> getCourseSections(Long courseId);
}
