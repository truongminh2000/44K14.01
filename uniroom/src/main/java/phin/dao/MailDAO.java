package phin.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import phin.models.Mail;

@Repository
public class MailDAO {
	
	@Autowired
	public JdbcTemplate jdbcTemplate;
	
	public int save(Mail mail) {
		final String SQL = "INSERT INTO mails (email, did) VALUES (?, ?)";
		return jdbcTemplate.update(SQL, mail.getEmail(), mail.getDid());
	}
	
	public List<Mail> getAll() {
		final String SQL = "SELECT * FROM mails ORDER BY id ASC";
		return jdbcTemplate.query(SQL, new BeanPropertyRowMapper<>(Mail.class));
	}
	
	public int signup(Mail mail) {
		final String SQL = "SELECT COUNT(*) FROM mails WHERE email = ? and did = ?";
		return jdbcTemplate.queryForObject(SQL, Integer.class, mail.getEmail(), mail.getDid());
	}
}
