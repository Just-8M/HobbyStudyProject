package com.hobbyStudy.entity;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

/**
 * @Description
 * @author shenjin
 * 
 */
@Getter
@Setter
public class AdminOperateLog {
	private Integer id;
	private String adminName;
	private Date createtTme;
	private String operateRecord;
	private String loginTime;
}
