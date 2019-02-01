package com.hobbyStudy.entity;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
/**  
* @Description: User 
* @author shenjin 
* @date 2018年11月10日  
* @version V1.0  
*/
@Getter
@Setter
public class User {
	
	private Integer id;    	      //  id
	private String realname;      //  用户真实姓名（领学者必填）
	private String userid;   	  //  用户id（注册时必填项，唯一性）
	private String nickname;   	  //  昵称（可改选项可重复）
	private String userCategory;  //  用户类别
	private String password;   	  //  密码
	private Integer gender;    	  //  性别
	private String Identity;      //  身份信息
	private String header;        //  头像
	private String mobile;        //  手机号码
	private String email;         //  邮箱
	private Integer status;       //  状态：待审核（0），审核通过（1），默认（2），审核未通过（3），禁用（5）
	private Date birthday;        //  出生日期
	private String education;     //  学历：大专、本科、硕士、博士、博士后
	private String collegeCode;   // 大学编号
	private String collegeName;    // 大学名称
	private String certNo;         // 资格证书编号
	private String title;          // 头衔
	private String sign;           //  签名
	private String money;          //  零钱
	private String openId;         //  微信公众号
	private String wechatId;       // 微信号
	private String qq;             //  qq号
	private Date loginTime;        //  最后一次登录时间
	private String ip;             // 最后一次登录IP
	private String province;       //  所在省份
	private String city;           //  所在城市
	private String district;       //  所在地区
	private Integer fans;          //  粉丝数
	private String likeCount;      //  点赞数
	private Integer weight;        //  平均分(权重)
	private Date createTime;       //  最后登录时间
	private Integer del = 0;        //  逻辑删除
	@Override
	public String toString() {
		return "User [id=" + id + ", realname=" + realname + ", userid=" + userid + ", nickname=" + nickname
				+ ", userCategory=" + userCategory + ", password=" + password + ", gender=" + gender + ", Identity="
				+ Identity + ", header=" + header + ", mobile=" + mobile + ", email=" + email + ", status=" + status
				+ ", birthday=" + birthday + ", education=" + education + ", collegeCode=" + collegeCode
				+ ", collegeName=" + collegeName + ", certNo=" + certNo + ", title=" + title + ", sign=" + sign
				+ ", money=" + money + ", openId=" + openId + ", wechatId=" + wechatId + ", qq=" + qq + ", loginTime="
				+ loginTime + ", ip=" + ip + ", province=" + province + ", city=" + city + ", district=" + district
				+ ", fans=" + fans + ", likeCount=" + likeCount + ", weight=" + weight + ", createTime=" + createTime
				+ ", del=" + del + "]";
	}
} 
