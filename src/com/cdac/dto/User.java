package com.cdac.dto;

import javax.persistence.Column;
import javax.validation.constraints.Pattern;  
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;	

@Entity
@Table(name = "userForm")
public class User {
	@Id
	@GeneratedValue
	@Column(name = "user_id")
	private int userId;
	@Column(name = "user_name")
	private String userName;
	@Column(name = "user_pass")  
	private String userPass;
	@Column(name = "user_email")
	private String userEmail;
	@Column(name = "Type")
	private String type;
	@Column(name = "profile_pic")
	private String profilePic;
	
	
	
	
	public String getProfilePic() {
		return profilePic;
	}
	public void setProfilePic(String profilePic) {
		this.profilePic = profilePic;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
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
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	@Override
	public String toString() {
		return "User [userId=" + userId + ", userName=" + userName + ", userPass=" + userPass + ", userEmail="
				+ userEmail + ", type=" + type + "]";
	}
	public User(int userId, String userName, String userPass, String userEmail, String type) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userPass = userPass;
		this.userEmail = userEmail;
		this.type = type;
	}
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
