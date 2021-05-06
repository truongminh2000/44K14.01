package phin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import phin.dao.FeedBackDAO;
import phin.models.FeedBack;

@Service
public class FeedBackService implements ICRUDService<FeedBack> {
	
	@Autowired
	private FeedBackDAO feedBackDAO;
	
	@Override
	public List<FeedBack> getAll() {
		return feedBackDAO.getAll();
	}

	@Override
	public List<FeedBack> getAll(int offset, int rowCount) {
		return feedBackDAO.getAll(offset, rowCount);
	}

	@Override
	public int update(FeedBack t) {
		return feedBackDAO.update(t);
	}

	@Override
	public int save(FeedBack t) {
		return feedBackDAO.save(t);
	}

	@Override
	public int del(int id) {
		return feedBackDAO.del(id);
	}

	@Override
	public List<FeedBack> findByName(String searchStr) {
		return feedBackDAO.findByName(searchStr);
	}

	@Override
	public FeedBack findById(int id) {
		return feedBackDAO.findById(id);
	}

	@Override
	public int totalRow() {
		return feedBackDAO.totalRow();
	} 

}
