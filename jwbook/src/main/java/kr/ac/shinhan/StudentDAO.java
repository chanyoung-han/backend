package kr.ac.shinhan;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class StudentDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public void insert(Student s) {
		String sql = "INSERT INTO student(username, univ, birth, email, tel) VALUES(?,?,?,?,?)";
		jdbcTemplate.update(sql, s.getUsername(), s.getUniv(), s.getBirth(), s.getEmail(), s.getTel() != null ? s.getTel() : "" );
	}
	
	public List<Student> getAll() {
		String sql = "SELECT * FROM student";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Student.class) );
	}
	
	public Student getById(int id) {
		String sql = "SELECT * FROM student WHERE id = ?";
		return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(Student.class), id );
	}
	
	public void update(Student s) {
		String sql = "UPDATE student SET username=?, univ=?, birth=?, email=?, tel=? WHERE id=?";
		jdbcTemplate.update(sql, s.getUsername(), s.getUniv(), s.getBirth(), s.getEmail(), s.getTel(), s.getId() );
	}
	
	public void delete(int id) {
		String sql = "DELETE FROM student WHERE id=?";
		jdbcTemplate.update(sql, id);
	}
}