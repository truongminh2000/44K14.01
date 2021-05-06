package phin.dao;

import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import phin.models.User;

@Repository
public class UserDAO extends AbstractDAO<User> {
	
	@Override
	public List<User> getAll() {
		final String SQL = "SELECT * FROM users ORDER BY id DESC";
		return jdbcTemplate.query(SQL, new BeanPropertyRowMapper<>(User.class));
	}
	
	@Override
	public List<User> getAll(int offset, int rowCount) {
		final String SQL = "SELECT * FROM users ORDER BY id DESC LIMIT ?,?";
		return jdbcTemplate.query(SQL, new BeanPropertyRowMapper<>(User.class), offset, rowCount);
	}
	
	@Override
	public List<User> findByName(String searchStr) {
		final String SQL = "SELECT * FROM users WHERE username LIKE '%"+searchStr+"%' LIMIT 5";
		return jdbcTemplate.query(SQL, new BeanPropertyRowMapper<>(User.class));
	}
	
	public int totalRow() {
		final String SQL = "SELECT count(*) AS total FROM users";
		return jdbcTemplate.queryForObject(SQL, Integer.class);
	}
	
	@Override
	public int save(User t) {
		final String SQL = "INSERT INTO users (username, fullname, password) VALUES (?, ?, ?)";
		return jdbcTemplate.update(SQL, t.getUsername(), t.getFullname(), t.getPassword());
	}
	
	@Override
	public User findById(int id) {
		final String SQL = "SELECT * FROM users WHERE id = ?";
		return jdbcTemplate.queryForObject(SQL, new BeanPropertyRowMapper<>(User.class), id);
	}
	
	@Override
	public int del(int id) {
		final String SQL = "DELETE FROM users WHERE id = ?";
		return jdbcTemplate.update(SQL, id);
	}
	
	@Override
	public int update(User t) {
		final String SQL = "UPDATE users SET username = ?, fullname = ?, password = ? WHERE id = ?";
		return jdbcTemplate.update(SQL, t.getUsername(), t.getFullname(), t.getPassword(), t.getId());
	}
	
	public List<User> getByName(String username) {
		final String SQL = "SELECT * FROM users WHERE username LIKE '"+username+"'";
		return jdbcTemplate.query(SQL, new BeanPropertyRowMapper<>(User.class));
	}
	
	public User login(String username) {
		final String SQL = "SELECT * FROM users WHERE username = ?";
		return jdbcTemplate.queryForObject(SQL, new BeanPropertyRowMapper<>(User.class), username);
	}
}
