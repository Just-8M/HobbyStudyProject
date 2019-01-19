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
	 * 
	 * @Description  用户注册 
	 * @param
	 * @return:Boolean
	 */
	public Boolean insertUser(String username, String password, String email);

	/**  
	* @Title: queryUsernameAndPsw  
	* @Description: (Login in)  
	* @param     
	* @return User  
	* @throws  
	*/  
	public User queryUsernameAndPsw(String userid, String password);
	public User queryEmail(String email);
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
	* @Title: updateLikeCount  
	* @Description: (点赞功能)  
	* @param     
	* @return void  
	* @throws  
	*/  
	public Boolean updateLikeCount(String likeCount, String userid);
	
	/**  
	* @Title: updateLikeCount  
	* @Description: (更新点赞数量)  
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
	 */
	public Boolean updatePersonInfor(String userid, String nickname, int gender, String province, String city,
                                     String district, String title, String sign);
	/**
	 * 
	 * @Description   判断密码是否和数据库中相等
	 * @param
	 * @return
	 */
	public User selectoldPassword(String userid);
	/**
	 * 
	 * @Description  查询邮箱和用户是否为同一人 
	 * @param
	 * @return:Boolean
	 */
	public Boolean queryUseridAndEmail(String userid, String email);
	/**
	 * @Description   修改密码
	 * @param
	 * @return
	 */
	public Boolean updataUserPsw(String userid, String newPassword);
	/**
	 * 
	 * @Description 查看邮箱是否存在 
	 * @param
	 * @return:Boolean
	 */
	public Boolean queryemail(String email);
	
	
	
}
