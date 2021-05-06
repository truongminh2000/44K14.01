package phin.service;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import phin.dao.PostDAO;
import phin.models.Post;

@Service
public class PostService implements ICRUDService<Post> {
	
	@Autowired
	private PostDAO postDAO;
	
	@Override
	public List<Post> getAll() {
		return postDAO.getAll();
	}

	@Override
	public List<Post> getAll(int offset, int rowCount) {
		return postDAO.getAll(offset, rowCount);
	}
	
	public List<Post> getAllUser(String username) {
		return postDAO.getAllUser(username);
	}

	@Override
	public int update(Post t) {
		return postDAO.update(t);
	}

	@Override
	public int save(Post t) {
		return postDAO.save(t);
	}

	@Override
	public int del(int id) {
		return postDAO.del(id);
	}

	@Override
	public List<Post> findByName(String searchStr) {
		return postDAO.findByName(searchStr);
	}

	@Override
	public Post findById(int id) {
		return postDAO.findById(id);
	}

	@Override
	public int totalRow() {
		return postDAO.totalRow();
	}
	
	public int totalRowUser(String username) {
		return postDAO.totalRowUser(username);
	}
	
	public int totalRowPublic() {
		return postDAO.totalRowPublic();
	}
	
	public int totalRowDistrict(int did) {
		return postDAO.totalRowDistrict(did);
	}
	
	public List<Post> getByName(String pname) {
		return postDAO.getByName(pname);
	}
	
	public List<Post> getPostDistrict(int did, int offset, int rowCount) {
		return postDAO.getPostDistrict(did, offset, rowCount);
	}
	
	public List<Post> getPostUniversity(Map<Integer, Integer> map) {
		return postDAO.getPostUniversity(map);
	}
	
	public List<Post> search(int wid, Map<Integer, Integer> map) {
		return postDAO.search(wid, map);
	}
	
	public List<Post> search(int wid) {
		return postDAO.search(wid);
	}
	
	public List<Post> search(Map<Integer, Integer> map) {
		return postDAO.search(map);
	}
	
	public int up(int id) {
		return postDAO.up(id);
	}
	
	public int cancel(int id) {
		return postDAO.cancel(id);
	}
	
	public List<Post> getAllPublic(int offset, int rowCount) {
		return postDAO.getAllPublic(offset, rowCount);
	}
	
	public List<Post> statisticPost(Date datebegin) {
		return postDAO.statisticPost(datebegin);
	}
	
	public List<Post> statisticPost(Date datebegin, Date dateend) {
		return postDAO.statisticPost(datebegin, dateend);
	}
}
