package com.hobbyStudy.entity;


import java.util.Date;


import lombok.Getter;
import lombok.Setter;
/**
 * 
* @Description:课程评论&QA
* @author shenjin 
* @date 2018年12月5日  
* @version V1.0
 */
@Getter
@Setter
public class CourseComment{
	private Integer id;
	private String userid;     // 用户userid
	private Integer courseId;       // 评论课程id
	private String content;      // 评论内容
	private Integer type;        // 类型：0：评论、1：问答
	private Date createTime;     //  创建时间
	private String createUser;   //  创建人(username)
	private Date updateTime;     //  更新时间（删除时间）
	private String updateUser;    // 更新时间（删除者）
	private Integer del = 0;      // 逻辑删除
}

