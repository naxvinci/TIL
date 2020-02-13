package com.ggoreb.basic.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.ggoreb.basic.model.Member;

@Controller
public class WelcomeController {
	@GetMapping("/welcome")
	public String welcome(Model model) {
		List<String> list = new ArrayList<>();
		list.add("list1");
		list.add("list2");
		model.addAttribute("list", list);
		Map<String, Object> map = new HashMap<>();
		map.put("key1", "map1");
		map.put("key2", "map2");
		model.addAttribute("map", map);
		Member member = new Member();
		member.setUserId("a");
		member.setName("spring");
		member.setUserPassword("1234");
		model.addAttribute("member", member);
		model.addAttribute("message", "thymeleaf");
		return "welcome";
	}
}