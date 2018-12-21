package com.hobbyStudy.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hobbyStudy.common.utils.page.TailPage;
import com.hobbyStudy.entity.CourseComment;
import com.hobbyStudy.service.CourseCommentService;

/**  
* @Description: 课程评论
* @author shenjin 
* @date 2018年12月5日  
* @version V1.0  
*/
@Controller
//@RequestMapping("/CourseCommentController")
public class CourseCommentController {
	
	@Autowired
	private CourseCommentService courseCommentService;

	//  加载课程的评论和答疑
	@RequestMapping("/courseComment")
	public ModelAndView CourseComment(CourseComment courseComment , TailPage<CourseComment> page){
		ModelAndView mv = new ModelAndView("forward:/comment.jsp");
		if(null == courseComment.getCourseId() || courseComment.getType() == null)
			return new ModelAndView("forward:/common/404"); 
		TailPage<CourseComment> pageComment = courseCommentService.queryPage(courseComment, page);
		mv.addObject("page", pageComment);
		return mv;
	}
}
