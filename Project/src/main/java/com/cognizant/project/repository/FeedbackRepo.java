package com.cognizant.project.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.cognizant.project.model.Feedback;

@Repository
public interface FeedbackRepo extends JpaRepository<Feedback, Integer> {

	@Query(value = "SELECT * FROM feedback WHERE user_id = ?1 and status = \'Open\'", nativeQuery = true)
	List<Feedback> findAllByUserIdAndStatus(String userId);

	List<Feedback> findAllByStatus(String status);

}
