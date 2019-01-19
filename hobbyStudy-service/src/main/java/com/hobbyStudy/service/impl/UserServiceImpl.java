package com.hobbyStudy.service.impl;

import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hobbyStudy.common.utils.storage.QiniuStorage;
import com.hobbyStudy.dao.UserLikeMapper;
import com.hobbyStudy.dao.UserMapper;
import com.hobbyStudy.entity.User;
import com.hobbyStudy.service.UserService;

/**  
* @Description: User功能板块
* @author shenjin 
* @date 2018年11月14日  
* @version V1.0  
*/
@Service
public class UserServiceImpl implements  UserService{

	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private UserLikeMapper UserLikeMapper;
	
	@Override
	public int AjaxRegisterUsername(String username) {
		return userMapper.AjaxRegisterUsername(username);
	}
	@Override
	public Boolean getByUsernameAndPassword(User user) {
		return userMapper.getByUsernameAndPassword(user);
	}
	/**
	 * 获取首页推荐5个讲师
	 */
	@Override
	public List<User> getRecommendTeacher() {
		List<User> recomdList = userMapper.getRecommendTeacher();
		if(CollectionUtils.isNotEmpty(recomdList)){
			for(User item : recomdList){
				/*if(StringUtils.isNotEmpty(item.getHeader())){
					item.setHeader(QiniuStorage.getUrl(item.getHeader()));
				}*/
			}
		}
		return recomdList;
	}
	@Override
	public User getByUsername(String username) {
		return userMapper.getByUsername(username);
	}
	// 根据粉丝数量查询出前10
	@Override
	public List<User> queryTaBySort(Integer fansCount) {
		return userMapper.queryTaBySort(fansCount);
	}
	//  通过学校查学生
	@Override
	public List<User> queryUserBySchool(String schoolName) {
		return userMapper.queryUserBySchool(schoolName);
	}
	//  查询个人详情
	@Override
	public User queryPersonDetail(Integer id) {
		return userMapper.queryPersonDetail(id);
	}
	/**
	 * 登录
	 */
	
	@Override
	public User queryUsernameAndPsw(String userid, String password) {
		return userMapper.queryUsernameAndPsw(userid,password);
	}
	/**
	 * 点赞功能
	 */
	@Override
	public Boolean updateLikeCount(String likeCount,String userid) {
		return userMapper.updateLikeCount(likeCount,userid);
	}
	
	@Override
	public Boolean updateLikeCount(User user) {
		return userMapper.updateLikeCount(user);
	}
	//  更新点赞表
	@Override
	public Boolean insertUserLikeitem(String u_userid, String type,String  createTime,String creatUser){
		return UserLikeMapper.insertUserLikeitem(u_userid,type,createTime,creatUser);
	}
	//  更新个人信息
	@Override
	public Boolean updatePersonInfor(String userid, String nickname, int gender, String province, String city,
			String district, String title, String sign) {
		 return userMapper.updatePersonInfor(userid,nickname,gender,province,city,district,title,sign);
	}
	// 查询邮箱和用户是否为同一人
	@Override
	public Boolean queryUseridAndEmail(String userid, String email) {
		return userMapper.queryUseridAndEmail(userid,email);
	}
	@Override
	public User selectoldPassword(String userid) {
		return userMapper.selectoldPassword(userid);
	}
	@Override
	public Boolean updataUserPsw(String userid, String newPassword) {
		return userMapper.updataUserPsw(userid,newPassword);
	}
	@Override
	public Boolean queryemail(String email) {
		return userMapper.queryemail(email);
	}
	@Override
	public Boolean insertUser(String username, String password, String email) {
		return userMapper.insertUser(username,password,email);
	}
	@Override
	public User queryEmail(String email) {
		return userMapper.queryEmail(email);
	}
	

}
