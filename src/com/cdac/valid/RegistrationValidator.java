package com.cdac.valid;

import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.cdac.dto.User;
@Service
public class RegistrationValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return clazz.equals(User.class);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userName", "unKey", "Username is required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userPass", "upKey", "Password is required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userEmail", "emailKey", "Email is required");

		User user = (User) target;
		if (user.getUserPass() != null) {
			if (user.getUserPass().length() < 7 ) {
				errors.rejectValue("userPass", "passKey", "password should contain more 6 chars");
			}
		}
		
	}

}
