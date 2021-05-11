package com.cognizant.project.exception;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ResponseBody;

@ControllerAdvice
public class ExceptionHandler {

	@org.springframework.web.bind.annotation.ExceptionHandler(NullPointerException.class)
	@ResponseBody
	public String handleException() {
		return "Please Login To acess this page";
	}

}
