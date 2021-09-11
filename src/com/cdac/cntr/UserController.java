	package com.cdac.cntr;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.cdac.dto.User;
import com.cdac.service.UserService;
import com.cdac.valid.RegistrationValidator;
import com.cdac.valid.UserValidator;

@Controller
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private UserValidator userValidator;
	@Autowired
	private MailSender mailSender;
	@Autowired
	private RegistrationValidator regValid;
	
	@RequestMapping(value = "/prepareRegForm.htm", method = RequestMethod.GET)
	public String addUser(ModelMap map) {
		map.put("user", new User());
		return "reg_form";
	}

	@RequestMapping(value = "/reg.htm", method = RequestMethod.POST)
	public String regFinal(User user,BindingResult result, ModelMap map, HttpSession session) {
		regValid.validate(user, result);
		String msg = "User Name or Email is already registered";
		if(result.hasErrors()) {
			return "reg_form";
		}
		boolean re = false;
		if(userService.checkUser(user.getUserName()) && userService.checkUserByEmail(user.getUserEmail()))
		{
			userService.addUser(user);
			return "index";
		}
		else
		{
			map.addAttribute("msg", msg);
			map.put("user", new User());
			return "reg_form";
		}
	}

	@RequestMapping(value = "/prepareLoginForm.htm", method = RequestMethod.GET)
	public String logUser(ModelMap map) {
		
		map.put("user", new User());
		return "log_form";
	}
	
	@RequestMapping(value = "/logFinal.htm", method = RequestMethod.POST)
	public String logFinal(User user,BindingResult result, ModelMap map, HttpSession session) {
		userValidator.validate(user, result);
		String msg="User Not Registered";
		if(result.hasErrors()) {
			return "log_form";
		}
			session.setAttribute("user", user);
			boolean f = userService.show(user);
			if(user.getUserName().equals("admin") && user.getUserPass().equals("admin"))
			{
				map.put("user", new User());
				return "log_form";
			}
			if (f) {
				session.setAttribute("user", user);
				return "homepage";
			} else {
				map.put("user", new User());
				map.addAttribute("msg", msg);
				return "log_form";
			}
		}
	

	@RequestMapping(value = "logout.htm")
	public String logout(HttpSession session) {
		session.removeAttribute("user");
		session.removeAttribute("loan");
		session.invalidate();
		return "index";
	}

	@RequestMapping(value = "LoginAdmin.htm")
	public String prepareAdminLogin(ModelMap map) {
		map.put("user",new User());
		return "AdminLogin";
	}

	@RequestMapping(value = "/AdminLoginFinal.htm", method = RequestMethod.POST)
	public String AdminLoginFinal(User user,BindingResult result, ModelMap map, HttpSession session) {
		userValidator.validate(user, result);
		if(result.hasErrors()) {
			return "AdminLogin";
		}
		session.setAttribute("user", user);
		if (user.getUserName().equals("admin") && user.getUserPass().equals("admin")) {
			return "adminHomepage";
		} else {
				return "AdminLogin";
		}
	}
	@RequestMapping(value = "/forgot_password.htm", method = RequestMethod.POST)
	public String forgotPassword(@RequestParam String email,ModelMap map) {	
	
		String pass = userService.forgotPasswords(email);
		String msg = "Email is not registered";
		if (pass != null) {
			System.out.println("pass!=null");
			SimpleMailMessage message = new SimpleMailMessage();
			message.setFrom("cdacmumbai3@gmail.com");
			message.setTo(email);
			message.setSubject("Your password");
			message.setText(pass);
			// sending message
			mailSender.send(message);
			msg = "check the mail for password";
			map.put("user", new User());
			map.addAttribute("msg", "Check your mail for Password");

			return "forgot_password";
		} else {
			map.addAttribute("msg", msg);
			return "forgot_password";
		}
	}

	@RequestMapping(value = "/upload_file.htm", method = RequestMethod.POST)
	public String uploadFile(@RequestParam("file") MultipartFile file,HttpSession session,HttpServletRequest request,ModelMap map) {
		String fileName = "0";

		if (!file.isEmpty()) {
			try {
				byte[] bytes = file.getBytes();
				
				fileName = file.getOriginalFilename();
				fileName = fileName.substring(fileName.lastIndexOf("."));
				
				User user = (User)session.getAttribute("user");
				
				fileName = user.getUserId()+fileName;
				
				

				// Creating the directory to store file
				String rootPath = request.getServletContext().getRealPath("/");
				File dir = new File(rootPath + File.separator + "images");
				if (!dir.exists())
					dir.mkdirs();
				String filePath = dir.getAbsolutePath()+ File.separator +fileName;
				
				System.out.println("Server File Location= "+ filePath );
				
				File serverFile = new File(filePath);
				
						
				BufferedOutputStream stream = new BufferedOutputStream(
						new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();
				
				userService.uploadImage(fileName, user.getUserId());
				
				user.setProfilePic(fileName);
				

			} catch (Exception e) {
				e.printStackTrace();
			}
		}	
		
		return "homepage";
	}
}
