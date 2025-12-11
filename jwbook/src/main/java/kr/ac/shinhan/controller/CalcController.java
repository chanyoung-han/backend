package kr.ac.shinhan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CalcController {
	// GET 요청도 처리 (테스트용)
	@GetMapping("/calcResult")
	public String calcResultGet(
			@RequestParam("n1") int n1,
			@RequestParam("n2") int n2,
			@RequestParam("op") String op,
			Model model) {
		return calculate(n1, n2, op, model);
	}
	// POST 요청 처리
	@PostMapping("/calcResult")
	public String calcResultPost(
			@RequestParam("n1") int n1,
			@RequestParam("n2") int n2,
			@RequestParam("op") String op,
			Model model) {
		return calculate(n1, n2, op, model);
	}
	// 실제 계산 로직
	private String calculate(int n1, int n2, String op, Model model) {
		long result = 0;
		switch(op) {
			case "+": result = n1 + n2; break;
			case "-": result = n1 - n2; break;
			case "/": result = n1 / n2; break;
			case "*": result = n1 * n2; break;
		}
		model.addAttribute("result", result);
		return "ch08/calcResult";
		// /WEB-INF/views/ch08/calcResult.jsp
	}
}