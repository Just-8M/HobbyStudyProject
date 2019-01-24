package com.hobbyStudy.entity;

import java.util.Date;

/**
 * 证明材料类 
 * @author shenjin
 */
public class ProveMaterials {

	private Integer id;       
	private String pic_name;		// 图片名称
	private String pic_url;	    	// 图片地址
	private String updataPeople;	//更新人
	private String checkPeople;		//审核人
	private String type;		    //类型
	private String createTime;      //创建时间
	private String checkTime;       //审核时间
	private Integer del = 0;        //  逻辑删除
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getPic_name() {
		return pic_name;
	}
	public void setPic_name(String pic_name) {
		this.pic_name = pic_name;
	}
	public String getPic_url() {
		return pic_url;
	}
	public void setPic_url(String pic_url) {
		this.pic_url = pic_url;
	}
	public String getUpdataPeople() {
		return updataPeople;
	}
	public void setUpdataPeople(String updataPeople) {
		this.updataPeople = updataPeople;
	}
	public String getCheckPeople() {
		return checkPeople;
	}
	public void setCheckPeople(String checkPeople) {
		this.checkPeople = checkPeople;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getCheckTime() {
		return checkTime;
	}
	public void setCheckTime(String checkTime) {
		this.checkTime = checkTime;
	}
	public Integer getDel() {
		return del;
	}
	public void setDel(Integer del) {
		this.del = del;
	}
	@Override
	public String toString() {
		return "ProveMaterials [id=" + id + ", pic_name=" + pic_name + ", pic_url=" + pic_url + ", updataPeople="
				+ updataPeople + ", checkPeople=" + checkPeople + ", type=" + type + ", createTime=" + createTime
				+ ", checkTime=" + checkTime + ", del=" + del + "]";
	}
	
}
