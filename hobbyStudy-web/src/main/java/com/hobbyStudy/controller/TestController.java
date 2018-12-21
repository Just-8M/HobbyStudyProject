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
public class TestController {
	private static Logger log = Logger.getLogger(TestController.class);
	// 跳转到测试页面
	private static final String Test = "test";

	//  引用service层
	@Autowired
	private VideoTypeService videoTypeService;  

	@RequestMapping("/hello")
	public String Hello() {
		System.out.println("hello");
		return Test;
	}
	/**
	 * 提供一个返回json格式，查询所有videoType
	 * @ResponseBody  表示返回json格式的
	 * @return
	 */
	@ResponseBody                      //  返回json格式
	@RequestMapping("/getVideoTypeList")   //  映射路径
    public List<VideoType> getVideoTypeList(){
		 List<VideoType> listVideoType = videoTypeService.getVideoType(null);
		
		 for (VideoType vt : listVideoType) {
			 log.info(vt.toString());
		}
		return listVideoType;
    }
	@Autowired
	 private  CoursePhotoSlideService  courseService;
	
	@RequestMapping(value="getIndexPages")
	public ModelAndView getIndexPages() {        
		ModelAndView mv = new ModelAndView("forward:/Test.jsp");
		//加载轮播
		//加载轮播
				List<CoursePhotoSlide> coursePhotoSlideList = courseService.queryPhotoSilde(3);
		mv.addObject("CoursePhotoSlideList", coursePhotoSlideList);
	    return mv;
	}
}
