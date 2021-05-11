package com.cognizant.project.repository;

import java.sql.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.cognizant.project.model.Complaints;

@Repository
public interface ComplaintRepo extends JpaRepository<Complaints, Integer> {

	List<Complaints> findAllByCustomerId(String userId);

	@Query(value = "SELECT DISTINCT customer_id FROM complaints ", nativeQuery = true)
	List<String> findAllCustomers();

	@Query(value = "SELECT * FROM complaints WHERE status =\'Approved\' AND customer_id= ?1 ORDER BY end_date DESC LIMIT 1", nativeQuery = true)
	Complaints findLastApprovedComplaintByUserId(String userId);

	List<Complaints> findAllByStatus(String status);

	@Query(value = "SELECT * FROM complaints WHERE start_date BETWEEN ?1 AND ?2", nativeQuery = true)
	List<Complaints> findAllByFromAndToDate(Date from, Date to);

}
