package com.cdac.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.cdac.dao.UserDao;
import com.cdac.dto.User;

@Service
public class UserServiceImple implements UserService {
	@Autowired
	private UserDao userDao;

	@Override
	public void addUser(User user) {
		userDao.insert(user);
	}

	@Override
	public boolean show(User user) {
		return userDao.select(user);
	}

	@Override
	public List<User> showAllUserToAdmin() {
		return userDao.showAlluserToAdmin();
	}

	@Override
	public boolean delete(int userId) {
		return userDao.deleteUser(userId);
	}

	@Override
	public String forgotPasswords(String email) {
		
		return userDao.forgotPassword(email);
	}

	@Override
	public boolean checkUser(String userName) {
		
		return userDao.checkUserByName(userName);
	}

	@Override
	public boolean checkUserByEmail(String userEmail) {
		// TODO Auto-generated method stub
		return  userDao.checkUserByEmail(userEmail);
	}

	@Override
	public void uploadImage(String profilePic, int userId) {
		userDao.uploadImage(profilePic, userId);
		
	}



}
