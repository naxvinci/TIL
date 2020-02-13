package com.ggoreb.basic.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ggoreb.basic.model.FileInfo;

@Controller
public class UploadController {
	@GetMapping("/upload1")
	public String upload1() {
		return "upload1";
	}
	
	@PostMapping("/upload1")
	@ResponseBody
	public String upload1Post(MultipartHttpServletRequest mRequest) {
		String result = "";

		MultipartFile mFile = mRequest.getFile("file");
		String oName = mFile.getOriginalFilename();
		result += oName + "\n";

		return result;
	}

	@GetMapping("/upload2")
	public String upload2() {
		return "upload2";
	}
	
	@PostMapping("/upload2")
	@ResponseBody
	public String upload2Post(@RequestParam("file") MultipartFile mFile) {
		String result = "";
		
		String oName = mFile.getOriginalFilename();
		result += oName + "\n";
		
		return result;
	}
	
	@GetMapping("/upload3")
	public String upload3() {
		return "upload3";
	}
	
	@PostMapping("/upload3")
	@ResponseBody
	public String upload3Post(@ModelAttribute FileInfo info) {
		String result = "";
		
		String oName = info.getFile().getOriginalFilename();
		result += oName + "\n";
		
		return result;
	}
}
