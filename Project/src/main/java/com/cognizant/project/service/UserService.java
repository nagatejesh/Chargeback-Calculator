package com.cognizant.project.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cognizant.project.model.User;
import com.cognizant.project.repository.UserRepo;

@Service
public class UserService {

	@Autowired
	private UserRepo repo;

	public User saveUser(User user) {
		return repo.save(user);
	}

	public User getUserById(int id) {
		return repo.findById(id).orElse(null);
	}

	public User getUserByUserId(String userId) {
		return repo.findByUserId(userId);
	}

	public User getUserByContact(String contact) {
		return repo.findByContact(contact);
	}

	public User getUserByAccountNumber(String account) {
		return repo.findByAccountNumber(account);
	}

	public User getUserByEmail(String email) {
		return repo.findByEmail(email);
	}

	public User updatePassword(User user) {
		int id = repo.findByUserId(user.getUserId()).getId();
		User oldUser = repo.findById(id).get();
		oldUser.setPassword(user.getPassword());
		return repo.save(oldUser);
	}

	public List<User> getAllUsers() {
		return repo.findAll();
	}

	public List<User> getAllCustomers() {
		List<User> allUsers = getAllUsers();
		List<User> allCustomers = new ArrayList<>();
		for (User u : allUsers) {
			if (u.getCategory().equals("Customer"))
				allCustomers.add(u);
		}
		return allCustomers;
	}

	public List<String> getAllCustomersIds() {
		List<User> allCustomers = getAllCustomers();
		List<String> custIds = new ArrayList<>();
		for (User u : allCustomers) {
			custIds.add(u.getUserId());
		}
		return custIds;
	}

	public void updateBalance(double amount, String userId) {
		User oldUser = repo.findByUserId(userId);
		oldUser.setBalance(oldUser.getBalance() - amount);
		repo.save(oldUser);
	}

}
