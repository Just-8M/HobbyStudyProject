package com.hobbyStudy.entity;

import java.util.Date;

/**
 * 课程章节
 */
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

	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getCourseId(){
		return courseId;
	}
	public void setCourseId(Long courseId){
		this.courseId = courseId;
	}

	public Long getParentId(){
		return parentId;
	}
	public void setParentId(Long parentId){
		this.parentId = parentId;
	}

	public String getName(){
		return name;
	}
	public void setName(String name){
		this.name = name;
	}

	public Integer getSort(){
		return sort;
	}
	public void setSort(Integer sort){
		this.sort = sort;
	}

	public String getTime(){
		return time;
	}
	public void setTime(String time){
		this.time = time;
	}

	public Integer getOnsale(){
		return onsale;
	}
	public void setOnsale(Integer onsale){
		this.onsale = onsale;
	}
	public String getVideoUrl() {
		return videoUrl;
	}
	public void setVideoUrl(String videoUrl) {
		this.videoUrl = videoUrl;
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
	public Integer getDel() {
		return del;
	}
	public void setDel(Integer del) {
		this.del = del;
	}
}

