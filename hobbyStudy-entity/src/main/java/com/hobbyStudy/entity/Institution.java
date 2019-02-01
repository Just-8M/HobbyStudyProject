package com.hobbyStudy.entity;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

/**  
* @Description: 机构
* @author shenjin 
* @date 2018年12月22日  
* @version V1.0  
*/
@Getter
@Setter
public class Institution {
	
	private Integer id; 
	private String courseName;          // 课程名
	private String picture;				// 图片url
	private String courseIntro;			// 课程简介
	private String courseDetail;		// 课程详情
	private String institutionName;		// 机构名称
	private String type;				// 类型（编程）
	private String level;				// 课程等级（初、中、高、就业）
	private Date timespanStart;			// 开课开始时间
	private Date timespanEnd;			// 开课结束时间
	private String periods;				// 上课期数（第一期）
	private String peopleNum;			// 人数
	private String teachVideo;			// 教学视频展示
	private String teacherIntro;		// 老师介绍
	private String courseOutline;		// 课程大纲
	private String telePhone;			// 电话
	private String province;			// XX省
	private String city;			    // 市
	private String district;			// 区
	private String institutionaddress;	// 机构地址
	private Date createTime;             // 创建时间
	private String createUser;  		 //创建人(username)
	private Date updateTime;    		 // 更新时间
	private String updateUser;  		 //  最后一位更新人(username)
	private Integer del = 0;  			 //  逻辑删除
}
