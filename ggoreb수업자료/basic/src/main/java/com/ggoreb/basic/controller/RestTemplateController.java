package com.ggoreb.basic.controller;

import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URLEncoder;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.ggoreb.basic.model.JsonData;

@RestController
public class RestTemplateController {
	@GetMapping("/getString")
	public String getString() {
		RestTemplate rt = new RestTemplate();
		String result = rt.getForObject("http://ggoreb.com/http/json1.jsp", String.class);
		return result;
	}
	
	@GetMapping("/getMap")
	public Map<String, Object> getMap() {
		RestTemplate rt = new RestTemplate();
		Map<String, Object> map = rt.getForObject("http://ggoreb.com/http/json1.jsp", Map.class);
		return map;
	}
	
	@GetMapping("/getObject")
	public JsonData getObject() {
		RestTemplate rt = new RestTemplate();
		JsonData data = rt.getForObject("http://ggoreb.com/http/json1.jsp", JsonData.class);
		return data;
	}
	
	@GetMapping("/getListMap")
	public List<Map<String, Object>> getListMap() {
		RestTemplate rt = new RestTemplate();
		List<Map<String, Object>> list = rt.getForObject("http://ggoreb.com/http/json2.jsp", List.class);
		return list;
	}
	
	@GetMapping("/getListObject")
	public List<JsonData> getListObject() {
		RestTemplate rt = new RestTemplate();
		List<JsonData> list = rt.getForObject("http://ggoreb.com/http/json2.jsp", List.class);
		return list;
	}
	
	@GetMapping("/getArray")
	public List<JsonData> getArray() {
		RestTemplate rt = new RestTemplate();
		JsonData[] data = rt.getForObject("http://ggoreb.com/http/json2.jsp", JsonData[].class);
		List<JsonData> list = Arrays.asList(data);
		return list;
	}
	
	@GetMapping("/post")
	public String post() {
		RestTemplate rt = new RestTemplate();
		String data = rt.postForObject("http://ggoreb.com/http/list2.jsp", null, String.class);
		return data;
	}
	
	@GetMapping("/getKakao")
	public ResponseEntity<Map> getKakao() {
		RestTemplate rt = new RestTemplate();
		RequestEntity requestEntity = null;
		try {
			requestEntity = RequestEntity.get(
					new URI(
							"https://dapi.kakao.com/v2/local/search/address.json?query=" + 
							URLEncoder.encode("부산 연제구 연산동 1000", "utf-8")))
					.header("Authorization", "KakaoAK d4be7b479f4b4cbd99bd19ae87f88b4b").build();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (URISyntaxException e) {
			e.printStackTrace();
		}
		ResponseEntity<Map> entity = rt.exchange(requestEntity, Map.class);
		return entity;
	}
	
	@GetMapping("/getNaver")
	public ResponseEntity<Map> getNaver() {
		RestTemplate rt = new RestTemplate();
		
		RequestEntity<Map<String, String>> requestEntity = null;
		try {
			Map<String, String> body = new HashMap<>();
			body.put("source", "ko");
			body.put("target", "en");
			body.put("text", "안녕하세요. 저는 자바 개발자입니다.");

			requestEntity = RequestEntity.post(
					new URI("https://openapi.naver.com/v1/papago/n2mt"))
					.header("X-Naver-Client-Id", "OpcnSsAIn37qIu6Iyad6")
					.header("X-Naver-Client-Secret", "p7qtbsYx8N")
					.body(body);
		} catch (URISyntaxException e) {
			e.printStackTrace();
		}
		
		ResponseEntity<Map> entity = rt.exchange(requestEntity, Map.class);
		System.out.println(entity.getBody());
		return entity;
	}
}
