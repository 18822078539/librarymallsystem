package com.library.mall.entity;

import java.io.Serializable;

public class Users  implements Serializable{
	private Integer userId;
	private String userName;
	private String userPass;
	private String userPhone;
	private String userEmail;
	private Integer userState;
	private String userImg;
	private Integer applyNum;
	//会员积分
	private Integer userScore;
	//会员等级
	private String level;

	//会员贡献值
	private Integer userDevote;

	public Integer getUserDevote() {
		return userDevote;
	}

	public void setUserDevote(Integer userDevote) {
		this.userDevote = userDevote;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public Integer getUserScore() {
		return userScore;
	}

	public void setUserScore(Integer userScore) {
		this.userScore = userScore;
	}

	public Integer getApplyNum() {
		return applyNum;
	}

	public void setApplyNum(Integer applyNum) {
		this.applyNum = applyNum;
	}

	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPass() {
		return userPass;
	}
	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public Integer getUserState() {
		return userState;
	}
	public void setUserState(Integer userState) {
		this.userState = userState;
	}
	public String getUserImg() {
		return userImg;
	}
	public void setUserImg(String userImg) {
		this.userImg = userImg;
	}
	public Users(Integer userId, String userName, String userPass, String userPhone, String userEmail,
			Integer userState, String userImg,Integer userScore,Integer userDevote) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userPass = userPass;
		this.userPhone = userPhone;
		this.userEmail = userEmail;
		this.userState = userState;
		this.userImg = userImg;
		this.userScore = userScore;
		this.userDevote = userDevote;
	}
	public Users() {
		super();
	}
}
