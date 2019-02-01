package com.hobbyStudy.entity;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

/**  
* @Description: 课程分类
* @author shenjin 
* @date 2018年11月20日  
* @version V1.0  
*/
@Getter
@Setter
public class CourseClassify {

	private Integer id;    	      //  id
	private String name;           // 名称
	private String code;           //  编码
	private String parentCode; 	   // 父级别id
	private  String title;         //  二级分类小标题
	private Long sort;    		   //  排序
	private Date createTime;       //  创建时间
	private String createUser;     //  创建人(username)
	private Date updateTime;       //  更新时间
	private String updateUser;     //  最后一位更新人(username)
	private Integer del = 0;       //  逻辑删除 
} 
