package com.hobbyStudy.controller;


import java.io.IOException;
import java.util.List;
import java.util.Properties;

import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.MimeMessage;
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

import com.hobbyStudy.common.utils.mail.JavaMailUtil;
import com.hobbyStudy.common.utils.mail.RandomUtil;
import com.hobbyStudy.common.utils.mail.html.htmlText;
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
	@RequestMapping("register2")
	public JSONObject register2(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		JSONObject json = new JSONObject();
		try {
			String email = req.getParameter("email");
			JavaMailUtil.receiveMailAccount = email; // 给用户输入的邮箱发送邮件

			// 1、创建参数配置，用于连接邮箱服务器的参数配置
			Properties props = new Properties();
			// 开启debug调试
			props.setProperty("mail.debug", "true");
			// 发送服务器需要身份验证
			props.setProperty("mail.smtp.auth", "true");
			// 设置右键服务器的主机名
			props.setProperty("mail.host", JavaMailUtil.emailSMTPHost);
			// 发送邮件协议名称
			props.setProperty("mail.transport.protocol", "smtp");

			// 2、根据配置创建会话对象，用于和邮件服务器交互
			Session session = Session.getInstance(props);
			// 设置debug，可以查看详细的发送log
			session.setDebug(true);
			// 3、创建一封邮件
			String code = RandomUtil.getRandom();
			System.out.println("邮箱验证码：" + code);
			String html = htmlText.html(code);
			MimeMessage message = JavaMailUtil.creatMimeMessage(session, JavaMailUtil.emailAccount,
					JavaMailUtil.receiveMailAccount, html);

			// 4、根据session获取邮件传输对象
			Transport transport = session.getTransport();
			// 5、使用邮箱账号和密码连接邮箱服务器emailAccount必须与message中的发件人邮箱一致，否则报错
			transport.connect(JavaMailUtil.emailAccount, JavaMailUtil.emailPassword);
			// 6、发送邮件,发送所有收件人地址
			transport.sendMessage(message, message.getAllRecipients());
			// 7、关闭连接
			transport.close();
			//  写入session
			req.getSession().setAttribute("code", code);
		} catch (Exception e) {
			e.printStackTrace();
			req.getSession().setAttribute("error", "邮件发送失败");
		}
		return json;
		
		}
	@RequestMapping("MailVerify")
	public ModelAndView MailVerify(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String sessionCode = (String) req.getSession().getAttribute("code");
		System.out.println("sessionCode:" + sessionCode);
	//  获取session中的验证码
			if(sessionCode != null) {
				//  获取页面提交的验证码
				String inputCode = req.getParameter("code");
				System.out.println("页面提交的验证码:" + inputCode);
				if (sessionCode.toLowerCase().equals(inputCode.toLowerCase())) {   //  大小写转化
					// 把用户名和密码等一系列信息传入数据库中
					String username = req.getParameter("username");
					String password = req.getParameter("password");
					
					//  验证成功，跳转成功页面
					req.setAttribute("username", username);
					return new ModelAndView("forward:success.jsp");
				}else {
					//  验证失败
					return new ModelAndView("forward:fail.jsp");
				}
			}else {
				//  验证失败
				ModelAndView mv = new ModelAndView("");
				req.getRequestDispatcher("/fail.jsp").forward(req, resp);
			}//  移除session中的验证码
			req.removeAttribute("code");
			return null;
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
	/**
	 * 
	* @Title: queryTaBySort  
	* @Description: (寻Ta轮番图功能)  
	* @param     
	* @return ModelAndView  
	* @throws
	 */
	@ResponseBody     
	@RequestMapping("/queryTaBySort")   //  映射路径
    public ModelAndView queryTaBySort(User user,HttpSession session){
		ModelAndView mv = new ModelAndView("forward:/findTa.jsp");
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

















