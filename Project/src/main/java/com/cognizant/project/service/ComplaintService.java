package com.cognizant.project.service;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cognizant.project.model.Complaints;
import com.cognizant.project.repository.ComplaintRepo;

@Service
public class ComplaintService {

	@Autowired
	ComplaintRepo complaintRepo;

	public Complaints saveComplaint(Complaints complaint) {
		return complaintRepo.save(complaint);
	}

	public List<Complaints> findAllByUserId(String userId) {

		return complaintRepo.findAllByCustomerId(userId);

	}

	public List<Complaints> findAll() {
		return complaintRepo.findAll();
	}

	public Complaints findById(int id) {
		return complaintRepo.findById(id).get();
	}

	public Complaints updateComplaint(Complaints complaint) {
		Complaints oldComplaint = complaintRepo.findById(complaint.getId()).get();
		oldComplaint.setChargebackAmount(complaint.getChargebackAmount());
		if (complaint.getStatus().equals("Resolved")) {
			oldComplaint.setStatus("Resolved");
			oldComplaint.setEndDate(complaint.getEndDate());
		}
		return complaintRepo.save(oldComplaint);
	}

	public List<String> findAllCustomers() {
		// TODO Auto-generated method stub
		return complaintRepo.findAllCustomers();
	}

	public Complaints findLastApprovedComplaintByUserId(String userId) {
		// TODO Auto-generated method stub
		return complaintRepo.findLastApprovedComplaintByUserId(userId);
	}

	public List<Complaints> findAllByStatus(String status) {
		return complaintRepo.findAllByStatus(status);
	}

	public List<Complaints> findAllByFromAndToDate(Date from, Date to) {
		return complaintRepo.findAllByFromAndToDate(from, to);
	}

}
