package com.cognizant.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cognizant.project.model.Help;
import com.cognizant.project.repository.HelpRepo;

@Service
public class HelpService {

	@Autowired
	HelpRepo helpRepo;

	public Help saveHelp(Help help) {
		return helpRepo.save(help);
	}

	public Help updateHelp(Help help) {
		Help oldHelp = helpRepo.findById(help.getRequestId()).orElse(null);
		oldHelp.setSolution(help.getSolution());
		oldHelp.setStatus(help.getStatus());
		return helpRepo.save(oldHelp);
	}

	public Help findById(int id) {
		return helpRepo.findById(id).orElse(null);
	}

	public List<Help> findAllByStatus(String status) {
		return helpRepo.findAllByStatus(status);
	}

	public List<Help> findAllByUserId(String userId) {
		return helpRepo.findAllByUserId(userId);
	}

	public Help findLastResolvedRequestByUserId(String userId) {
		return helpRepo.findLastResolvedRequestByUserId(userId);
	}

}
