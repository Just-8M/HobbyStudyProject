package com.hobbyStudy.entity;

import lombok.Getter;
import lombok.Setter;

/**
 * @Description：趣学后台管理员
 * @author shenjin
 */
@Getter
@Setter
public class Admin {

	private Integer id;
	private String  adminName;  // 登录名
	private String  password;   // 密码
}
