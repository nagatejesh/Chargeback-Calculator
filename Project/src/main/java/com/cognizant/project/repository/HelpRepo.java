package com.cognizant.project.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.cognizant.project.model.Help;

@Repository
public interface HelpRepo extends JpaRepository<Help, Integer> {

	List<Help> findAllByStatus(String status);

	List<Help> findAllByUserId(String userId);

	@Query(value = "SELECT * FROM help WHERE status =\'Resolved\' AND user_id= ?1 ORDER BY end_date DESC LIMIT 1", nativeQuery = true)
	Help findLastResolvedRequestByUserId(String userId);

}
