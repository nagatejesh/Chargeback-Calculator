package com.cognizant.project.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cognizant.project.model.User;

public interface UserRepo extends JpaRepository<User, Integer> {

	User findByUserId(String userId);

	User findByContact(String contact);

	User findByEmail(String email);

	User findByAccountNumber(String account);

}
