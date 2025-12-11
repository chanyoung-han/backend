package kr.ac.shinhan;

import lombok.Data;

@Data
public class News {
	private int aid;
	private String title;
	private String img;
	private String date;
	private String content;
}