package com.cognizant.project.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class FeedbackQuestions {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int questionNo;
	private String question;
	private String answer;
	private int feedbackId;

	public int getQuestionNo() {
		return questionNo;
	}

	public void setQuestionNo(int questionNo) {
		this.questionNo = questionNo;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public int getFeedbackId() {
		return feedbackId;
	}

	public void setFeedbackId(int feedbackId) {
		this.feedbackId = feedbackId;
	}

	@Override
	public String toString() {
		return "FeedbackQuestions [questionNo=" + questionNo + ", question=" + question + ", answer=" + answer
				+ ", feedbackId=" + feedbackId + "]";
	}

}
