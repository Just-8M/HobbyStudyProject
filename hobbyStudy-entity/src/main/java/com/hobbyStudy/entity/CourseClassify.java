package com.hobbyStudy.entity;

import java.util.Date;

/**  
* @Description: 课程分类
* @author shenjin 
* @date 2018年11月20日  
* @version V1.0  
*/
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
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getParentCode() {
		return parentCode;
	}
	public void setParentCode(String parentCode) {
		this.parentCode = parentCode;
	}
	public Long getSort() {
		return sort;
	}
	public void setSort(Long sort) {
		this.sort = sort;
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
