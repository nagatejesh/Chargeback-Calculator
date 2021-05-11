package com.cognizant.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cognizant.project.model.Transactions;
import com.cognizant.project.repository.TransactionRepo;

@Service
public class TransactionService {

	@Autowired
	TransactionRepo transactionRepo;

	public Transactions saveTransaction(Transactions transaction) {
		return transactionRepo.save(transaction);
	}

	public List<Transactions> getAllPendingTransactions() {
		return transactionRepo.findAllPendingTransactions();
	}

	public Transactions findById(int id) {
		return transactionRepo.findById(id).orElse(null);
	}

	public List<Transactions> getProcessedPayments(String userId) {
		return transactionRepo.findAllProcessedPayments(userId);
	}

	public List<Transactions> getAllTransactionsByUserId(String userId) {
		// TODO Auto-generated method stub
		return transactionRepo.findAllByUserId(userId);
	}
}
