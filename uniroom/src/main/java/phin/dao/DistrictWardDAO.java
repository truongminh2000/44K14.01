package phin.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import phin.models.District;
import phin.models.University;
import phin.models.Ward;

@Repository
public class DistrictWardDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<District> getDistrictList() {
		final String SQL = "SELECT * FROM districts ORDER BY did ASC";
		return jdbcTemplate.query(SQL, new BeanPropertyRowMapper<>(District.class));
	}
	
	public List<Ward> getWardList(int did) {
		final String SQL = "SELECT * FROM wards WHERE did = ? ORDER BY wid ASC";
		return jdbcTemplate.query(SQL, new BeanPropertyRowMapper<>(Ward.class), did);
	}
	
	public List<University> getUniList() {
		final String SQL = "SELECT * FROM universities ORDER BY uid ASC";
		return jdbcTemplate.query(SQL, new BeanPropertyRowMapper<>(University.class));
	}
	
	public District findDistrictById(int id) {
		String SQL = "SELECT * FROM districts WHERE did = ?";
		return jdbcTemplate.queryForObject(SQL, new BeanPropertyRowMapper<>(District.class), id);
	}
	
	public University findUniversityById(int id) {
		String SQL = "SELECT * FROM universities WHERE uid = ?";
		return jdbcTemplate.queryForObject(SQL, new BeanPropertyRowMapper<>(University.class), id);
	}
}
