package com.ggoreb.basic.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ggoreb.basic.mapper.DemoMapper;
import com.ggoreb.basic.model.Demo;

@RestController
public class MyBatisController {
	@Autowired
	DemoMapper demoMapper;

	@GetMapping("/demo")
	public List<Demo> demo() {
		List<Demo> list = demoMapper.getDemoList();
		return list;
	}
}