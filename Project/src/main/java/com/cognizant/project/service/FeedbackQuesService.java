package com.cognizant.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cognizant.project.model.FeedbackQuestions;
import com.cognizant.project.repository.FeedbackQuesRepo;

@Service
public class FeedbackQuesService {

	@Autowired
	FeedbackQuesRepo feedbackQuesRepo;

	public FeedbackQuestions save(FeedbackQuestions questions) {
		return feedbackQuesRepo.save(questions);
	}

	public FeedbackQuestions findById(int questionNo) {
		return feedbackQuesRepo.findById(questionNo).orElse(null);
	}

	public List<FeedbackQuestions> findAllByFeedbackId(int feedbackId) {
		return feedbackQuesRepo.findAllByFeedbackId(feedbackId);
	}
}
