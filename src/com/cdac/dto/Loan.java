package com.cdac.dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "userLoan")
public class Loan {
	@Id
	@GeneratedValue
	@Column(name = "loan_id")
	private int loanId;
	@Column(name = "amount")
	private double amount;
	@Column(name = "tenor")
	private double tenor;
	@Column(name = "InRate")
	private double interestRate = 7;
	@Column(name = "user_id")
	private int userId;
	@Column(name = "emi_amount")
	private int emi;
	@Column(name = "status")
	private String status = "Waiting";

	public Loan() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Loan(int loanId, double amount, double tenor, double interestRate, int userId, int emi, String status) {
		super();
		this.loanId = loanId;
		this.amount = amount;
		this.tenor = tenor;
		this.interestRate = interestRate;
		this.userId = userId;
		this.emi = emi;
		this.status = status;
	}

	public int getLoanId() {
		return loanId;
	}

	public void setLoanId(int loanId) {
		this.loanId = loanId;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public double getTenor() {
		return tenor;
	}

	public void setTenor(double tenor) {
		this.tenor = tenor;
	}

	public double getInterestRate() {
		return interestRate;
	}

	public void setInterestRate(double interestRate) {
		this.interestRate = interestRate;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getEmi() {
		return emi;
	}

	public void setEmi(int emi) {
		this.emi = emi;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return loanId + " " + amount + " " + tenor + " " + interestRate + " " + userId + " " + emi + ", status="
				+ status;
	}

}
