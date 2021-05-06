package phin.dao;

import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import phin.models.FeedBack;

@Repository
public class FeedBackDAO extends AbstractDAO<FeedBack> {
	
	@Override
	public List<FeedBack> getAll() {
		String SQL = "SELECT * FROM feedback ORDER BY fid DESC";
		return jdbcTemplate.query(SQL, new BeanPropertyRowMapper<>(FeedBack.class));
	}
	
	@Override
	public List<FeedBack> getAll(int offset, int rowCount) {
		final String SQL = "SELECT * FROM feedback ORDER BY fid DESC LIMIT ?,?";
		return jdbcTemplate.query(SQL, new BeanPropertyRowMapper<>(FeedBack.class), offset, rowCount);
	}
	
	@Override
	public List<FeedBack> findByName(String searchStr) {
		final String SQL = "SELECT * FROM feedback WHERE fullname LIKE '%"+searchStr+"%' LIMIT 5";
		return jdbcTemplate.query(SQL, new BeanPropertyRowMapper<>(FeedBack.class));
	}
	
	public int totalRow() {
		final String SQL = "SELECT count(*) AS total FROM feedback";
		return jdbcTemplate.queryForObject(SQL, Integer.class);
	}
	
	@Override
	public int save(FeedBack t) {
		String SQL = "INSERT INTO feedback (fullname, email, subject, content) VALUES (?, ?, ?, ?)";
		return jdbcTemplate.update(SQL, t.getFullname(), t.getEmail(), t.getSubject(), t.getContent());
	}
	
	@Override
	public int del(int id) {
		String SQL = "DELETE FROM feedback WHERE fid = ?";
		return jdbcTemplate.update(SQL, id);
	}
	
	@Override
	public FeedBack findById(int id) {
		String SQL = "SELECT * FROM feedback WHERE fid = ?";
		return jdbcTemplate.queryForObject(SQL, new BeanPropertyRowMapper<>(FeedBack.class), id);
	}
	
	@Override
	public int update(FeedBack t) {
		String SQL = "UPDATE feedback SET fullname = ?, email = ?, subject = ?, content = ? WHERE fid = ?";
		return jdbcTemplate.update(SQL, t.getFullname(), t.getEmail(), t.getSubject(), t.getContent(), t.getFid());
	}
}
