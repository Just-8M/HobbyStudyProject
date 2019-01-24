package com.hobbyStudy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hobbyStudy.entity.User;

/**
 * @Description: 用户功能
 * @author shenjin
 * @date 2018年11月10日
 * @version V1.0
 */
public interface UserMapper {
	/**
	 * @Title: AjaxRegisterUsername 
	 * @Description: (Ajax异步进行注册判断) 
	 * @param @return
	 * long @throws
	 */
	public int AjaxRegisterUsername(String username);

	/**
	 * 
	 * @Title: getByUsernameAndPassword 
	 * @Description: (用户注册) 
	 * @param @return
	 * User @throws
	 */
	public Boolean getByUsernameAndPassword(User user);

	/**
	 * 
	* @Title: getRecommendTeacher  
	* @Description: 首页推荐5个讲师 
	* @param     
	* @return List<User>  
	* @throws
	 */
	public List<User> getRecommendTeacher();

	
	/**  
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
	* public List<User> queryTaBySort();    不传参数也可行
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
	* 传递多个参数加上@Param
	* @return User  
	* @throws  
	*/  
	public User queryUsernameAndPsw(@Param("userid") String userid, @Param("password") String password);
	public User queryEmail(String email);
//	public User queryUsernameAndPsw(String userid,String password); //  错误
	// 查询邮箱和用户是否为同一人
	public Boolean queryUseridAndEmail(String userid, String email);
	
	/**  
	* @Title: LikeCount  
	* @Description: (点赞功能)  
	* @param     
	* @return void  
	* @throws  
	*/  
	public Boolean updateLikeCount(@Param("likeCount") String likeCount, @Param("userid") String userid);

	
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
	public void insertUserLikeirem(String userid, int i);
	/**
	 * 
	 * @Description : 修改个人中心
	 *@param
	 * @return
	 */
	public Boolean updatePersonInfor(@Param("userid") String userid, @Param("nickname") String nickname, @Param("gender") int gender,
                                     @Param("province") String province, @Param("city") String city,
                                     @Param("district") String district, @Param("title") String title, @Param("sign") String sign);
	//  查询输入密码和数据库是否相等
	public User selectoldPassword(@Param("userid") String userid);
	// 修改密码
	public Boolean updataUserPsw(@Param("userid") String userid, @Param("password") String newPassword);
	// 查看邮箱是否 被注册
	public Boolean queryemail(String email);
	//  注册
	public Boolean insertUser(@Param("userid") String username, @Param("password") String password, @Param("email") String email);

	//  更新审核人上传材料信息
	public int updateCheckPeople(User user);

	

	
}
