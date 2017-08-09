package com.newttl.scnualumni.bean.database;

/**
 * 用户注册的信息
 * @author lgc
 *
 * 2017年8月2日 下午3:07:41
 */
public class SignedUser {

	//openId headImgUrl userName phone QQ eMail city industry hobby profession sex
	
	//用户标识
	private String openId;
	//用户头像url
	private String headImgUrl;
	//用户姓名
	private String userName;
	//所在学院
	private String college;
	//所在班级
	private String userClass;
	//电话号码
	private String phone;
	//QQ
	private String QQ;
	//邮箱地址
	private String eMail;
	//地址
	private String city;
	//从事行业
	private String industry;
	//爱好
	private String hobby;
	//从事职业
	private String profession;
	//性别
	private String sex;
	
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getOpenId() {
		return openId;
	}
	public void setOpenId(String openId) {
		this.openId = openId;
	}
	public String getHeadImgUrl() {
		return headImgUrl;
	}
	public void setHeadImgUrl(String headImgUrl) {
		this.headImgUrl = headImgUrl;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getQQ() {
		return QQ;
	}
	public void setQQ(String qQ) {
		QQ = qQ;
	}
	public String geteMail() {
		return eMail;
	}
	public void seteMail(String eMail) {
		this.eMail = eMail;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getIndustry() {
		return industry;
	}
	public void setIndustry(String industry) {
		this.industry = industry;
	}
	public String getHobby() {
		return hobby;
	}
	public void setHobby(String hobby) {
		this.hobby = hobby;
	}
	public String getProfession() {
		return profession;
	}
	public void setProfession(String profession) {
		this.profession = profession;
	}
	public String getCollege() {
		return college;
	}
	public void setCollege(String college) {
		this.college = college;
	}
	public String getUserClass() {
		return userClass;
	}
	public void setUserClass(String userClass) {
		this.userClass = userClass;
	}
	
	
}
