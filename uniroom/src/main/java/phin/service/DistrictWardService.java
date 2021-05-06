package phin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import phin.dao.DistrictWardDAO;
import phin.models.District;
import phin.models.University;
import phin.models.Ward;

@Service
public class DistrictWardService {
	
	@Autowired
	private DistrictWardDAO districtWardDAO;
	
	public List<District> getDistrictList() {
		return districtWardDAO.getDistrictList();
	}
	
	public List<University> getUniList() {
		return districtWardDAO.getUniList();
	}
	
	public List<Ward> getWardList(int did) {
		return districtWardDAO.getWardList(did);
	}
	
	public District findDistrictById(int id) {
		return districtWardDAO.findDistrictById(id);
	}
	
	public University findUniversityById(int id) {
		return districtWardDAO.findUniversityById(id);
	}
}
