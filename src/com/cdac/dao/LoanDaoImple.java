package com.cdac.dao;

import java.sql.*;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.cdac.dto.Loan;
import com.cdac.dto.User;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

@Repository
public class LoanDaoImple implements LoanDao {
	@Autowired
	private HibernateTemplate hibernateTemplate;
	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public void insert(Loan loan) {
		hibernateTemplate.execute(new HibernateCallback<Void>() {
			
			@Override
			public Void doInHibernate(Session session) throws HibernateException {
				org.hibernate.Transaction tr = session.beginTransaction();
				session.save(loan);
				tr.commit();
				session.flush();
				session.close();
				return null;
			}

		});
	}

	@Override
	public List<Loan> selectList(int userId) {
		System.out.println("demo");
		List<Loan> list = hibernateTemplate.execute(new HibernateCallback<List<Loan>>() {

			@Override
			public List<Loan> doInHibernate(Session session) throws HibernateException {
				org.hibernate.Transaction tr = session.beginTransaction();
				Query q = session.createQuery("from Loan where userId = ?");
				q.setInteger(0, userId);
				List<Loan> li = q.list();
				return li;
			}
		});
		return list;
	}

	@Override
	public Loan checkLoan(int loanId) {
		Loan loan = hibernateTemplate.execute(new HibernateCallback<Loan>() {

			@Override
			public Loan doInHibernate(Session session) throws HibernateException {
				org.hibernate.Transaction tr = session.beginTransaction();
				Loan loan = (Loan) session.get(Loan.class, loanId);
				tr.commit();
				session.flush();
				session.close();
				return loan;
			}
		});
		return loan;
	}

	// Update query
	@Override
	public Loan depositeOneLoan(Loan loan) {
		hibernateTemplate.execute(new HibernateCallback<Void>() {

			@Override
			public Void doInHibernate(Session session) throws HibernateException {
				Transaction tr = session.beginTransaction();
				Loan lo = (Loan) session.get(Loan.class, loan.getLoanId());
				double loanAmount = lo.getAmount();
				double depositeAmount = loan.getAmount();
				double finalAmount = loanAmount - depositeAmount;
				if (finalAmount <= 0) {
					session.delete(lo);
					tr.commit();
					session.flush();
					session.close();
					return null;
				} else {
					lo.setAmount(finalAmount);
					double r = lo.getInterestRate() / (12 * 100);
					double t = lo.getTenor();
					double p = lo.getAmount();
					int finalemi = (int) ((p * r * (float) Math.pow(1 + r, t)) / (float) (Math.pow(1 + r, t) - 1));
					lo.setEmi(finalemi);

					tr.commit();
					session.flush();
					session.close();
					return null;
				}
			}

		});
		return null;
	}

	@Override
	public List<Loan> showAllLoanList() {
		List<Loan> list = hibernateTemplate.execute(new HibernateCallback<List<Loan>>() {

			@Override
			public List<Loan> doInHibernate(Session session) throws HibernateException {
				org.hibernate.Transaction tr = session.beginTransaction();
				Query q = session.createQuery("from Loan");
				List<Loan> li = q.list();
				return li;
			}
		});
		return list;
	}

	@Override
	public void updateRequestFromAmin(int loanId) {
		hibernateTemplate.execute(new HibernateCallback<Void>() {

			@Override
			public Void doInHibernate(Session session) throws HibernateException {
				Transaction tr = session.beginTransaction();
				Loan loan = (Loan)session.get(Loan.class, loanId);
				loan.setStatus("Accpted");
				tr.commit();
				session.flush();
				session.close();
				return null;
			}
		});
	}

	@Override
	public void rejectRequestFromAdmin(int loanId) {
		hibernateTemplate.execute(new HibernateCallback<Void>() {

			@Override
			public Void doInHibernate(Session session) throws HibernateException {
				Transaction tr = session.beginTransaction();
				Loan loan = (Loan)session.get(Loan.class, loanId);
				session.delete(loan);
				tr.commit();
				session.flush();
				session.close();
				return null;
			}
		});
		
	}

}
