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
import org.springframework.web.bind.annotation.RequestParam;

import com.cognizant.project.model.Complaints;
import com.cognizant.project.model.Transactions;
import com.cognizant.project.model.User;
import com.cognizant.project.service.ComplaintService;
import com.cognizant.project.service.TransactionService;
import com.cognizant.project.service.UserService;

@Controller
public class EmployeeController {

	@Autowired
	UserService service;
	@Autowired
	ComplaintService complaintService;
	@Autowired
	TransactionService transactionService;

	@GetMapping("/getDetails/{userId}")
	public String getDetails(@PathVariable String userId, Model model) {
		User user = service.getUserByUserId(userId);
		model.addAttribute("customer", user);
		model.addAttribute("userType", "Employee");
		List<Transactions> list = transactionService.getAllTransactionsByUserId(user.getUserId());
		model.addAttribute("transactions", list);
		return "employee/customerdetails";
	}

	@GetMapping("/getAllDetails")
	public String getDetailsFromSearch(@RequestParam("id") String id, Model model, HttpSession session) {
		return "redirect:/getDetails/" + id;
	}

	@GetMapping("/getAllCustomerChargebacks")
	public String getAllChargebacks(Model model, HttpSession session) {
		List<String> allCustomers = complaintService.findAllCustomers();
		model.addAttribute("userType", "Employee");
		model.addAttribute("customers", allCustomers);
//		List<Complaints> activeChargebacks = new ArrayList<>();
//		for (Complaints complaint : all) {
//			if (complaint.getStatus().equals("New"))
//				activeChargebacks.add(complaint);
//		}
//		model.addAttribute("chargebacks", activeChargebacks);
		return "employee/allCustomerChargebacks";
	}

	@GetMapping("/getAllChargebacks/{id}")
	public String getAllChargebacks(@PathVariable("id") String userId, Model model, HttpSession session) {
		List<Complaints> list = complaintService.findAllByUserId(userId);
		model.addAttribute("chargebacks", list);
		model.addAttribute("userType", "Employee");
		return "employee/allChargebacks";
	}

	@GetMapping("/editChargeback/{id}")
	public String editChargeback(@PathVariable int id, @ModelAttribute("complaint") Complaints complaint, Model model,
			HttpSession session) {
		model.addAttribute("chargeback", complaintService.findById(id));
		session.setAttribute("id", id);
		model.addAttribute("userType", "Employee");
		return "employee/editChargeback";
	}

	@PostMapping("/saveChargeback")
	public String saveChargeback(@ModelAttribute("complaint") Complaints complaint, Model model, HttpSession session) {
		if (complaint.getStatus().equals("Approved")) {
			Transactions transaction = transactionService.findById(complaint.getTransactionId());
			transaction.setCredit(complaint.getChargebackAmount());
			service.updateBalance(-complaint.getChargebackAmount(), complaint.getCustomerId());
		}
		complaint.setId((int) session.getAttribute("id"));
		session.removeAttribute("id");
		complaint.setEndDate(Date.valueOf(LocalDate.now()));
		model.addAttribute("userType", "Employee");
		complaint = complaintService.saveComplaint(complaint);
		model.addAttribute("chargeback", complaint);
		model.addAttribute("remarks", "Changes of this Chargeback are saved");
		return "employee/editChargeback";
	}

	@GetMapping("/getAllComplaints")
	public String getAllComplaints(@RequestParam("from") Date from, @RequestParam("to") Date to, Model model,
			HttpSession session) {
		List<Complaints> list = complaintService.findAllByFromAndToDate(from, to);
		model.addAttribute("chargebacks", list);
		model.addAttribute("status", "all");
		model.addAttribute("userType", "Employee");
		return "employee/allChargebacks";
	}

	@GetMapping("/newComplaints")
	public String getAllNewComplaints(Model model, HttpSession session) {
		List<Complaints> list = complaintService.findAllByStatus("New");
		model.addAttribute("chargebacks", list);
		model.addAttribute("status", "New");
		model.addAttribute("userType", "Employee");
		return "employee/allChargebacks";
	}

	@GetMapping("/approvedComplaints")
	public String getAllApprovedComplaints(Model model, HttpSession session) {
		List<Complaints> list = complaintService.findAllByStatus("Approved");
		model.addAttribute("chargebacks", list);
		model.addAttribute("status", "all");
		model.addAttribute("userType", "Employee");
		return "employee/allChargebacks";
	}

	@GetMapping("/rejectedComplaints")
	public String getAllARejectedComplaints(Model model, HttpSession session) {
		List<Complaints> list = complaintService.findAllByStatus("Rejected");
		model.addAttribute("chargebacks", list);
		model.addAttribute("status", "all");
		model.addAttribute("userType", "Employee");
		return "employee/allChargebacks";
	}
}
