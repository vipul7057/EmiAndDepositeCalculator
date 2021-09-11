package com.cdac.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cdac.dao.LoanDao;
import com.cdac.dto.Loan;

@Service
public class LoanServiceImple implements LoanService {
	@Autowired

	private LoanDao loanDao;

	@Override
	public void add(Loan loan) {
		loanDao.insert(loan);
	}

	@Override
	public List<Loan> showList(int userId) {
		return loanDao.selectList(userId);
	}

	@Override
	public Loan getOne(int loanId) {
		// TODO Auto-generated method stub
		return loanDao.checkLoan(loanId);
	}

	@Override
	public Loan depositeLoan(Loan loan) {
		// TODO Auto-generated method stub
		return loanDao.depositeOneLoan(loan);
	}

	@Override
	public List<Loan> showAllLoanToAdmin() {

		return loanDao.showAllLoanList();
	}

	@Override
	public void updateRequest(int loanId) {
		loanDao.updateRequestFromAmin(loanId);
	}

	@Override
	public void rejectRequest(int loanId) {
		loanDao.rejectRequestFromAdmin(loanId);
	}

}
