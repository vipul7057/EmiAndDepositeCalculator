package com.cdac.service;

import java.util.List;

import com.cdac.dto.Loan;
import com.cdac.dto.User;

public interface UserService {
	void addUser(User user);
	boolean	 show(User user);
	List<User> showAllUserToAdmin();
	boolean delete(int userId);
	String forgotPasswords(String email);
	boolean checkUser(String userName);
	void uploadImage(String profilePic,int userId);
	boolean checkUserByEmail(String userEmail);
}
