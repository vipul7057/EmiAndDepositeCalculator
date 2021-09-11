package com.cdac.dao;

import java.util.List;

import com.cdac.dto.User;

public interface UserDao {
	void insert(User user);
	boolean select(User user);
	List<User> showAlluserToAdmin();
	boolean deleteUser(int userId);
	String forgotPassword(String email);
	boolean checkUserByName(String userName);
	boolean checkUserByEmail(String userEmail);
	void uploadImage(String profilePic,int userId);
}
