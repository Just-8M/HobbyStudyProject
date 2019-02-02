package com.hobbyStudy.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hobbyStudy.common.utils.MD5Util;
import com.hobbyStudy.entity.Admin;
import com.hobbyStudy.entity.AdminOperateLog;
import com.hobbyStudy.entity.Course;
import com.hobbyStudy.entity.ProveMaterials;
import com.hobbyStudy.entity.User;
import com.hobbyStudy.service.AdminService;
import com.hobbyStudy.service.CourseService;
import com.hobbyStudy.service.ProveMaterialsService;
import com.hobbyStudy.service.UserService;

import net.sf.json.JSONObject;


/**
 * @Description
 * @author shenjin
 * 
 */
@Controller
@RequestMapping("/adminController")
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private CourseService courseService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ProveMaterialsService proveMaterialsService;
	
	/**
	 * @ToDo:跳转admin登录界面
	 * @Return :ModelAndView
	 */
	@RequestMapping("/adminLogin")
	public ModelAndView adminLogin() {
		ModelAndView mv = new ModelAndView("forward:/WEB-INF/admin/login.jsp");
		return mv;
	}
	/**
	 * @ToDo:管理员登录
	 * @param adminName
	 * @param password
	 * @param session
	 * @Return :JSONObject
	 */
	@RequestMapping(value = "/adminLoginImpl", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public JSONObject adminLoginImpl(@Param("adminName") String adminName, @Param("password") String password,HttpSession session){
		JSONObject json = new JSONObject();
		String Md5Psw = MD5Util.MD5(password);
		System.out.println("adminName: " + adminName+"  password: " + Md5Psw);
		Admin admin = adminService.queryAdminName(adminName);   //  通过adminName查询管理员是否存在
		System.out.println("admin:" + admin.getPassword());
		if (Md5Psw.equals(admin.getPassword())) {
			session.setAttribute("ADMIN_IN_SESSION", admin);  // 登录成功，将管理员信息保存session中
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			adminService.insertOperateRecord(admin.getAdminName(),"登录成功",df.format(new Date()));
			System.out.println("----admin登录成功-----");
			json.put("loginResult", "loginSuccess");
		}else{
			json.put("loginResult", "fail");  // admin存在，密码错误
		}
		return json;
	}
	/**
	 * @ToDo:管理员退出
	 * @param session
	 * @Return :String
	 */
	@RequestMapping("/loginOut")
	public String loginOut(HttpSession session) {
		
		Admin admin = (Admin) session.getAttribute("ADMIN_IN_SESSION");
		if (admin != null) {
			adminService.insertOperateRecord(admin.getAdminName(),"退出登录"," ");
			session.removeAttribute("ADMIN_IN_SESSION");
			return "forward:/WEB-INF/admin/login.jsp";
		}
		return "forward:/WEB-INF/admin/login.jsp";
	}
	/**
	 * @ToDo:跳转到后台管理首页
	 * @Return :ModelAndView
	 */
	@RequestMapping("/enterAdminPage")
	public ModelAndView enterAdminPage() {
		ModelAndView mv = new ModelAndView("forward:/WEB-INF/admin/enter.jsp");
		return mv;
	}
	/**
	 * @ToDo:跳转main页面
	 * @Return :ModelAndView
	 */
	@RequestMapping("/mainAdminPage")
	public ModelAndView MainAdminPage() {
		ModelAndView mv = new ModelAndView("forward:/WEB-INF/admin/main.jsp");
		return mv;
	}
	/**
	 * @ToDo:跳转verifyCourse界面
	 * @Return :ModelAndView
	 */
	@RequestMapping("/verifyCourse")
	public ModelAndView verifyCourse(String type) {
		ModelAndView mv = new ModelAndView("forward:/WEB-INF/admin/verifyCourse.jsp");
		List<Course> totalCourse = courseService.queryTotalCourse(type);
		if (!totalCourse.isEmpty()) {
			mv.addObject("totalCourse", totalCourse);
		}else{
			mv.addObject("totalCourse", "noCourse");
		}
		return mv;
	}
	/**
	 * @ToDo:跳转userlist界面
	 * @Return :ModelAndView
	 */
	@RequestMapping("/userlist")
	public ModelAndView userlist() {
		ModelAndView mv = new ModelAndView("forward:/WEB-INF/admin/userlist.jsp");
		List<User> totalUser = userService.queryTotalUser();
		if (!totalUser.isEmpty()) {
			mv.addObject("queryTotalUser", totalUser);
		}else{
			mv.addObject("queryTotalUser", "noUser");
		}
		return mv;
	}
	/**
	 * @ToDo:跳转realname界面，实名认证审核
	 * @Return :ModelAndView
	 */
	@RequestMapping("/realname")
	public ModelAndView realname() {
		ModelAndView mv = new ModelAndView("forward:/WEB-INF/admin/realname.jsp");
		List<User> checkUser = userService.queryUserCheck("1");    //  审核人资料
		for (User u : checkUser) {
			System.out.println("uuu:" + u.getId());
		}
		
		List<ProveMaterials> proveList =  proveMaterialsService.selectProveMaterials("实名认证");   //  图片资料证明
		if (!checkUser.isEmpty()) {
			System.out.println("realnameSearchResult:" + checkUser);
			mv.addObject("realnameSearchResult", checkUser);
		}else{
			mv.addObject("realnameSearchResult", "没有用户需要被审核...");
		}
		return mv;
	}
	/**
	 * @ToDo:跳转certification界面
	 * @Return :ModelAndView
	 */
	@RequestMapping("/certification") 
	public ModelAndView certification() {
		ModelAndView mv = new ModelAndView("forward:/WEB-INF/admin/certification.jsp");
		List<User> checkUser = userService.queryUserCheck("3");    //  审核人资料
		if (!checkUser.isEmpty()) {
			System.out.println("certificationSearchResult:" + checkUser);
			mv.addObject("certificationSearchResult", checkUser);
		}else{
			mv.addObject("certificationSearchResult", "没有用户需要被审核...");
		}
		return mv;
	}
	/**
	 * @ToDo:跳转leaderApply界面
	 * @Return :ModelAndView
	 */
	@RequestMapping("/leaderApply") 
	public ModelAndView leaderApply() {
		ModelAndView mv = new ModelAndView("forward:/WEB-INF/admin/leaderApply.jsp");
		return mv;
	}
	/**
	 * @ToDo:跳转adminerLogs界面
	 * @Return :ModelAndView
	 */
	@RequestMapping("/adminerLogs") // 映射路径
	public ModelAndView adminerLogs() {
		ModelAndView mv = new ModelAndView("forward:/WEB-INF/admin/adminerLogs.jsp");
		List<AdminOperateLog> operateList = adminService.queryAdminOperate();
		if (!operateList.isEmpty()) {
			mv.addObject("AdminOperateLog", operateList);
		}else{
			mv.addObject("AdminOperateLog", "暂无操作记录");
		}
		return mv;
	}
	/**
	 * @ToDo:查询全部已发布课程
	 * @Return :ModelAndView
	 */
	@RequestMapping("/publishCourse")
	public ModelAndView publishCourse(String type) {
		ModelAndView mv = new ModelAndView("forward:/WEB-INF/admin/publishCourse.jsp");
		List<Course> totalCourse = courseService.queryTotalCourse(type);
		System.out.println("totalCourse:" + totalCourse);
		if (!totalCourse.isEmpty()) {
			mv.addObject("totalCourse", totalCourse);
		}else{
			mv.addObject("totalCourse", "noCourse");
		}
		return mv;
	}
	/**
	 * @ToDo:课程列表中的搜索
	 * @param session
	 * @param name
	 * @Return :JSONObject
	 */
	@RequestMapping(value = "/searchCourse", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public JSONObject courseSearch(HttpSession session,String name,String type) {
		JSONObject json = new JSONObject();
		Admin session_admin =  (Admin) session.getAttribute("ADMIN_IN_SESSION");  
		if (session_admin != null) {
			System.out.println("name:" +name + "   " + "type:" +type);
			List<Course> searchCourseList = courseService.queryCourseName(name,type);
				if (searchCourseList.isEmpty()) {
					System.out.println("noCourse");
					json.put("searchCourseResult", "noCourse");
				}else{
					System.out.println("searchCourseList");
					json.put("searchCourseResult", searchCourseList);
				}
			
		}else{
			json.put("searchCourseResult", "fail");
		}
		return json;
	}
	@RequestMapping(value = "/searchUser", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public JSONObject searchUser(HttpSession session,String name) {
		JSONObject json = new JSONObject();
		Admin session_admin =  (Admin) session.getAttribute("ADMIN_IN_SESSION");  
		if (session_admin!=null) {
			List<User> totalUser = userService.queryUserName(name);
			if (!totalUser.isEmpty()) {
				json.put("searchUserResult", totalUser);
			}else{
				json.put("searchUserResult", "noUser");
			}
		}else{
			json.put("searchUserResult", "fail");
		}
		System.out.println("name" + name);
		return json;
	}
}
