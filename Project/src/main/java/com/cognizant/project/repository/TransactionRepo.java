package com.cognizant.project.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.cognizant.project.model.Transactions;

@Repository
public interface TransactionRepo extends JpaRepository<Transactions, Integer> {

	@Query(value = "SELECT * FROM transactions WHERE payment_date is NULL", nativeQuery = true)
	List<Transactions> findAllPendingTransactions();

	@Query(value = "SELECT * FROM transactions WHERE payment_date is NOT NULL", nativeQuery = true)
	List<Transactions> findAllProcessedPayments(String userId);

	List<Transactions> findAllByUserId(String userId);

}
