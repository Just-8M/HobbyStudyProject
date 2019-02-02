package com.hobbyStudy.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * 证明材料类 
 * @author shenjin
 */
@Getter @Setter @ToString

public class ProveMaterials {

	private Integer id;       
	private String pic_name;		// 图片名称
	private String pic_url;	    	// 图片地址
	private String updataPeople;	//更新人
	private String checkPeople;		//审核人
	private String type;		    //类型(实名认证和学历认证)
	private String status;          //状态(0:待审核、1：审核通过、2：已审核未通过)
	private String createTime;      //创建时间
	private String checkTime;       //审核时间
	private Integer del = 0;        //  逻辑删除
	
}
