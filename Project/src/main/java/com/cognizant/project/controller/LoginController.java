package com.cognizant.project.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.cognizant.project.model.Complaints;
import com.cognizant.project.model.Feedback;
import com.cognizant.project.model.Help;
import com.cognizant.project.model.Transactions;
import com.cognizant.project.model.User;
import com.cognizant.project.service.ComplaintService;
import com.cognizant.project.service.FeedbackService;
import com.cognizant.project.service.HelpService;
import com.cognizant.project.service.TransactionService;
import com.cognizant.project.service.UserService;

@Controller
public class LoginController {

	@Autowired
	UserService service;
	@Autowired
	TransactionService transactionService;
	@Autowired
	ComplaintService complaintService;
	@Autowired
	HelpService helpService;
	@Autowired
	FeedbackService feedbackService;

	@GetMapping("/forgotuserID")
	public String forgotId(@ModelAttribute("user") User user, Model model) {
		return "forgotuserID";
	}

	@GetMapping("/forgotpassword")
	public String forgotpassword(@ModelAttribute("user") User user, Model model) {
		return "forgotpassword";
	}

	@PostMapping("/logmein")
	public String logmein(@ModelAttribute("user") User user, Model model, HttpSession session) {
		User user2 = service.getUserByUserId(user.getUserId());
		if (user2 == null) {
			model.addAttribute("msg", "Check your UserId and try again");
			return "Login";
		}
		if (!(user2.getPassword().equals(user.getPassword()))) {
			model.addAttribute("msg", "Check your password and try again");
			return "Login";
		}
		model.addAttribute("sett", "logout");
		session.setAttribute("login", true);
		if (!((boolean) session.getAttribute("login"))) {
			model.addAttribute("sett", "login");
			return "Login";
		}
		model.addAttribute("userType", user2.getCategory());
		session.setAttribute("user", user2);
		model.addAttribute("user", user2);
		if (user2.getCategory().equals("Customer")) {
			return "redirect:/customerhome";
		}

		if (user2.getCategory().equals("Employee")) {
			return "redirect:/employeehome";
		}
		return "redirect:/adminhome";
	}

	@GetMapping("/customerhome")
	public String customerHome(Model model, HttpSession session) {
		User u = (User) session.getAttribute("user");
		User user = service.getUserByUserId(u.getUserId());
		model.addAttribute("customer", user);
		model.addAttribute("userType", "Customer");
		List<Transactions> list = transactionService.getProcessedPayments(user.getUserId());
		Complaints c = complaintService.findLastApprovedComplaintByUserId(user.getUserId());
		model.addAttribute("notify", c);
		Help h = helpService.findLastResolvedRequestByUserId(user.getUserId());
		model.addAttribute("help", h);
		model.addAttribute("transactions", list);
		List<Feedback> feedbacks = feedbackService.findAllByUserIdAndStatus(u.getUserId());
		model.addAttribute("feedbacks", feedbacks);
		return "customer/home";
	}

	@GetMapping("/employeehome")
	public String employeeHome(Model model, HttpSession session) {
		User u = (User) session.getAttribute("user");
		Help h = helpService.findLastResolvedRequestByUserId(u.getUserId());
		model.addAttribute("help", h);
		List<User> allCustomers = service.getAllCustomers();
		model.addAttribute("userType", "Employee");
		model.addAttribute("customers", allCustomers);
		List<Complaints> list = complaintService.findAll();
		if (list.isEmpty())
			model.addAttribute("noOfComplaints", 0);
		else
			model.addAttribute("noOfComplaints", list.size());
		list = complaintService.findAllByStatus("New");
		if (list.isEmpty())
			model.addAttribute("new", 0);
		else
			model.addAttribute("new", list.size());
		list = complaintService.findAllByStatus("Approved");
		if (list.isEmpty())
			model.addAttribute("approved", 0);
		else
			model.addAttribute("approved", list.size());
		list = complaintService.findAllByStatus("Rejected");
		if (list.isEmpty())
			model.addAttribute("rejected", 0);
		else
			model.addAttribute("rejected", list.size());
		return "employee/home";
	}

	@GetMapping("/adminhome")
	public String adminHome(Model model, HttpSession session) {
		model.addAttribute("userType", "Admin");
		return "admin/home";
	}

	@GetMapping("/goHome")
	public String gotohome(Model model, HttpSession session) {
		User u = (User) session.getAttribute("user");
		if (u == null) {
			return "homepage";
		}
		String c = u.getCategory();
		model.addAttribute("userType", c);
		if (c.charAt(0) == 'C') {
			return "redirect:/customerhome";
		}
		if (c.charAt(0) == 'E') {
			return "redirect:/employeehome";
		}
		if (c.charAt(0) == 'A') {
			return "redirect:/adminhome";
		}
		return "homepage";
	}

	@PostMapping("/getid")
	public String getUId(@ModelAttribute("user") User user, Model model) {
		if (user.getContact().contains("@")) {
			user.setEmail(user.getContact());
			user.setContact(null);
		} else {
		}
		User user2 = ((user.getContact() == null) ? (service.getUserByEmail(user.getEmail()))
				: (service.getUserByContact(user.getContact())));
		if (user2 == null) {
			model.addAttribute("getidmsg", "Sorry! It seems like you have given a wrong number/email.");
			return "forgotuserID";
		}
		if (!(user2.getQuestion().equals(user.getQuestion()))) {
			model.addAttribute("getidmsg", "It seems like you have chosen a wrong question.");
			return "forgotuserID";
		}
		if (!(user2.getAnswer().equalsIgnoreCase(user.getAnswer()))) {
			model.addAttribute("getidmsg", "OOPS! Your answer is wrong");
			return "forgotuserID";
		}
		model.addAttribute("getidmsg", "Oola! Your Id is \"" + user2.getUserId() + "\"...Continue Login");
		return "forgotuserID";
	}

	@PostMapping("/resetpassword")
	public String checkUpassword(@ModelAttribute("user") User user, Model model, HttpSession session) {
		User user2 = service.getUserByUserId(user.getUserId());
		if (user2 == null) {
			model.addAttribute("getpassmsg", "Sorry! It seems like you have given a wrong UserId.");
			return "forgotpassword";
		}
		if (!(user2.getQuestion().equals(user.getQuestion()))) {
			model.addAttribute("getpassmsg", "It seems like you have chosen a wrong question.");
			return "forgotpassword";
		}
		if (!(user2.getAnswer().equalsIgnoreCase(user.getAnswer()))) {
			model.addAttribute("getpassmsg", "OOPS! Your answer is wrong");
			return "forgotpassword";
		}
		session.setAttribute("userId", user2.getUserId());
		return "resetpassword";
	}

	@PostMapping("/passwordreseted")
	public String updatePassword(@ModelAttribute("user") User user, Model model, HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		user.setUserId(userId);
		service.updatePassword(user);
		model.addAttribute("getmsg", "Password Reset Successful");
		return "resetpassword";
	}

}
