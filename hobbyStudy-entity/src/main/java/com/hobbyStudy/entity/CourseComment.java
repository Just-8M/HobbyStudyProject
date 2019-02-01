package com.hobbyStudy.entity;


import com.hobbyStudy.common.utils.BaseEntity;

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
public class CourseComment extends BaseEntity{
	
	private static final long serialVersionUID = 1L;
	private String username;     //  用户username
	private String toUsername;   // 评论对象username
	private Long courseId;       // 课程id
	private Long sectionId;      // 章节id
	private String sectionTitle; // 章节标题
	private String content;      // 评论内容
	private Long refId;          // 引用id
	private String refContent;   // 引用内容
	private Integer type;        // 类型：0-评论；1-答疑QA
}

