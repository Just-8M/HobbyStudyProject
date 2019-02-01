package com.hobbyStudy.entity;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

/**
 * 课程章节
 */
@Getter
@Setter
public class CourseSections {
	private Long id;          // id
	private Long courseId;       //  归属课程id
	private Long parentId;       //  父章节id，（只有2级）
	private String name;         //  章节名称
	private Integer sort;        //  排序
	private String time;         //  时长
	private Integer onsale;      // 未上架（0）、上架（1）
	private String videoUrl;     // 视频url
	private Date createTime;     // 创建时间
	private String createUser;   // 创建人(username)
	private Date updateTime;     // 更新时间
	private String updateUser;   //  最后一位更新人(username)
	private Integer del = 0;     //  逻辑删除
	
}

