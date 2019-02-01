package com.hobbyStudy.entity;

import lombok.Getter;
import lombok.Setter;

/**
 * 证明材料类 
 * @author shenjin
 */
@Getter
@Setter
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
	
	@Override
	public String toString() {
		return "ProveMaterials [id=" + id + ", pic_name=" + pic_name + ", pic_url=" + pic_url + ", updataPeople="
				+ updataPeople + ", checkPeople=" + checkPeople + ", type=" + type + ", createTime=" + createTime
				+ ", checkTime=" + checkTime + ", del=" + del + "]";
	}
	
}
