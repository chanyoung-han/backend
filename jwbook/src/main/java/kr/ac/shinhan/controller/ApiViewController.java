package kr.ac.shinhan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ApiViewController {
	@GetMapping("/api")
	public String apiTestPage() {
		return "ch12/apiTest";
	}
}