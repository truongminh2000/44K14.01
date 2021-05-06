package phin.dao;

import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import phin.models.Guide;

@Repository
public class GuideDAO extends AbstractDAO<Guide> {
	
	@Override
	public List<Guide> getAll() {
		final String SQL = "SELECT * FROM guides ORDER BY gid DESC";
		return jdbcTemplate.query(SQL, new BeanPropertyRowMapper<>(Guide.class));
	}
	
	@Override
	public List<Guide> getAll(int offset, int rowCount) {
		final String SQL = "SELECT * FROM guides ORDER BY gid DESC LIMIT ?,?";
		return jdbcTemplate.query(SQL, new BeanPropertyRowMapper<>(Guide.class), offset, rowCount);
	}
	
	@Override
	public List<Guide> findByName(String searchStr) {
		final String SQL = "SELECT * FROM guides WHERE gname LIKE '%"+searchStr+"%' LIMIT 5";
		return jdbcTemplate.query(SQL, new BeanPropertyRowMapper<>(Guide.class));
	}
	
	public int totalRow() {
		final String SQL = "SELECT count(*) AS total FROM guides";
		return jdbcTemplate.queryForObject(SQL, Integer.class);
	}
	
	@Override
	public int save(Guide t) {
		final String SQL = "INSERT INTO guides (gname, content) VALUES (?, ?)";
		return jdbcTemplate.update(SQL, t.getGname(), t.getContent());
	}
	
	@Override
	public Guide findById(int id) {
		final String SQL = "SELECT * FROM guides WHERE gid = ?";
		return jdbcTemplate.queryForObject(SQL, new BeanPropertyRowMapper<>(Guide.class), id);
	}
	
	@Override
	public int del(int id) {
		final String SQL = "DELETE FROM guides WHERE gid = ?";
		return jdbcTemplate.update(SQL, id);
	}
	
	@Override
	public int update(Guide t) {
		final String SQL = "UPDATE guides SET gname = ?, content = ? WHERE gid = ?";
		return jdbcTemplate.update(SQL, t.getGname(), t.getContent(), t.getGid());
	}
	public List<Guide> getByName(String gname) {
		final String SQL = "SELECT * FROM guides WHERE gname LIKE '"+gname+"'";
		return jdbcTemplate.query(SQL, new BeanPropertyRowMapper<>(Guide.class));
	}
}
