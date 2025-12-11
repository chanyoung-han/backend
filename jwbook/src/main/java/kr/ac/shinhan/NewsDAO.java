package kr.ac.shinhan;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository // 데이터 접근 계층(DAO, Data Access Object)을 나타냄
public class NewsDAO {
	@Autowired // 의존성 주입(Dependency Injection, DI)을 자동으로
	private JdbcTemplate jdbcTemplate;
	
	public List<News> getAll() {
		// String sql = "SELECT aid, title, date AS cdate FROM news";
		String sql = "SELECT aid, title, img, date, content FROM news"; // content 추가
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(News.class));
	}
	
	public News getNews(int aid) {
		String sql = "SELECT aid, title, img, date, content FROM news WHERE aid = ?";
		try { // REST API 오류 처리를 위해 예외 추가
			return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(News.class), aid);
		} catch (EmptyResultDataAccessException e) {
			// 결과가 없을 경우 null 반환
			return null;
		}
	}
	
	public void addNews(News n) {
		String sql = "INSERT INTO news(title, img, content) VALUES (?, ?, ?)";
		jdbcTemplate.update(sql, n.getTitle(), n.getImg(), n.getContent());
	}
	
	public void delNews(int aid) {
		String sql = "DELETE FROM news WHERE aid = ?";
		int result = jdbcTemplate.update(sql, aid);
		
		if (result == 0) {
			throw new RuntimeException("삭제 실패: 해당 뉴스가 존재하지 않습니다.");
		}
	}
}