package com.cognizant.project.controller;

import java.sql.Date;
import java.time.LocalDate;
import java.time.Period;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.cognizant.project.model.Complaints;
import com.cognizant.project.model.Feedback;
import com.cognizant.project.model.FeedbackQuestions;
import com.cognizant.project.model.Transactions;
import com.cognizant.project.model.User;
import com.cognizant.project.service.ComplaintService;
import com.cognizant.project.service.FeedbackQuesService;
import com.cognizant.project.service.FeedbackService;
import com.cognizant.project.service.TransactionService;
import com.cognizant.project.service.UserService;

@Controller
public class CustomerController {

	@Autowired
	UserService service;
	@Autowired
	TransactionService transactionService;
	@Autowired
	ComplaintService complaintService;
	@Autowired
	FeedbackService feedbackService;
	@Autowired
	FeedbackQuesService feedbackQuesService;

	@GetMapping("/bills")
	public String gotoBills(@ModelAttribute("transaction") Transactions transaction, Model model, HttpSession session) {
		if (session == null) {
			return "error";
		}
		model.addAttribute("userType", "Customer");
		model.addAttribute("list", transactionService.getAllPendingTransactions());
		return "customer/pendingBills";
	}

	@GetMapping("/complaint")
	public String logComplaint(@ModelAttribute("complaint") Complaints complaint, Model model, HttpSession session) {
		if (session == null) {
			return "error";
		}
		model.addAttribute("userType", "Customer");
		return "customer/complaint";
	}

	@GetMapping("/getMyComplaints")
	public String getMyComplaint(@ModelAttribute("complaint") Complaints complaint, Model model, HttpSession session) {
		if (session == null) {
			return "error";
		}
		User user = (User) session.getAttribute("user");
		List<Complaints> list = complaintService.findAllByUserId(user.getUserId());
		model.addAttribute("myComplaints", list);
		model.addAttribute("userType", "Customer");
		return "customer/mycomplaints";
	}

	@GetMapping("/processmypay/{transactionId}")
	public String makePayment(@PathVariable("transactionId") int transactionId, Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		model.addAttribute("userType", "Customer");
		Transactions t = transactionService.findById(transactionId);
		// update balance changes in both accounts
		Date d = Date.valueOf(LocalDate.now());
		t.setPaymentDate(d);
		Period p = Period.between(t.getDueDate().toLocalDate(), d.toLocalDate());
		int duedays = p.getDays();
		double amount;
		if (duedays > 0) {
			t.setLateFee(t.getDebit() * duedays / 100);
		} else {
			t.setLateFee(0);
		}
		amount = t.getDebit() + t.getLateFee();
		if (amount > user.getBalance()) {
			model.addAttribute("status", "Insufficient balance");
			return "customer/pendingBills";
		}
		transactionService.saveTransaction(t);
		service.updateBalance(amount, user.getUserId());
		model.addAttribute("status", "Payment Successful");
		return "customer/pendingBills";
	}

	@PostMapping("/registercomplaint")
	public String registerComplaint(@Valid @ModelAttribute("complaint") Complaints complaint, BindingResult result,
			Model model, HttpSession session) {
		model.addAttribute("userType", "Customer");
		if (result.hasErrors()) {
			model.addAttribute("remarks", "Please update all the highlighted mandatory field(s).");
			return "customer/complaint";
		}
		if (transactionService.findById(complaint.getTransactionId()) == null) {
			model.addAttribute("remarks", "Cannot find the transaction. Please check your bill Id");
			return "customer/complaint";
		}
		LocalDate date = complaint.getDate().toLocalDate();
		int days = Period.between(date, LocalDate.now()).getDays();
		if (days > 15) {
			model.addAttribute("remarks", "Sorry, Complaint can be raised only for the transactions within 15 days");
			return "customer/complaint";
		}
		complaint.setStartDate(Date.valueOf(LocalDate.now()));
		complaint.setStatus("New");
//		save the complaint to database
		complaintService.saveComplaint(complaint);
		model.addAttribute("remarks", "Complaint lodged successfully!!!");
		return "customer/complaint";
	}

	@GetMapping("/editFeedback/{feedbackId}")
	public String editFeedback(@PathVariable("feedbackId") int feedbackId,
			@ModelAttribute("feedback") Feedback feedback, Model model, HttpSession session) {
		Feedback feedback2 = feedbackService.findById(feedbackId);
		feedback2.setQuesNAns(feedbackQuesService.findAllByFeedbackId(feedbackId));
		model.addAttribute("feedback", feedback2);
		System.out.println(feedbackService.findById(feedbackId));
		session.removeAttribute("id");
		session.setAttribute("id", feedbackId);
		return "customer/feedback";
	}

	@PostMapping("/saveFeedback")
	public String saveFeedback(@ModelAttribute("feedback") Feedback feedback, Model model, HttpSession session) {
		int id = (int) session.getAttribute("id");
		Feedback oldFeedback = feedbackService.findById(id);
		oldFeedback.setStatus("Closed");
		feedbackService.save(feedback);
		List<FeedbackQuestions> quesNAns = oldFeedback.getQuesNAns();
		for (int i = 0; i < quesNAns.size(); i++) {
			FeedbackQuestions questions = feedbackQuesService.findById(quesNAns.get(i).getQuestionNo());
			questions.setAnswer(feedback.getQuesNAns().get(i).getAnswer());
			feedbackQuesService.save(questions);
		}
		model.addAttribute("remarks", "Feedback submitted successfully");
		return "customer/feedback";
	}
}
