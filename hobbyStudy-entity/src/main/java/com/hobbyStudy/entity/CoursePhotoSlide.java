package com.hobbyStudy.entity;

import java.util.Date;

/**  
* @Description: PhotoSlide--轮番图效
* @author shenjin 
* @date 2018年11月19日  
* @version V1.0  
*/
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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Integer getWeight() {
		return weight;
	}

	public void setWeight(Integer weight) {
		this.weight = weight;
	}

	public Integer getEnable() {
		return enable;
	}

	public void setEnable(Integer enable) {
		this.enable = enable;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getCreateUser() {
		return createUser;
	}

	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public String getUpdateUser() {
		return updateUser;
	}

	public void setUpdateUser(String updateUser) {
		this.updateUser = updateUser;
	}
}
