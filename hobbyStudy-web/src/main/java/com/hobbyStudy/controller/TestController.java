package com.hobbyStudy.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hobbyStudy.entity.CoursePhotoSlide;
import com.hobbyStudy.entity.VideoType;
import com.hobbyStudy.service.CoursePhotoSlideService;
import com.hobbyStudy.service.VideoTypeService;


/**
 * 测试控制器
 * 
 * @author LENOVO
 *
 */
@Controller
@RequestMapping("/TestController")
public class TestController {

	@RequestMapping("/Test")
	public ModelAndView Test() {
		ModelAndView mv = new ModelAndView("forward:/WEB-INF/user/PersonCenter.jsp");
		return mv;
	}
}
