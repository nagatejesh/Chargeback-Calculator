package com.cognizant.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cognizant.project.model.Feedback;
import com.cognizant.project.repository.FeedbackRepo;

@Service
public class FeedbackService {

	@Autowired
	FeedbackRepo feedbackRepo;

	public Feedback save(Feedback feedback) {
		return feedbackRepo.save(feedback);
	}

	public List<Feedback> findAll() {
		return feedbackRepo.findAll();
	}

	public Feedback findById(int id) {
		return feedbackRepo.findById(id).orElse(null);
	}

	public List<Feedback> findAllByUserIdAndStatus(String userId) {
		return feedbackRepo.findAllByUserIdAndStatus(userId);
	}

	public List<Feedback> findAllByStatus(String status) {
		return feedbackRepo.findAllByStatus(status);
	}

}
