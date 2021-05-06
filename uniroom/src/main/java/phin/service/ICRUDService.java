package phin.service;

import java.util.List;

							//Generic
public interface ICRUDService<T> {
	
	List<T> getAll();
	
	List<T> getAll(int offset, int rowCount);
	
	int update(T t);
	
	int save(T t);
	
	int del(int id);
	
	List<T> findByName(String searchStr);
	
	T findById(int id);
	
	int totalRow();
}
