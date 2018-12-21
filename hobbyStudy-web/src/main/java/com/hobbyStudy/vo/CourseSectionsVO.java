package com.hobbyStudy.vo;

import java.util.ArrayList;
import java.util.List;

import com.hobbyStudy.entity.CourseSections;

/**  
* @Description: 课程小节详情页
* @author shenjin 
* @date 2018年12月4日  
* @version V1.0  
*/
public class CourseSectionsVO extends CourseSections{
	
	    //小节
		private List<CourseSections> courseSections = new ArrayList<CourseSections>();

		public List<CourseSections> getCourseSections() {
			return courseSections;
		}

		public void setCourseSections(List<CourseSections> courseSections) {
			this.courseSections = courseSections;
		}
}
