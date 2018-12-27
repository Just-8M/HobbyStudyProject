package com.hobbyStudy.controller;


import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hobbyStudy.entity.User;
import com.hobbyStudy.service.UserService;

import net.sf.json.JSONObject;

/**
 * @Description: TODO
 * @author shenjin
 * @date 2018年11月10日
 * @version V1.0
 */
@Controller
/*@RequestMapping("/UserController")*/
public class UserController{

	private static final long serialVersionUID = 1L;
	@Autowired
	private UserService userService;
	/**
	 * 
	* @Title: doRegister  
	* @Description: (Ajax注册检查)  
	* @param     
	* @return JSONObject  
	* @throws
	 */
	@RequestMapping(value = "/AjaxRegister", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public JSONObject AjaxRegister(@RequestParam("username") String username) {
		JSONObject json = new JSONObject();
		String temp = "";
		int count = userService.AjaxRegisterUsername(username);
		System.out.println(username + "   " + count);
		if (count > 0) {
			temp = "用户名：" +  username + "已被注册，请更换用户名";
			json.put("result", temp);
		} else {
			temp = "用户名：" +  username + "可以注册";
			json.put("result", temp);
		}
		System.out.println(temp);
		return json;
	}
	/**
	 * 
	* @Title: Register  
	* @Description: (Ajax注册)  
	* @param     
	* @return JSONObject  
	* @throws
	 */
	@RequestMapping(value = "/Register", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public JSONObject Register(User user) {
		JSONObject json = new JSONObject();
		System.out.println(  "密码：" + user.getPassword() + user);
        Boolean flag  = userService.getByUsernameAndPassword(user);
        System.out.println("flag值："+flag);
        if (flag == true) {
        	json.put("RegisterResult", "注册成功");
		}else{
			json.put("RegisterResult", "注册失败");
		}
        return json;
    }
	@RequestMapping("login")
	public String login(User user,HttpSession session){
		User u = userService.login(user);
		if(user!=null){
			session.setAttribute("user", user);
			return "redirect:/main.jsp";
		}else{
			return "redirect:/index.jsp";
		}
	}
	
	@ResponseBody     
	@RequestMapping("/queryTaBySort")   //  映射路径
    public ModelAndView queryTaBySort(User user,HttpSession session){
		ModelAndView mv = new ModelAndView("forward:/fail.jsp");
		List<User> userFansList = userService.queryTaBySort(null);
	    for (User u : userFansList) {
			System.out.println("领学者姓名：" + u.getUserid() + "id :" + u.getId());
		}
	    mv.addObject("userFansList", userFansList);
		return  mv;
    }
	//  通过学校查询领学者
	@ResponseBody
	@RequestMapping(value = "/Test", method = RequestMethod.POST)
    public List<User> Test(@RequestParam("schoolName") String schoolName,HttpServletRequest request) {
		List<User> queryUserBySchoolName = userService.queryUserBySchool(schoolName);
		System.out.println(schoolName);
		/*for (User user : queryUserBySchoolName) {
			System.out.println("queryUserBySchoolName:" + user.getId());
		}*/
		request.setAttribute("queryUserBySchoolName",queryUserBySchoolName);
		return queryUserBySchoolName;
	}
	/*@ResponseBody
	@RequestMapping(value = "/Test")
	 public ModelAndView Test(String schoolName,HttpSession session) {
		ModelAndView mv = new ModelAndView("forward:/findTa.jsp");
		  //  查询领学者
	    List<User> queryUserBySchoolName = userService.queryUserBySchool(schoolName);
		System.out.println(queryUserBySchoolName);
		for (User user : queryUserBySchoolName) {
			System.out.println("queryUserBySchoolName:" + user.getId());
		}
		System.out.println(schoolName);
		mv.addObject("queryUserBySchoolName", queryUserBySchoolName);
		return mv;
	 }*/
	
	//  查询个人详情
	@RequestMapping(value = "/queryPersonDetail")   //  映射路径
    public ModelAndView queryPersonDetail(Integer id){
		ModelAndView mv = new ModelAndView("forward:/leader.jsp");
		User  personDetail = userService.queryPersonDetail(id);
	    mv.addObject("personDetail", personDetail);
		return  mv;
    }
	
}

















