package com.cdac.service;


import java.util.List;

import com.cdac.dto.Loan;
import com.cdac.dto.User;

public interface LoanService {
	void add(Loan loan);
	List<Loan> showList(int userId);
	Loan getOne(int loanId);
	Loan depositeLoan(Loan loan);
	List<Loan> showAllLoanToAdmin();
	void updateRequest(int loanID);
	void rejectRequest(int loanID);
	
	
	}
