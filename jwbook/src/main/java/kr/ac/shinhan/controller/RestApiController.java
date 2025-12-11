package kr.ac.shinhan.controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/test")
public class RestApiController {
	@GetMapping
	public String sayHello(@RequestParam(value = "msg", required = false) String msg) {
		if (msg != null && !msg.isEmpty()) {
			return msg + " API Service(GET) 값이 있음";
		}
		return "Hello API Service(GET) 값이 없음";
	}
	
	@PostMapping // "/api/test?msg=메시지" 접근시 수행
	public String sayHelloPost(@RequestParam(value = "msg", defaultValue = "Default") String msg) {
		return msg + " API Service(POST)";
	}
}