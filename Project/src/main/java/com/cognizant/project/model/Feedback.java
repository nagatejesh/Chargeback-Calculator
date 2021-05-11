package com.cognizant.project.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Feedback {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int feedbackId;
	private String userId;
	private String status;
	@OneToMany(mappedBy = "feedbackId")
	private List<FeedbackQuestions> quesNAns = new ArrayList<>();

	@Override
	public String toString() {
		return "Feedback [feedbackId=" + feedbackId + ", userId=" + userId + ", status=" + status + ", quesNAns="
				+ quesNAns + "]";
	}

	public List<FeedbackQuestions> getQuesNAns() {
		return quesNAns;
	}

	public void setQuesNAns(List<FeedbackQuestions> quesNAns) {
		this.quesNAns = quesNAns;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getFeedbackId() {
		return feedbackId;
	}

	public void setFeedbackId(int feedbackId) {
		this.feedbackId = feedbackId;
	}

}
