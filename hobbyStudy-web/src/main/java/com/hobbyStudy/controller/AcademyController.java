package com.hobbyStudy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
/**
 * 
* @Description: 线下学院  
* @author shenjin 
* @date 2018年12月21日  
* @version V1.0
 */
@Controller
public class AcademyController {
	@RequestMapping(value = "/areaSelectCourse")
	public ModelAndView areaSelectCourse(String school){
		ModelAndView mv = new ModelAndView("forward:offline.jsp");
		System.out.println(school);
		return mv;
	}
}
