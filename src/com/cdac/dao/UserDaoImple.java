package com.cdac.dao;

import com.cdac.dto.Loan;
import com.cdac.dto.User;

import java.util.List;

import javax.transaction.Transaction;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class UserDaoImple implements UserDao {
	@Autowired
	private HibernateTemplate hibernateTemplate;

	@Override
	public void insert(User user) {
		hibernateTemplate.execute(new HibernateCallback<Void>() {

			@Override
			public Void doInHibernate(Session session) throws HibernateException {
				org.hibernate.Transaction tr = session.beginTransaction();
				user.setType("User");
				session.save(user);
				tr.commit();
				session.flush();
				session.close();
				return null;
			}
		});
	}

	@Override
	public boolean select(User user) {
		boolean flag = hibernateTemplate.execute(new HibernateCallback<Boolean>() {

			@Override
			public Boolean doInHibernate(Session session) throws HibernateException {
				org.hibernate.Transaction tr = session.beginTransaction();
				Query q = session.createQuery("from User where user_name = ? and user_pass = ? ");
				q.setString(0, user.getUserName());
				q.setString(1, user.getUserPass());
				List<User> li = q.list();
				boolean f = !li.isEmpty();
				boolean flag = !li.isEmpty();
				if(!li.isEmpty()) {
					flag = true;
					user.setUserId(li.get(0).getUserId()); 
					tr.commit();
					session.flush();
					session.close();
				}
				else {
					flag = false;
				}
				
				return flag;
			}
				
		});
		return flag;
	}

	@Override
	public List<User> showAlluserToAdmin() {
		List<User> list = hibernateTemplate.execute(new HibernateCallback<List<User>>() {

			@Override
			public List<User> doInHibernate(Session session) throws HibernateException {
				org.hibernate.Transaction tr = session.beginTransaction();
				Query q = session.createQuery("from User");
				List<User> li = q.list();
				return li;
			}
		});
		return list;
	}

	@Override
	public boolean deleteUser(int userId) {
		hibernateTemplate.execute(new HibernateCallback<Boolean>() {

			@Override
			public Boolean doInHibernate(Session session) throws HibernateException {
				org.hibernate.Transaction tr = session.beginTransaction();
				User user = (User)session.get(User.class, userId);
				session.delete(user);
				tr.commit();
				session.flush();
				session.close();
				return null;
			}
		});
		return false;
	}

	@Override
	public String forgotPassword(String email) {
		String password = hibernateTemplate.execute(new HibernateCallback<String>() {

			@Override
			public String doInHibernate(Session session) throws HibernateException {
				org.hibernate.Transaction tr = session.beginTransaction();
				Query q = session.createQuery("from User where userEmail = ?");
				q.setString(0, email);
				List<User> li = q.list();
				String pass = null;
				if(!li.isEmpty())
					pass = li.get(0).getUserPass();
				tr.commit();
				session.flush();
				session.close();
				return pass;
			}
			
		});
		return password;
	}

	@Override
	public boolean checkUserByName(String userName) {
		return hibernateTemplate.execute(new HibernateCallback<Boolean>() {

			@Override
			public Boolean doInHibernate(Session session) throws HibernateException {
				org.hibernate.Transaction tr = session.beginTransaction();
				Query q = session.createQuery("from User where userName = ?");
				q.setString(0, userName);
				List<User> li = q.list();
				tr.commit();
				session.flush();
				session.close();
				if(li.size()==0)
				{
					return true;
				}
				else
				{
					return false;
				}
			}
		});
		
	
	}

	@Override
	public boolean checkUserByEmail(String userEmail) {
		return hibernateTemplate.execute(new HibernateCallback<Boolean>() {

			@Override
			public Boolean doInHibernate(Session session) throws HibernateException {
				org.hibernate.Transaction tr = session.beginTransaction();
				Query q = session.createQuery("from User where userEmail = ?");
				q.setString(0, userEmail);
				List<User> li = q.list();
				tr.commit();
				session.flush();
				session.close();
				if(li.size()==0)
				{
					return true;
				}
				else
				{
					return false;
				}
			}
		});
		
	}

	@Override
	public void uploadImage(String profilePic, int userId) {
		
		hibernateTemplate.execute(new HibernateCallback<Void>() {

			@Override
			public Void doInHibernate(Session session) throws HibernateException {
				org.hibernate.Transaction tr = session.beginTransaction();
				User user = (User)session.get(User.class, userId);
				user.setProfilePic(profilePic); 
				tr.commit();
				session.flush();
				session.close();
				return null;
			}
			
		});
	}

}
