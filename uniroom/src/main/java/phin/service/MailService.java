package phin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import phin.dao.MailDAO;
import phin.models.Mail;

@Service
public class MailService {
	
	@Autowired
	private MailDAO mailDAO;
	
	public int save(Mail mail) {
		return mailDAO.save(mail);
	}
	
	public List<Mail> getAll() {
		return mailDAO.getAll();
	}
	
	public int singup(Mail mail) {
		return mailDAO.signup(mail);
	}
}
