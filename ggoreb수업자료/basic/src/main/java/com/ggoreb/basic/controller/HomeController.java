package com.ggoreb.basic.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
public class HomeController {
//	Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping("/")
	public String home() {
		log.trace("trace!");
		log.debug("debug!");
		log.info("info!");
		log.warn("warn!");
		log.error("error!");
		
		return "home";
	}
}