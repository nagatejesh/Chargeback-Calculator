package com.cognizant.project.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.cognizant.project.model.FeedbackQuestions;

@Repository
public interface FeedbackQuesRepo extends JpaRepository<FeedbackQuestions, Integer> {

	List<FeedbackQuestions> findAllByFeedbackId(int feedbackId);

}
