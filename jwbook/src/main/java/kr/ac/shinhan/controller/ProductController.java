package kr.ac.shinhan.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import kr.ac.shinhan.ProductService;

@Controller
@RequestMapping("/pcontrol")
public class ProductController {
	@Autowired
	private ProductService service;
	@GetMapping
	public String handleRequest(@RequestParam(value = "action", required = false) String action,
								@RequestParam(value = "id", required = false) String id,
								Model model) {
		if (action == null) {
			return "redirect:/pcontrol?action=list";
		}
		switch (action) {
			case "list":
				return list(model);
			case "info":
				return info(id, model);
			default:
				return "redirect:/pcontrol?action=list";
		}
	}
	private String list(Model model) {
		model.addAttribute("products", service.findAll());
		return "ch08/productList";
	}
	private String info(String id, Model model) {
		model.addAttribute("p", service.find(id));
		return "ch08/productInfo";
	}
}