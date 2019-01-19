package com.hobbyStudy.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
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
 * @Description: 用户
 * @author shenjin
 * @date 2018年11月10日
 * @version V1.0
 */
@Controller
/* @RequestMapping("/UserController") */
public class UserController {

	private static final long serialVersionUID = 1L;
	@Autowired
	private UserService userService;

	/**
	 * 
	 * @Title: doRegister @Description: (Ajax注册检查) @param @return
	 * JSONObject @throws
	 */
	@RequestMapping(value = "/AjaxRegister", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public JSONObject AjaxRegister(@Param("username") String username) {
		JSONObject json = new JSONObject();
		String temp = "";
		System.out.println("username:" + username);
		int count = userService.AjaxRegisterUsername(username);
		System.out.println(username + "   " + count);
		if (count > 0) {
			temp = "用户名：" + username + "已被注册，请更换用户名";
			json.put("result", temp);
		} else {
			temp = "用户名：" + username + "可以注册";
			json.put("result", temp);
		}
		return json;
	}

	/**
	 * @Description : 用户注册时下一步进行绑定邮箱
	 * @param
	 * @return
	 */
	@RequestMapping(value = "/BindEmail", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public JSONObject BindEmail(@Param("email") String email) {
		JSONObject json = new JSONObject();
		System.out.println("email:" + email);
		Boolean flag = userService.queryemail(email);
		System.out.println("flag值：" + flag);
		if (flag == true) {
			json.put("BindEmailResult", "邮箱已存在，请更换邮箱");
		} else {
			json.put("BindEmailResult", "邮箱可以使用");
		}
		return json;
	}

	/**
	 * 
	 * @Description 注册时发送邮件验证码
	 * @param
	 * @return:JSONObject
	 */
	@RequestMapping(value = "/register2", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public JSONObject register2(HttpServletRequest req, HttpServletResponse resp, @Param("email") String email)
			throws ServletException, IOException {
		JSONObject json = new JSONObject();
		try {
			System.out.println("邮箱邮箱：" + email);
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
			// 写入session
			req.getSession().setAttribute("code", code);
			json.put("code_result", "验证码发送成功");
		} catch (Exception e) {
			e.printStackTrace();
			req.getSession().setAttribute("error", "邮件发送失败");
			json.put("code_result", "验证码发送失败");
		}
		return json;
	}

	/**
	 * 
	 * @Description 验证邮箱验证码
	 * @param
	 */
	@RequestMapping(value = "/MailVerifyTest", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public JSONObject MailVerifyTest(HttpServletRequest req, HttpServletResponse resp,
			@Param("username") String username, @Param("password") String password, @Param("email") String email,
			@Param("emailCode") String emailCode) {
		JSONObject json = new JSONObject();
		String sessionCode = (String) req.getSession().getAttribute("code");
		System.out.println("注册成功之后保存的session" + sessionCode);
		// 获取session中的验证码
		if (sessionCode != null) {
			// 获取页面提交的验证码
			String inputCode = emailCode;
			System.out.println("页面提交的验证码:" + inputCode);
			if (sessionCode.toLowerCase().equals(inputCode.toLowerCase())) {
				// 把用户名和密码等一系列信息传入数据库中
				System.out.println("username:" + username);
				System.out.println("password:" + password);
				System.out.println("email:" + email);
				// 执行插入操作
				Boolean boo;
				if (username == "" || username == null) {
					// 执行邮箱注册，userid就是email
					boo = userService.insertUser(email, password, email);
					System.out.println("邮箱注册成功");
				} else {
					// 执行自定义用户名注册
					boo = userService.insertUser(username, password, email);
					System.out.println("插入boo:" + boo);
				}
				if (boo == true) {
					System.out.println("我注册成功");
					json.put("RegisterResult", "注册成功");
				} else {
					System.out.println("注册失败");
					json.put("RegisterResult", "注册失败");
				}
			} else {
				// 验证失败
				json.put("RegisterResult", "注册失败");
			}
		} else {
			// 验证失败
			json.put("RegisterResult", "注册失败");
		}
		// 移除session中的验证码
		req.getSession().removeAttribute("code");
		return json;
	}

	/**
	 * @Description 登录
	 * @param
	 * @return:JSONObject
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public JSONObject login(@Param("username") String username, @Param("password") String password,
			@Param("quit") String quit, @Param("Email") String Email, @Param("EmailCode") String EmailCode,
			HttpSession session, HttpServletRequest req, HttpServletResponse resp) {
		JSONObject json = new JSONObject();
		System.out.println("username:" + username);
		System.out.println("password:" + password);
		System.out.println("quit:" + quit);
		System.out.println("Email:" + Email);
		System.out.println("EmailCode:" + EmailCode);
		if ("exit".equals(quit)) {
			System.out.println("quit" + quit);
			session.removeAttribute("USER_IN_SESSION");
			/* return "forward:/getIndexPage"; */
			json.put("loginResult", "退出成功");
		} else {
			String userid = username;
			// 用户名和密码进行注册
			if (EmailCode == null || EmailCode.equals("")) {
				User user = userService.queryUsernameAndPsw(userid, password);
				System.out.println("USER:" + user);
				if (user != null) {
					session.setAttribute("USER_IN_SESSION", user);
					System.out.println("user不为空");
					json.put("loginResult", "登录成功");
				} else {
					session.setAttribute("fail", "账号或密码错误，请重新登录");
					System.out.println("账号或密码错误，请重新登录");
					json.put("loginResult", "登录失败");
				}
			} else {
				// 邮箱进行登录
				String sessionCode = (String) req.getSession().getAttribute("code");
				if (sessionCode != null) {
					// 获取页面提交的验证码
					String inputCode = EmailCode;
					System.out.println("页面提交的验证码:" + inputCode);
					User user = userService.queryEmail(Email); // 把邮箱传入到后台
					System.out.println("邮箱查找：" + user);
					if (sessionCode.toLowerCase().equals(inputCode.toLowerCase()) && user != null) {
						session.setAttribute("USER_IN_SESSION", user);
						System.out.println("邮箱登录成功");
						json.put("loginResult", "登录成功");
					} else {
						// 验证失败
						json.put("loginResult", "登录失败");
					}
				} else {
					// 验证失败
					json.put("loginResult", "登录失败");
				}
				// 移除session中的验证码
				req.getSession().removeAttribute("code");
			}
			return json;
		}
		return null;
	}

	/**
	 * @Description 退出
	 * @param
	 * @return:String
	 */
	@RequestMapping("/loginOut")
	public String loginOut(HttpSession session) {
		session.removeAttribute("USER_IN_SESSION");
		return "forward:/getIndexPage";
	}
	/**
	 * @Description   修改密码之后重新登录 
	 * @param
	 * @return:String
	 */
	@RequestMapping("/againlogin")
	public String againlogin(HttpSession session) {
		session.removeAttribute("USER_IN_SESSION");
		return "forward:/login.jsp";
	}
	/**
	 * @Description 忘记密码
	 * @param
	 * @return:JSONObject
	 */
	@RequestMapping(value = "/modifierPsw", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public JSONObject modifierPsw(@Param("Email") String Email, @Param("EmailCode") String EmailCode,
			HttpSession session, HttpServletRequest req, HttpServletResponse resp) {
		JSONObject json = new JSONObject();
		User session_user = (User) req.getSession().getAttribute("USER_IN_SESSION");
		System.out.println("我是存放在session中验证码：：" + session_user);
		System.out.println("Email:" + Email);
		System.out.println("EmailCode:" + EmailCode);
		// 邮箱进行登录
		String sessionCode = (String) req.getSession().getAttribute("code");
		if (sessionCode != null) {
			// 获取页面提交的验证码
			String inputCode = EmailCode;
			System.out.println("修改密码页面提交的验证码:" + inputCode);
			String session_user_userid = session_user.getUserid();
			User user = userService.queryEmail(Email);              // 把邮箱传入到后台
			if (user.getUserid().equals(session_user_userid)) {  
				// 根据Email查询出来的Userid和session_user中存放的userid进行想比较
				System.out.println("是同一人");
				json.put("modifierPswResult", "true");
			}else{
				// 验证失败
				System.out.println("不是同一人");
				json.put("modifierPswResult", "false");
			}
		} else {
			// 验证失败
			json.put("modifierPswResult", "邮箱和账户不是同一人");
		}
		// 移除session中的验证码
		req.getSession().removeAttribute("code");
		return json;
	}

	/**
	 * 
	 * @Title: queryTaBySort
	 * @Description: (寻Ta轮番图功能)
	 * @param @return
	 * ModelAndView @throws
	 */
	@ResponseBody
	@RequestMapping("/queryTaBySort")
	public ModelAndView queryTaBySort(User user, HttpSession session) {
		ModelAndView mv = new ModelAndView("forward:/findTa.jsp");
		List<User> userFansList = userService.queryTaBySort(null);
		for (User u : userFansList) {
			System.out.println("领学者姓名：" + u.getUserid() + "id :" + u.getId());
		}
		mv.addObject("userFansList", userFansList);
		return mv;
	}

	/**
	 * 
	 * @Title: xunTaLikeCount @Description: (寻Ta点赞功能) 传入对象和传入参数值都可以
	 * ，传入参数只需要在dao层表明参数对应的值 @param @return void @throws
	 */
	// 传入对象
	/*
	 * @RequestMapping("/xunTaLikeCount") public void xunTaLikeCount(User user){
	 * System.out.println(user.getLikeCount() +"-----" + user.getUserid());
	 * Boolean b = userService.updateLikeCount(user); System.out.println(b); if
	 * (b == true) { // 表明点赞成功(1表示是点赞)
	 * userService.insertUserLikeirem(user.getUserid(),1); } }
	 */
	// 传入参数
	@RequestMapping("/xunTaLikeCount")
	public void xunTaLikeCount(@Param("likeCount") String likeCount, @Param("userid") String userid,
			@Param("login_userid") String login_userid) {
		System.out.println("likeCount:" + likeCount + "userid:" + userid + "login_userid:" + login_userid);
		Boolean b = userService.updateLikeCount(likeCount, userid);
		System.out.println("boolean:" + b);
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		/* System.out.println(df.format(new Date()));// new Date()为获取当前系统时间 */
		if (b == true) {
			String creatUser = login_userid; // 点赞人
			String u_userid = userid; // 被点赞
			Boolean insert = userService.insertUserLikeitem(u_userid, "1", df.format(new Date()), creatUser);
			System.out.println("insert:" + insert);
			if (insert == true) {

			}
		}
	}

	/**
	 * @Title: 寻Ta模块 @Description: (通过学校查询领学者) @param @return List<User> @throws
	 */
	@ResponseBody
	@RequestMapping(value = "/Test", method = RequestMethod.POST)
	public List<User> Test(@RequestParam("schoolName") String schoolName, HttpServletRequest request) {
		List<User> queryUserBySchoolName = userService.queryUserBySchool(schoolName);
		System.out.println(schoolName);
		/*
		 * for (User user : queryUserBySchoolName) {
		 * System.out.println("queryUserBySchoolName:" + user.getId()); }
		 */
		request.setAttribute("queryUserBySchoolName", queryUserBySchoolName);
		return queryUserBySchoolName;
	}
	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping(value = "/Test") public ModelAndView Test(String
	 * schoolName,HttpSession session) { ModelAndView mv = new
	 * ModelAndView("forward:/findTa.jsp"); // 查询领学者 List<User>
	 * queryUserBySchoolName = userService.queryUserBySchool(schoolName);
	 * System.out.println(queryUserBySchoolName); for (User user :
	 * queryUserBySchoolName) { System.out.println("queryUserBySchoolName:" +
	 * user.getId()); } System.out.println(schoolName);
	 * mv.addObject("queryUserBySchoolName", queryUserBySchoolName); return mv;
	 * }
	 */

	// 查询个人详情
	@RequestMapping(value = "/queryPersonDetail") // 映射路径
	public ModelAndView queryPersonDetail(Integer id) {
		ModelAndView mv = new ModelAndView("forward:/leader.jsp");
		User personDetail = userService.queryPersonDetail(id);
		mv.addObject("personDetail", personDetail);
		return mv;
	}

	// 个人中心
	@RequestMapping(value = "/personCenter") // 映射路径
	public ModelAndView personCenter(Integer id) {
		ModelAndView mv = new ModelAndView("forward:/WEB-INF/user/PersonCenter.jsp");
		User PersonCenterDetail = userService.queryPersonDetail(id);
		mv.addObject("PersonCenterDetaild", PersonCenterDetail);
		return mv;
	}

	/**
	 * 个人信息修改(不包括密码)
	 * 
	 * @param userid
	 * @param title
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/updatePersonInfor") // 映射路径
	public Boolean updatePersonInfor(String userid, String nickname, int gender, String province, String city,
			String district, String title, String sign) {
		System.out.println("useridL:" + userid + "sign：" + sign);
		Boolean boo = userService.updatePersonInfor(userid, nickname, gender, province, city, district, title, sign);
		System.out.println("b：" + boo);
		return boo;
	}

	/**
	 * @Description 修改user密码
	 * @param
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/updatePersonPsw") // 映射路径
	public Boolean updatePersonPsw(String userid, String oldPassword, String newPassword) {
		System.out.println("oldPassword:" + oldPassword + "    userid：" + userid);
		Boolean boo;
		 //  验证邮箱之后修改密码
		if (oldPassword == null || oldPassword.equals("")) {
			boo = userService.updataUserPsw(userid, newPassword); 
			return boo;
		}else{
			User user = userService.selectoldPassword(userid);
			System.out.println("boo:" + user);
			if (user != null && user.getPassword().equals(oldPassword)) {
				System.out.println("密码相等");
				 boo = userService.updataUserPsw(userid, newPassword); 
				return boo;
			} else {
				System.out.println("密码不等");
				return false;
			}
		}
	}
}
