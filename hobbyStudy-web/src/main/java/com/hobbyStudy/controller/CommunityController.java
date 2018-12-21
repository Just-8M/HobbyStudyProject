package com.hobbyStudy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hobbyStudy.entity.Course;
import com.hobbyStudy.service.CourseService;
/**  
* @Description: 精彩社区
* @author shenjin academy 
* @date 2018年12月20日  
* @version V1.0  
*/
@Controller
public class CommunityController {
	
	@Autowired
	private CourseService courseService;
	//查询精选课程
	@RequestMapping("/communityCourse")
	public ModelAndView communityCourse(){
		ModelAndView mv = new ModelAndView("forward:community.jsp");
		List<Course> selectionCourseList = courseService.querySelectionCourse();
		mv.addObject("selectionCourseList", selectionCourseList);
		return mv;
	}
}
