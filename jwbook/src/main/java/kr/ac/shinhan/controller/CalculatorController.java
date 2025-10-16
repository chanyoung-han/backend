package kr.ac.shinhan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CalculatorController {
    
    @GetMapping("/calculator")
    public String calculatorPage() {
        return "calculator";
    }
    
    @PostMapping("/calculate")
    public String calculate(
            @RequestParam("num1") double num1,
            @RequestParam("num2") double num2,
            @RequestParam("operator") String operator,
            Model model) {
        
        double result = 0;
        boolean hasError = false;
        String errorMessage = "";
        
        try {
            switch(operator) {
                case "+":
                    result = num1 + num2;
                    break;
                case "-":
                    result = num1 - num2;
                    break;
                case "*":
                    result = num1 * num2;
                    break;
                case "/":
                    if(num2 == 0) {
                        hasError = true;
                        errorMessage = "0으로 나눌 수 없습니다!";
                    } else {
                        result = num1 / num2;
                    }
                    break;
                default:
                    hasError = true;
                    errorMessage = "잘못된 연산자입니다!";
            }
            
            if(!hasError) {
                model.addAttribute("result", result);
                model.addAttribute("num1", num1);
                model.addAttribute("num2", num2);
                model.addAttribute("operator", operator);
            } else {
                model.addAttribute("error", errorMessage);
            }
            
        } catch(Exception e) {
            model.addAttribute("error", "계산 중 오류가 발생했습니다: " + e.getMessage());
        }
        
        return "calculator";
    }
}