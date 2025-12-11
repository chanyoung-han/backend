package kr.ac.shinhan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class jstlExamController {
	@GetMapping("/jstlExam")
	public String jstlExam(Model m) {
		m.addAttribute("jstlExam", "jstlExam Controller");
		return "jstlExam";
	}
}
