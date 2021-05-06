package phin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import phin.dao.UserDAO;
import phin.models.User;

@Service
public class UserService implements ICRUDService<User> {
	
	@Autowired
	private UserDAO userDAO;

	@Override
	public List<User> getAll() {
		return userDAO.getAll();
	}
	
	@Override
	public List<User> getAll(int offset, int rowCount) {
		return userDAO.getAll(offset, rowCount);
	}

	@Override
	public int update(User t) {
		return userDAO.update(t);
	}

	@Override
	public int save(User t) {
		return userDAO.save(t);
	}

	@Override
	public int del(int id) {
		return userDAO.del(id);
	}

	@Override
	public List<User> findByName(String searchStr) {
		return userDAO.findByName(searchStr);
	}

	@Override
	public User findById(int id) {
		return userDAO.findById(id);
	}
	
	public int totalRow() {
		return userDAO.totalRow();
	}
	
	public List<User> getByName(String username) {
		return userDAO.getByName(username);
	}
	
	public User login(String username) {
		return userDAO.login(username);
	}
}
