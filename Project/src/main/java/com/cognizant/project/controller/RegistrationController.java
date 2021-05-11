package com.cognizant.project.controller;

import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.cognizant.project.model.Help;
import com.cognizant.project.model.User;
import com.cognizant.project.service.HelpService;
import com.cognizant.project.service.UserService;

@Controller
public class RegistrationController {

	@Autowired
	private UserService service;
	@Autowired
	private HelpService helpService;
	private static int temp = 1;

	@GetMapping("/")
	public String homepage(Model model, HttpSession session) {
		if (temp == 1)
			session.setAttribute("login", false);
		temp++;
		model.addAttribute("sett", "login");
		return "homepage";
	}

	@GetMapping("/customer")
	public String customer(Model model, HttpSession session) {
		session.setAttribute("category", "Customer");
		return "regnlog";
	}

	@GetMapping("/employee")
	public String employee(Model model, HttpSession session) {
		session.setAttribute("category", "Employee");
		return "regnlog";
	}

	@GetMapping("/admin")
	public String admin(Model model, HttpSession session) {
		session.setAttribute("category", "Admin");
		return "regnlog";
	}

	@GetMapping("/registration")
	public String registrationpage(@ModelAttribute("user") User user, Model model, HttpSession session) {
		model.addAttribute("category", (String) session.getAttribute("category"));
		System.out.println((String) session.getAttribute("category"));
		return "registration";
	}

	@GetMapping("/Login")
	public String loginpage(@ModelAttribute("user") User user, Model model, HttpSession session) {
		if (session == null) {
			return "Login";
		}
		if ((boolean) session.getAttribute("login")) {
			session.setAttribute("login", false);
			session.invalidate();
			return "Login";
		}
		return "Login";
	}

	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("user") User user, BindingResult result, Model model,
			HttpSession session) {

		if (result.hasErrors()) {
			model.addAttribute("msg", "Please update all the highlighted mandatory field(s).");
			return "registration";
		}
		// check if the user id is already available
		// if so "Sorry UserID already taken"
		if (service.getUserByUserId(user.getUserId()) != null) {
			model.addAttribute("available", "no");
			return "registration";
		}
		/*
		 * check if the Contact number or EmailId is already registered if so
		 * "this number is already registered"
		 */
		if (service.getUserByContact(user.getContact()) != null) {
			model.addAttribute("phone", "no");
			return "registration";
		}
		if ((service.getUserByEmail(user.getEmail()) != null)) {
			model.addAttribute("email", "no");
			return "registration";
		}

		model.addAttribute("available", "yes");
//		user.setCategory((String) session.getAttribute("Category"));
		user.setAccountNumber(Integer.toString(user.hashCode()));
		service.saveUser(user);
		model.addAttribute("msg",
				"New User Registration Successful & your Account Number is " + user.getAccountNumber());
		return "registration";
	}

	@GetMapping("/help")
	public String gotoHelp(@ModelAttribute("help") Help help, Model model, HttpSession session) {
		Date date = Date.valueOf(LocalDate.now());
		model.addAttribute("date", date);
		return "help";
	}

	@PostMapping("/registerhelp")
	public String registerHelp(@Valid @ModelAttribute("help") Help help, BindingResult result, HttpSession session,
			Model model) {
		User u = (User) session.getAttribute("user");
		if (result.hasErrors()) {
			model.addAttribute("msg", "Please update all the mandatory field(s).");
			return "help";
		}
		model.addAttribute("msg", "Issue registered successful");
		help.setStatus("Pending");
		help.setUserId(u.getUserId());
		helpService.saveHelp(help);
		return "help";
	}

	@ModelAttribute("questions")
	public List<String> getQuestions() {
		List<String> li = new ArrayList<>();
		li.add("Favourite Color");
		li.add("Childhood pet name");
		li.add("School name");
		return li;
	}

	@ModelAttribute("sett")
	public String getlog() {
		return "login";
	}
}
