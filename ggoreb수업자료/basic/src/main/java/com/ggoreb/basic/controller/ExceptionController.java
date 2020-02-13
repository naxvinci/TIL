package com.ggoreb.basic.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ggoreb.basic.exception.MyException;

@RestController
public class ExceptionController {
	@GetMapping("exception1")
	public String exception1() throws Exception {
		throw new Exception("exception!");
// return "exception1";
	}

	@GetMapping("exception2")
	public String exception2() {
		throw new MyException("runtime exception!");
// return "exception2";
	}
}