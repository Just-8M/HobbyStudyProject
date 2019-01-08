package com.hobbyStudy.entity;

import java.util.Date;

/**
 * 点赞、关注表
 * @author shenjin
 *
 */
public class UserLike {
	private Integer id;    	        //  id
	private String u_userid;    	//  用户userid（唯一）
	private String type;            //  类型<0：点赞；1：关注>
	private String createTime;        //  点赞时间
	private String creatUser;       //  创建人
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getU_userid() {
		return u_userid;
	}
	public void setU_userid(String u_userid) {
		this.u_userid = u_userid;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getCreatUser() {
		return creatUser;
	}
	public void setCreatUser(String creatUser) {
		this.creatUser = creatUser;
	}
	@Override
	public String toString() {
		return "UserLike [id=" + id + ", u_userid=" + u_userid + ", type=" + type + ", createTime=" + createTime
				+ ", creatUser=" + creatUser + "]";
	}
	
}
