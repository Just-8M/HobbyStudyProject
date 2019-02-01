package com.hobbyStudy.entity;

import java.math.BigDecimal;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Course {

	private static final long serialVersionUID = -935786327879089574L;
	
	private Integer id;
	private String name;         	 // 课程名称
	private String type;         	 //  课程类型
	private String classify;         //  课程分类
	private String classifyName;     //  课程分类名称
	private String subClassify;      //  课程二级分类
	private String subClassifyName;  // 课程二级分类名称
	private String direction;        //  课程方向
	private String userid;           // 归属人
	private Integer level;            //  课程级别：1-初级，2-中级，3-高级
	private Integer free;            //  是否免费：0-否，1-是
	private BigDecimal price;         //  课程价格
	private String time;              // 时长
	private Integer onsale;          // 未上架（0）、上架（1）
	private String brief;      //  课程描述
	private String picture;      // 课程封面图片
	private Integer recommend;   // 未推荐（0）、推荐（1）
	private Integer weight;    //权重
	private Integer studyCount;    // 学习人数
	private String courseSchedule;      // 课程时间安排
	private String timespanStart;			// 开课开始时间
	private String timespanEnd;			// 开课结束时间
	private Date createTime;     // 创建时间
	private String createUser;   //创建人(username)
	private Date updateTime;    // 更新时间
	private String updateUser;   //  最后一位更新人(username)
	private Integer del = 0;  //  逻辑删除
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
