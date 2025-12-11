package kr.ac.shinhan.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import kr.ac.shinhan.Student;
import kr.ac.shinhan.StudentDAO;

@Controller
@RequestMapping("/studentControl")
public class StudentController {
	@Autowired
	private StudentDAO dao;
	
	// 학생 목록 조회
	@GetMapping
	public String list(Model model) {
		List<Student> students = dao.getAll();
		model.addAttribute("students", students);
		return "ch09/studentInfo";
	}
	
	// 학생 등록 폼
	@GetMapping("/form")
	public String form() {
		return "ch09/studentForm";
	}
	
	// 학생 등록 처리
	@PostMapping("/insert")
	public String insert(@ModelAttribute Student student) {
		dao.insert(student);
		return "redirect:/studentControl";
	}
	
	// 학생 수정 폼
	@GetMapping("/edit")
	public String editForm(@RequestParam("id") int id, Model model) {
		Student student = dao.getById(id);
		model.addAttribute("student", student);
		return "ch09/studentEdit";
	}
	
	//학생 수정 처리
	@PostMapping("/update")
	public String update(@ModelAttribute Student student) {
		dao.update(student);
		return "redirect:/studentControl";
	}
	
	//학생 삭제
	@GetMapping("/delete")
	public String delete(@RequestParam("id") int id) {
		dao.delete(id);
		return "redirect:/studentControl";
	}
}