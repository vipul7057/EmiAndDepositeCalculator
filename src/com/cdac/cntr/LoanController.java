package com.cdac.cntr;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.cdac.dto.Loan;
import com.cdac.dto.User;
import com.cdac.service.LoanService;
import com.cdac.service.UserService;
import com.cdac.valid.LoanValidator;

@Controller
public class LoanController {
	@Autowired
	private LoanService loanService;
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private UserService userService;
	@Autowired
	private LoanValidator loanValidator;

	@RequestMapping(value = "prepareLoanPage.htm", method = RequestMethod.GET)
	public String prepareLoanPage(Loan loan, ModelMap map, HttpSession session) {
		if (session.getAttribute("user") == null || session.getAttribute("user").equals("")) {
			return "index";
		} else {
			map.put("loan", new Loan());
			return "loanPage";

		}
	}

	@RequestMapping(value = "loanPageFinal.htm", method = RequestMethod.POST)
	public String addLoanFinal(ModelMap map, Loan loan, HttpSession session) {
		int count = countUserLoan(session);
		String msg = "Amount Should Be Positive";
		double am = loan.getAmount();
		
		if(loan.getAmount() <= 0.0 || loan.getTenor() <=0.0)
		{
			map.addAttribute("msg", msg);
			map.put("loan", new Loan());
			return "loanPage";
		}
		if (count < 2) {
			int userId = ((User) session.getAttribute("user")).getUserId();
			loan.setUserId(userId);
			double r = loan.getInterestRate() / (12 * 100);
			double t = loan.getTenor();
			double p = loan.getAmount();
			int finalemi = (int) ((p * r * (float) Math.pow(1 + r, t)) / (float) (Math.pow(1 + r, t) - 1));
			loan.setEmi(finalemi);
			session.setAttribute("loan", loan);
			loanService.add(loan);
			return "SuccessPage";
		} else {
			return "loanCount";
		}
	}

	@RequestMapping(value = "seeLoanList.htm", method = RequestMethod.GET)
	public String userLoanList(ModelMap map, HttpSession session) {
		if (session.getAttribute("user") == null || session.getAttribute("user").equals("")) {
			return "index";
		} else {
			int userId = ((User) session.getAttribute("user")).getUserId();
			List<Loan> list = loanService.showList(userId);
			int count = list.size();
			double amount = 0;
			
			for (Loan l : list) {
				amount = amount + l.getAmount();
			}
			map.put("amount", amount);
			map.put("count", count);
			map.put("userLoanList", list);
			return "userLoanList2";
		}

	}

	public int countUserLoan(HttpSession session) {
		int userId = ((User) session.getAttribute("user")).getUserId();
		List<Loan> list = loanService.showList(userId);
		int count = list.size();
		return count;
	}

	public double totalLoanAmount(HttpSession session) {
		int userId = ((User) session.getAttribute("user")).getUserId();
		List<Loan> list = loanService.showList(userId);
		double amount = 0;
		for (Loan l : list) {
			amount = amount + l.getAmount();
		}
		return amount;
	}

	@RequestMapping(value = "prepareDeposite.htm", method = RequestMethod.GET)
	public String prepareDeposite(@RequestParam int loanId, ModelMap map, HttpSession session) {
		if (session.getAttribute("user") == null || session.getAttribute("user").equals("")) {
			return "index";
		} else {
			Loan loan = loanService.getOne(loanId);
			map.put("oneObject", loan);
			return "deposite";

		}

	}

	@RequestMapping(value = "depositeFinal.htm", method = RequestMethod.POST)
	public String depositeFinal(Loan loan, HttpSession session, ModelMap map) {
			if(loan.getAmount()>=0)
			{

				int userId = ((User) session.getAttribute("user")).getUserId();
				loan.setUserId(userId);
				loanService.depositeLoan(loan);

				List<Loan> list = loanService.showList(userId);
				int count = list.size();
				double amount = 0;
				for (Loan l : list) {
					amount = amount + l.getAmount();
				}
				map.put("amount", amount);
				map.put("count", count);
				map.put("userLoanList", list);
				return "userLoanList2";
			}
			else
			{
				String msg = "Amount should be greater than 0";
				Loan l = loanService.getOne(loan.getLoanId());
				map.put("oneObject", l);
				map.addAttribute("msg",msg);
				return "deposite";

			}
	}

	@RequestMapping(value = "showAllUser.htm", method = RequestMethod.GET)
	public String showAllLoanToAdmin(ModelMap map, HttpSession session) {
		if (session.getAttribute("user") == null || session.getAttribute("user").equals("")) {
			return "index";
		} else {
			List<Loan> list = loanService.showAllLoanToAdmin();
			List<User> ulist = userService.showAllUserToAdmin();
			map.put("allLoanList", list);
			map.put("allUserList", ulist);
			return "AllUserList";

		}
	}

	@RequestMapping(value = "approveRequest.htm", method = RequestMethod.GET)
	public String approveRequest(ModelMap map, @RequestParam int loanId) {
		loanService.updateRequest(loanId);

		List<Loan> list = loanService.showAllLoanToAdmin();
		List<User> ulist = userService.showAllUserToAdmin();
		map.put("allLoanList", list);
		map.put("allUserList", ulist);
		return "AllUserList";
	}

	@RequestMapping(value = "rejectRequest.htm", method = RequestMethod.GET)
	public String rejectRequest(ModelMap map, @RequestParam int loanId) {
		loanService.rejectRequest(loanId);
		
		List<Loan> list = loanService.showAllLoanToAdmin();
		List<User> ulist = userService.showAllUserToAdmin();
		map.put("allLoanList", list);
		map.put("allUserList", ulist);
		return "AllUserList";
	}

	@RequestMapping(value = "emiCalculatorFromUser.htm", method = RequestMethod.GET)
	public String emiCal(ModelMap map, HttpSession session) {
		if (session.getAttribute("user") == null || session.getAttribute("user").equals("")) {
			return "index";
		} else {
			map.put("loanObjForEmiCalc", new Loan());
			return "emiCalculator";
		}

	}

	@RequestMapping(value = "finalEmiCalculate.htm", method = RequestMethod.POST)
	public String finalEmiCalc(Loan loan, ModelMap map) {
		double rate = loan.getInterestRate();
		double r = loan.getInterestRate() / (12 * 100);
		double t = loan.getTenor();
		double p = loan.getAmount();
		if (p <= 0.0 || r<=0.0 || t<=0.0) {
			String msg = "Input Should be Positive Number";
			map.addAttribute("msg",msg);
			map.put("loanObjForEmiCalc", new Loan());
			return "emiCalculator";
		} else {
			int finalemi = (int) ((p * r * (float) Math.pow(1 + r, t)) / (float) (Math.pow(1 + r, t) - 1));
			map.put("finalemi", finalemi);
			map.put("amount", p);
			map.put("tenor", t);
			map.put("rate", rate);
			return "finalEmiCalcVal";
		}
	}
	
	@RequestMapping(value = "deleteUser.htm",method = RequestMethod.GET)
	public String deleteUser(@RequestParam int userId,ModelMap map)
	{
		userService.delete(userId);
		List<Loan> list = loanService.showAllLoanToAdmin();
		List<User> ulist = userService.showAllUserToAdmin();
		map.put("allLoanList", list);
		map.put("allUserList", ulist);
		return "AllUserList";
	}
	
}
