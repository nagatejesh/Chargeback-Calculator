package com.cognizant.project.controller;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.cognizant.project.model.Feedback;
import com.cognizant.project.model.FeedbackQuestions;
import com.cognizant.project.model.Help;
import com.cognizant.project.service.FeedbackQuesService;
import com.cognizant.project.service.FeedbackService;
import com.cognizant.project.service.HelpService;
import com.cognizant.project.service.UserService;

@Controller
public class AdminController {

	@Autowired
	HelpService helpService;
	@Autowired
	UserService service;
	@Autowired
	FeedbackService feedbackService;
	@Autowired
	FeedbackQuesService feedbackQuesService;

	@GetMapping("/getallrequests")
	public String getAllHelpRequests(Model model, HttpSession session) {
		model.addAttribute("userType", "Admin");
		model.addAttribute("requests", helpService.findAllByStatus("Pending"));
		return "admin/allHelpRequests";
	}

	@GetMapping("/askFeedback")
	public String askFeedback(@ModelAttribute("feedback") Feedback feedback, Model model, HttpSession session) {
		model.addAttribute("userType", "Admin");
		return "admin/askFeedback";
	}

	@PostMapping("/createQuestions")
	public String createQuestions(@ModelAttribute("feedback") Feedback feedback, Model model, HttpSession session) {
		model.addAttribute("userType", "Admin");
		if (service.getUserByUserId(feedback.getUserId()) == null) {
			model.addAttribute("remarks", "User not found");
			return "admin/askFeedback";
		} else
			model.addAttribute("remarks", "Feedback form sent");
		feedback.setStatus("Open");
		feedbackService.save(feedback);
		List<Feedback> list = feedbackService.findAll();
		int id = list.get(list.size() - 1).getFeedbackId();
		for (FeedbackQuestions f : feedback.getQuesNAns()) {
			f.setFeedbackId(id);
			feedbackQuesService.save(f);
		}
		return "admin/askFeedback";
	}

	@GetMapping("/closedFeedbacks")
	public String closedFeedbacks(Model model, HttpSession session) {
		List<Feedback> list = feedbackService.findAllByStatus("closed");
		for (Feedback feedback : list) {
			feedback.setQuesNAns(feedbackQuesService.findAllByFeedbackId(feedback.getFeedbackId()));
		}
		model.addAttribute("feedbacks", list);
		return "admin/closedFeedbacks";
	}

	@GetMapping("/getrequest/{id}")
	public String getRequestById(@PathVariable("id") int id, @ModelAttribute("help") Help help, Model model,
			HttpSession session) {
		model.addAttribute("userType", "Admin");
		model.addAttribute("request", helpService.findById(id));
		session.setAttribute("id", id);
		return "admin/resolveRequest";
	}

	@PostMapping("/updateRequest")
	public String updateRequest(@ModelAttribute("help") Help help, Model model, HttpSession session) {
		model.addAttribute("userType", "Admin");
		Help help2 = helpService.findById((int) session.getAttribute("id"));
		help2.setStatus("Resolved");
		help2.setEndDate(Date.valueOf(LocalDate.now()));
		help2.setSolution(help.getSolution());
		helpService.saveHelp(help2);
		return "admin/resolveRequest";
	}

}
