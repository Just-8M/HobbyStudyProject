package com.hobbyStudy.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hobbyStudy.common.utils.page.TailPage;
import com.hobbyStudy.entity.CourseComment;
import com.hobbyStudy.entity.User;
import com.hobbyStudy.service.CourseCommentService;

import net.sf.json.JSONObject;

/**  
* @Description: 课程评论
* @author shenjin 
* @date 2018年12月5日  
* @version V1.0  
*/
@Controller
@RequestMapping("/courseCommentController")
public class CourseCommentController {
	
	@Autowired
	private CourseCommentService courseCommentService;
	
	@RequestMapping(value = "/addCourseComment", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public JSONObject addCourseComment(CourseComment courseComment,HttpSession session,Integer courseId) {
		JSONObject json = new JSONObject();
		System.out.println("评论内容：" + courseComment.getContent() + "---" + courseId);
		
		User session_user = (User) session.getAttribute("USER_IN_SESSION");   //  得到登录用户
		if (session_user != null) {
			courseComment.setUserid(session_user.getUserid());  //  设置评论人员
			courseComment.setCourseId(courseId);
			courseComment.setType(0);
			courseComment.setCreateUser(session_user.getUserid());
			int addResult = courseCommentService.addCourseComment(courseComment);
			if (addResult>0) {
				json.put("addCommentResult", "success");
			}else{
				json.put("addCommentResult", "fail");
			}
		}else{
			json.put("addCommentResult", "loginfail");
		}
		return json;
	}
	//  加载课程的评论和答疑
	@RequestMapping("/courseComment")
	public ModelAndView courseComment(CourseComment courseComment , TailPage<CourseComment> page,Integer courseId){
		ModelAndView mv = new ModelAndView("forward:/comment.jsp");
		if(null == courseComment.getCourseId() || courseComment.getType() == null)
			return new ModelAndView("forward:/common/404"); 
		TailPage<CourseComment> pageComment = courseCommentService.queryPage(courseComment, page);
		mv.addObject("courseId", courseId);
		mv.addObject("page", pageComment);
		return mv;
	}
}
