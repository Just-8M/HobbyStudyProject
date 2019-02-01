package com.hobbyStudy.entity;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

/**  
* @Description: PhotoSlide--轮番图效
* @author shenjin 
* @date 2018年11月19日  
* @version V1.0  
*/
@Getter
@Setter
public class CoursePhotoSlide {
	
	private String id;            //  id
	private String name;          //  名称
	private String picture;       //   图片
	private String url;           //  链接
	private Integer weight;       //  权重
	private Integer enable;       //   是否可用
	private Date createTime;      //  创建时间
	private String createUser;    //  创建人(username)
	private Date updateTime;      //  更新时间
	private String updateUser;    //  最后一位更新人(username)
	private Integer del = 0;      //  逻辑删除
}
