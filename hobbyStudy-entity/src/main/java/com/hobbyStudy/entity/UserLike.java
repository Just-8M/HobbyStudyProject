package com.hobbyStudy.entity;

import lombok.Getter;
import lombok.Setter;

/**
 * 点赞、关注表
 * @author shenjin
 *
 */
@Getter
@Setter
public class UserLike {
	private Integer id;    	        //  id
	private String u_userid;    	//  用户userid（唯一）
	private String type;            //  类型<0：点赞；1：关注>
	private String createTime;        //  点赞时间
	private String creatUser;       //  创建人
	
	@Override
	public String toString() {
		return "UserLike [id=" + id + ", u_userid=" + u_userid + ", type=" + type + ", createTime=" + createTime
				+ ", creatUser=" + creatUser + "]";
	}
	
}
