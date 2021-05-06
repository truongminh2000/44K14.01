package phin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import phin.dao.GuideDAO;
import phin.models.Guide;

@Service
public class GuideService implements ICRUDService<Guide> {
	
	@Autowired
	private GuideDAO guideDAO;
	
	@Override
	public List<Guide> getAll() {
		return guideDAO.getAll();
	}

	@Override
	public List<Guide> getAll(int offset, int rowCount) {
		return guideDAO.getAll(offset, rowCount);
	}

	@Override
	public int update(Guide t) {
		return guideDAO.update(t);
	}

	@Override
	public int save(Guide t) {
		return guideDAO.save(t);
	}

	@Override
	public int del(int id) {
		return guideDAO.del(id);
	}

	@Override
	public List<Guide> findByName(String searchStr) {
		return guideDAO.findByName(searchStr);
	}

	@Override
	public Guide findById(int id) {
		return guideDAO.findById(id);
	}

	@Override
	public int totalRow() {
		return guideDAO.totalRow();
	}
	
	public List<Guide> getByName(String gname) {
		return guideDAO.getByName(gname);
	}
}
