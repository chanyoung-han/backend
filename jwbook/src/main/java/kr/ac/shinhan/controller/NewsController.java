package kr.ac.shinhan.controller;

import kr.ac.shinhan.News;
import kr.ac.shinhan.NewsDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.List;

@Controller
@RequestMapping("/news")
public class NewsController {
	@Autowired
	private NewsDAO dao;
	
	// 뉴스 목록
	@GetMapping
	public String listNews(Model model) {
		try {
			List<News> list = dao.getAll();
			model.addAttribute("newslist", list);
		} catch (Exception e) {
			model.addAttribute("error", "뉴스 목록을 불러오는 데 실패했습니다.");
		}
		return "ch10/newsList";
	}
	
	// 뉴스 상세 보기
	@GetMapping("/{aid}")
	public String getNews(@PathVariable("aid") int aid, Model model) {
		try {
			News news = dao.getNews(aid);
			model.addAttribute("news", news);
		} catch (Exception e) {
			model.addAttribute("error", "뉴스를 불러오는 데 실패했습니다.");
		}
		return "ch10/newsView";
	}
	
	// 뉴스 추가 폼 (GET)
	@GetMapping("/add")
	public String showAddForm() {
		return "ch10/newsForm";
	}

	// 뉴스 추가 처리 (POST)
	@PostMapping("/add")
	public String addNews(@ModelAttribute News news, @RequestParam("file") MultipartFile file) {
		try {
			if (!file.isEmpty()) {
				String fileName = file.getOriginalFilename();
				file.transferTo(new java.io.File("c:/Temp/img/" + fileName));
				news.setImg("/img/" + fileName);
			}
			dao.addNews(news);
		} catch (Exception e) {
		//	return "redirect:/news?error=등록 실패";
			String errorMsg = URLEncoder.encode("등록 실패", StandardCharsets.UTF_8);
			return "redirect:/news?error=" + errorMsg;
		}
		return "redirect:/news";
	}

	// 뉴스 삭제
	@GetMapping("/delete/{aid}")
	public String deleteNews(@PathVariable("aid") int aid) {
		try {
			dao.delNews(aid);
		} catch (Exception e) {
		//	return "redirect:/news?error=삭제 실패";
			String errorMsg = URLEncoder.encode("삭제 실패", StandardCharsets.UTF_8);
			return "redirect:/news?error=" + errorMsg;
		}
		return "redirect:/news";
	}
}