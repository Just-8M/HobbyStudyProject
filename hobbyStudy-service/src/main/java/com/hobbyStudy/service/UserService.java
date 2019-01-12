package com.hobbyStudy.service;

import java.util.Date;
import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.hobbyStudy.entity.Course;
import com.hobbyStudy.entity.User;

/**
 * @Description: Users
 * @author shenjin
 * @date 2018年11月10日
 * @version V1.0
 */
public interface UserService {
	/**
	 * 
	* @Title: AjaxRegisterUsername  
	* @Description: (Ajax用户名检查)  
	* @param     
	* @return int  
	* @throws
	 */
	public int AjaxRegisterUsername(String username);
	/**
	 * 
	* @Title: getByUsernameAndPassword  
	* @Description: (注册)  
	* @param     
	* @return Boolean  
	* @throws
	 */
	public Boolean getByUsernameAndPassword(User user);
	/**
	* @Title: login  
	* @Description: (登录)  
	* @param     
	* @return User  
	* @throws
	 */
	public User login(User users);
	/**
	 * 
	* @Title: getRecommendTeacher  
	* @Description: (首页推荐5个讲师)  
	* @param     
	* @return List<User>  
	* @throws
	 */
	public List<User> getRecommendTeacher();
	
	/**
	 * 
	* @Title: getByUsername  
	* @Description: (根据username获取)  
	* @param     
	* @return User  
	* @throws
	 */
	public User getByUsername(String username);
	/**
	 * 
	* @Title: queryTaBySort  
	* @Description: (寻Ta中按照粉丝进行排序)  
	* @param     
	* @return Boolean  
	* @throws
	 */
	public List<User> queryTaBySort(Integer fansCount);
	
	/**
	 * 
	* @Title: queryUserBySchool  
	* @Description: (通过学校查领学者)  
	* @param     
	* @return List<User>  
	* @throws
	 */
	public List<User> queryUserBySchool(String schoolName);
	
	/**  
	* @Title: queryPersonDetail  
	* @Description: (查询个人详情)  
	* @param     
	* @return User  
	* @throws  
	*/  
	public User queryPersonDetail(Integer id);
	
	/**  
	* @Title: queryUsernameAndPsw  
	* @Description: (Login in)  
	* @param     
	* @return User  
	* @throws  
	*/  
	public User queryUsernameAndPsw(String userid, String password);
	
	/**  
	* @Title: updateLikeCount  
	* @Description: (点赞功能)  
	* @param     
	* @return void  
	* @throws  
	*/  
	public Boolean updateLikeCount(String likeCount, String userid);
	
	/**  
	* @Title: updateLikeCount  
	* @Description: (这里用一句话描述这个方法的作用)  
	* @param     
	* @return Boolean  
	* @throws  
	*/  
	public Boolean updateLikeCount(User user);
	/**
	 * 更新点赞表
	 * @param userid
	 * @param i
	 */
	public Boolean insertUserLikeitem(String u_userid, String type, String createTime, String creatUser);
	/**
	 * 
	 * @return 
	 * @Description   更新个人信息
	 * @Author shenjin
	 */
	public Boolean updatePersonInfor(String userid, String nickname, int gender, String province, String city,
                                     String district, String title, String sign);
}
