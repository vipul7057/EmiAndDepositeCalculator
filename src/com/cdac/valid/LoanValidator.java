package com.cdac.valid;
import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.cdac.dto.Loan;
@Service
public class LoanValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		return clazz.equals(Loan.class);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "amount","amtKey", "Cannot be 0.0");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "tenor", "tenorKey","Cannot be 0.0");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "interestRate","rateKey", "Cannot be 0");
	}

}
