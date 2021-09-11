package com.cdac.dao;

import java.sql.SQLException;
import java.util.List;

import com.cdac.dto.Loan;

public interface LoanDao {
	void insert(Loan loan);
	List<Loan> selectList(int userId);
	Loan checkLoan(int loanId);
	Loan depositeOneLoan(Loan loan);
	List<Loan> showAllLoanList();
	void updateRequestFromAmin(int loanId);
	void rejectRequestFromAdmin(int loanId);

	}
