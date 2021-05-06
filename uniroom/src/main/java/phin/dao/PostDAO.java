package phin.dao;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Repository;

import phin.models.District;
import phin.models.Post;
import phin.models.Ward;

@Repository
public class PostDAO extends AbstractDAO<Post> {
	
	@Override
	public List<Post> getAll() {
		final String SQL = "SELECT pid, pname, username, description, date_create AS dateCreate, "
				+ "area, picture, status, add_detail AS addDetail, price, p.wid, wname, w.did, dname "
				+ "FROM posts p INNER JOIN wards w ON p.wid = w.wid "
				+ "INNER JOIN districts d ON w.did = d.did "
				+ "ORDER BY pid DESC ";
		return jdbcTemplate.query(SQL, new ResultSetExtractor<List<Post>>() {
			  List<Post> listPost = new ArrayList<>();
			  @Override
			  public List<Post> extractData(ResultSet rs) throws SQLException, DataAccessException {
				  try {
					  while (rs.next()) {
						  listPost.add(new Post(rs.getInt("pid"), 
								  rs.getString("pname"), 
								  rs.getString("username"), 
								  rs.getString("description"), 
								  rs.getTimestamp("dateCreate"), 
								  rs.getInt("area"), 
								  rs.getString("picture"), 
								  rs.getInt("status"), 
								  rs.getString("addDetail"), 
								  rs.getInt("price"), 
								  new Ward(rs.getInt("wid"), rs.getString("wname"), rs.getInt("did")), 
								  new District(rs.getInt("did"), rs.getString("dname"))));
					  }
				  } catch (Exception e) {
						e.printStackTrace();
				  }
				  return listPost;
			  }
		  });
	}
	
	public List<Post> getAllPublic(int offset, int rowCount) {
		final String SQL = "SELECT pid, pname, username, description, date_create AS dateCreate, "
				+ "area, picture, status, add_detail AS addDetail, price, p.wid, wname, w.did, dname "
				+ "FROM posts p INNER JOIN wards w ON p.wid = w.wid "
				+ "INNER JOIN districts d ON w.did = d.did "
				+ "WHERE status = 1 "
				+ "ORDER BY pid DESC "
				+ "LIMIT ?,?";
		return jdbcTemplate.query(SQL, new ResultSetExtractor<List<Post>>() {
			  List<Post> listPost = new ArrayList<>();
			  @Override
			  public List<Post> extractData(ResultSet rs) throws SQLException, DataAccessException {
				  try {
					  while (rs.next()) {
						  listPost.add(new Post(rs.getInt("pid"), 
								  rs.getString("pname"), 
								  rs.getString("username"), 
								  rs.getString("description"), 
								  rs.getTimestamp("dateCreate"), 
								  rs.getInt("area"), 
								  rs.getString("picture"), 
								  rs.getInt("status"), 
								  rs.getString("addDetail"), 
								  rs.getInt("price"), 
								  new Ward(rs.getInt("wid"), rs.getString("wname"), rs.getInt("did")), 
								  new District(rs.getInt("did"), rs.getString("dname"))));
					  }
				  } catch (Exception e) {
						e.printStackTrace();
				  }
				  return listPost;
			  }
		  }, offset, rowCount);
	}
	
	@Override
	public List<Post> getAll(int offset, int rowCount) {
		final String SQL = "SELECT pid, pname, username, description, date_create AS dateCreate, "
				+ "area, picture, status, add_detail AS addDetail, price, p.wid, wname, w.did, dname "
				+ "FROM posts p INNER JOIN wards w ON p.wid = w.wid "
				+ "INNER JOIN districts d ON w.did = d.did "
				+ "ORDER BY pid DESC "
				+ "LIMIT ?,?";
		return jdbcTemplate.query(SQL, new ResultSetExtractor<List<Post>>() {
			  List<Post> listPost = new ArrayList<>();
			  @Override
			  public List<Post> extractData(ResultSet rs) throws SQLException, DataAccessException {
				  try {
					  while (rs.next()) {
						  listPost.add(new Post(rs.getInt("pid"), 
								  rs.getString("pname"), 
								  rs.getString("username"), 
								  rs.getString("description"), 
								  rs.getTimestamp("dateCreate"), 
								  rs.getInt("area"), 
								  rs.getString("picture"), 
								  rs.getInt("status"), 
								  rs.getString("addDetail"), 
								  rs.getInt("price"), 
								  new Ward(rs.getInt("wid"), rs.getString("wname"), rs.getInt("did")), 
								  new District(rs.getInt("did"), rs.getString("dname"))));
					  }
				  } catch (Exception e) {
						e.printStackTrace();
				  }
				  return listPost;
			  }
		  }, offset, rowCount);
	}
	
	public List<Post> getAllUser(String username) {
		final String SQL = "SELECT pid, pname, username, description, date_create AS dateCreate, "
				+ "area, picture, status, add_detail AS addDetail, price, p.wid, wname, w.did, dname "
				+ "FROM posts p INNER JOIN wards w ON p.wid = w.wid "
				+ "INNER JOIN districts d ON w.did = d.did "
				+ "WHERE username = ? "
				+ "ORDER BY pid DESC ";
		return jdbcTemplate.query(SQL, new ResultSetExtractor<List<Post>>() {
			  List<Post> listPost = new ArrayList<>();
			  @Override
			  public List<Post> extractData(ResultSet rs) throws SQLException, DataAccessException {
				  try {
					  while (rs.next()) {
						  listPost.add(new Post(rs.getInt("pid"), 
								  rs.getString("pname"), 
								  rs.getString("username"), 
								  rs.getString("description"), 
								  rs.getTimestamp("dateCreate"), 
								  rs.getInt("area"), 
								  rs.getString("picture"), 
								  rs.getInt("status"), 
								  rs.getString("addDetail"), 
								  rs.getInt("price"), 
								  new Ward(rs.getInt("wid"), rs.getString("wname"), rs.getInt("did")), 
								  new District(rs.getInt("did"), rs.getString("dname"))));
					  }
				  } catch (Exception e) {
						e.printStackTrace();
				  }
				  return listPost;
			  }
		  }, username);
	}
	
	@Override
	public List<Post> findByName(String searchStr) {
		final String SQL = "SELECT pid, pname, username, description, date_create AS dateCreate, "
				+ "area, picture, status, add_detail AS addDetail, price, p.wid, wname, w.did, dname "
				+ "FROM posts p INNER JOIN wards w ON p.wid = w.wid "
				+ "INNER JOIN districts d ON w.did = d.did "
				+ "WHERE pname LIKE '%"+searchStr+"%' LIMIT 5";
		return jdbcTemplate.query(SQL, new ResultSetExtractor<List<Post>>() {
			  List<Post> listPost = new ArrayList<>();
			  @Override
			  public List<Post> extractData(ResultSet rs) throws SQLException, DataAccessException {
				  try {
					  while (rs.next()) {
						  listPost.add(new Post(rs.getInt("pid"), 
								  rs.getString("pname"), 
								  rs.getString("username"), 
								  rs.getString("description"), 
								  rs.getTimestamp("dateCreate"), 
								  rs.getInt("area"), 
								  rs.getString("picture"), 
								  rs.getInt("status"), 
								  rs.getString("addDetail"), 
								  rs.getInt("price"), 
								  new Ward(rs.getInt("wid"), rs.getString("wname"), rs.getInt("did")), 
								  new District(rs.getInt("did"), rs.getString("dname"))));
					  }
				  } catch (Exception e) {
						e.printStackTrace();
				  }
				  return listPost;
			  }
		  });
	}
	
	@Override
	public int totalRow() {
		final String SQL = "SELECT count(*) AS total FROM posts";
		return jdbcTemplate.queryForObject(SQL, Integer.class);
	}
	
	public int totalRowUser(String username) {
		final String SQL = "SELECT count(*) AS total FROM posts WHERE username = ?";
		return jdbcTemplate.queryForObject(SQL, Integer.class, username);
	}
	
	public int totalRowPublic() {
		final String SQL = "SELECT count(*) AS total FROM posts WHERE status = 1";
		return jdbcTemplate.queryForObject(SQL, Integer.class);
	}
	
	public int totalRowDistrict(int did) {
		final String SQL = "SELECT count(*) AS total "
				+ "FROM posts p INNER JOIN wards w ON p.wid = w.wid "
				+ "WHERE w.did = ? and status = 1";
		return jdbcTemplate.queryForObject(SQL, Integer.class, did);
	}
	
	@Override
	public int save(Post t) {
		final String SQL = "INSERT INTO posts (pname, username, description, area, picture, add_detail, price, wid) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
		return jdbcTemplate.update(SQL, t.getPname(), t.getUsername(), t.getDescription(), t.getArea(), t.getPicture(), 
				t.getAddDetail(), t.getPrice(), t.getWard().getWid());
	}
	
	@Override
	public Post findById(int id) {
		final String SQL = "SELECT pid, pname, username, description, date_create AS dateCreate, "
				+ "area, picture, status, add_detail AS addDetail, price, p.wid, wname, w.did, dname "
				+ "FROM posts p INNER JOIN wards w ON p.wid = w.wid "
				+ "INNER JOIN districts d ON w.did = d.did "
				+ "WHERE pid = ?";
		return jdbcTemplate.query(SQL, new ResultSetExtractor<Post>() {
			  Post post = null;
			  @Override
			  public Post extractData(ResultSet rs) throws SQLException, DataAccessException {
				  try {
					  if (rs.next()) {
						  post = new Post(rs.getInt("pid"), 
								  rs.getString("pname"), 
								  rs.getString("username"), 
								  rs.getString("description"), 
								  rs.getTimestamp("dateCreate"), 
								  rs.getInt("area"), 
								  rs.getString("picture"), 
								  rs.getInt("status"), 
								  rs.getString("addDetail"), 
								  rs.getInt("price"), 
								  new Ward(rs.getInt("wid"), rs.getString("wname"), rs.getInt("did")), 
								  new District(rs.getInt("did"), rs.getString("dname")));
					  }
				  } catch (Exception e) {
						e.printStackTrace();
				  }
				  return post;
			  }
		  }, id);
	}
	
	public Post findByIdPublic(int id) {
		final String SQL = "SELECT pid, pname, username, description, date_create AS dateCreate, "
				+ "area, picture, status, add_detail AS addDetail, price, p.wid, wname, w.did, dname "
				+ "FROM posts p INNER JOIN wards w ON p.wid = w.wid "
				+ "INNER JOIN districts d ON w.did = d.did "
				+ "WHERE pid = ? AND status = 1";
		return jdbcTemplate.query(SQL, new ResultSetExtractor<Post>() {
			  Post post = null;
			  @Override
			  public Post extractData(ResultSet rs) throws SQLException, DataAccessException {
				  try {
					  if (rs.next()) {
						  post = new Post(rs.getInt("pid"), 
								  rs.getString("pname"), 
								  rs.getString("username"), 
								  rs.getString("description"), 
								  rs.getTimestamp("dateCreate"), 
								  rs.getInt("area"), 
								  rs.getString("picture"), 
								  rs.getInt("status"), 
								  rs.getString("addDetail"), 
								  rs.getInt("price"), 
								  new Ward(rs.getInt("wid"), rs.getString("wname"), rs.getInt("did")), 
								  new District(rs.getInt("did"), rs.getString("dname")));
					  }
				  } catch (Exception e) {
						e.printStackTrace();
				  }
				  return post;
			  }
		  }, id);
	}
	
	@Override
	public int del(int id) {
		final String SQL = "DELETE FROM posts WHERE pid = ?";
		return jdbcTemplate.update(SQL, id);
	}
	
	@Override
	public int update(Post t) {
		final String SQL = "UPDATE posts SET pname = ?, username = ?, description = ?, area = ?, "
				+ "picture = ?, add_detail = ?, price = ?, wid = ? "
				+ "WHERE pid = ?";
		return jdbcTemplate.update(SQL, t.getPname(), t.getUsername(), t.getDescription(), t.getArea(), t.getPicture(), 
				t.getAddDetail(), t.getPrice(), t.getWard().getWid(), t.getPid());
	}
	
	public List<Post> getByName(String pname) {
		final String SQL = "SELECT pid, pname, username, description, date_create AS dateCreate, "
				+ "area, picture, status, add_detail AS addDetail, price, p.wid, wname, w.did, dname "
				+ "FROM posts p INNER JOIN wards w ON p.wid = w.wid "
				+ "INNER JOIN districts d ON w.did = d.did "
				+ "WHERE pname LIKE '"+pname+"'";
		return jdbcTemplate.query(SQL, new ResultSetExtractor<List<Post>>() {
			  List<Post> listPost = new ArrayList<>();
			  @Override
			  public List<Post> extractData(ResultSet rs) throws SQLException, DataAccessException {
				  try {
					  while (rs.next()) {
						  listPost.add(new Post(rs.getInt("pid"), 
								  rs.getString("pname"), 
								  rs.getString("username"), 
								  rs.getString("description"), 
								  rs.getTimestamp("dateCreate"), 
								  rs.getInt("area"), 
								  rs.getString("picture"), 
								  rs.getInt("status"), 
								  rs.getString("addDetail"), 
								  rs.getInt("price"), 
								  new Ward(rs.getInt("wid"), rs.getString("wname"), rs.getInt("did")), 
								  new District(rs.getInt("did"), rs.getString("dname"))));
					  }
				  } catch (Exception e) {
						e.printStackTrace();
				  }
				  return listPost;
			  }
		  });
	}
	
	public List<Post> getPostDistrict(int did, int offset, int rowCount) {
		final String SQL = "SELECT pid, pname, username, description, date_create AS dateCreate, "
				+ "area, picture, status, add_detail AS addDetail, price, p.wid, wname, w.did, dname "
				+ "FROM posts p INNER JOIN wards w ON p.wid = w.wid "
				+ "INNER JOIN districts d ON w.did = d.did "
				+ "WHERE d.did = ? and status = 1 "
				+ "ORDER BY pid DESC "
				+ "LIMIT ?,?";
		return jdbcTemplate.query(SQL, new ResultSetExtractor<List<Post>>() {
			  List<Post> listPost = new ArrayList<>();
			  @Override
			  public List<Post> extractData(ResultSet rs) throws SQLException, DataAccessException {
				  try {
					  while (rs.next()) {
						  listPost.add(new Post(rs.getInt("pid"), 
								  rs.getString("pname"), 
								  rs.getString("username"), 
								  rs.getString("description"), 
								  rs.getTimestamp("dateCreate"), 
								  rs.getInt("area"), 
								  rs.getString("picture"), 
								  rs.getInt("status"), 
								  rs.getString("addDetail"), 
								  rs.getInt("price"), 
								  new Ward(rs.getInt("wid"), rs.getString("wname"), rs.getInt("did")), 
								  new District(rs.getInt("did"), rs.getString("dname"))));
					  }
				  } catch (Exception e) {
						e.printStackTrace();
				  }
				  return listPost;
			  }
		  }, did, offset, rowCount);
	}
	
	public List<Post> search(int wid, Map<Integer, Integer> map) {
		final String SQL = "SELECT pid, pname, username, description, date_create AS dateCreate, "
				+ "area, picture, status, add_detail AS addDetail, price, p.wid, wname, w.did, dname "
				+ "FROM posts p INNER JOIN wards w ON p.wid = w.wid "
				+ "INNER JOIN districts d ON w.did = d.did "
				+ "WHERE p.wid = ? and price >= ? and price <= ? and status = 1 "
				+ "LIMIT 10";
		return jdbcTemplate.query(SQL, new ResultSetExtractor<List<Post>>() {
			  List<Post> listPost = new ArrayList<>();
			  @Override
			  public List<Post> extractData(ResultSet rs) throws SQLException, DataAccessException {
				  try {
					  while (rs.next()) {
						  listPost.add(new Post(rs.getInt("pid"), 
								  rs.getString("pname"), 
								  rs.getString("username"), 
								  rs.getString("description"), 
								  rs.getTimestamp("dateCreate"), 
								  rs.getInt("area"), 
								  rs.getString("picture"), 
								  rs.getInt("status"), 
								  rs.getString("addDetail"), 
								  rs.getInt("price"), 
								  new Ward(rs.getInt("wid"), rs.getString("wname"), rs.getInt("did")), 
								  new District(rs.getInt("did"), rs.getString("dname"))));
					  }
				  } catch (Exception e) {
						e.printStackTrace();
				  }
				  return listPost;
			  }
		  }, wid, map.get(0), map.get(1));
	}
	
	public List<Post> search(int wid) {
		final String SQL = "SELECT pid, pname, username, description, date_create AS dateCreate, "
				+ "area, picture, status, add_detail AS addDetail, price, p.wid, wname, w.did, dname "
				+ "FROM posts p INNER JOIN wards w ON p.wid = w.wid "
				+ "INNER JOIN districts d ON w.did = d.did "
				+ "WHERE p.wid = ? and status = 1 "
				+ " LIMIT 10";
		return jdbcTemplate.query(SQL, new ResultSetExtractor<List<Post>>() {
			  List<Post> listPost = new ArrayList<>();
			  @Override
			  public List<Post> extractData(ResultSet rs) throws SQLException, DataAccessException {
				  try {
					  while (rs.next()) {
						  listPost.add(new Post(rs.getInt("pid"), 
								  rs.getString("pname"), 
								  rs.getString("username"), 
								  rs.getString("description"), 
								  rs.getTimestamp("dateCreate"), 
								  rs.getInt("area"), 
								  rs.getString("picture"), 
								  rs.getInt("status"), 
								  rs.getString("addDetail"), 
								  rs.getInt("price"), 
								  new Ward(rs.getInt("wid"), rs.getString("wname"), rs.getInt("did")), 
								  new District(rs.getInt("did"), rs.getString("dname"))));
					  }
				  } catch (Exception e) {
						e.printStackTrace();
				  }
				  return listPost;
			  }
		  }, wid);
	}
	
	public List<Post> search(Map<Integer, Integer> map) {
		final String SQL = "SELECT pid, pname, username, description, date_create AS dateCreate, "
				+ "area, picture, status, add_detail AS addDetail, price, p.wid, wname, w.did, dname "
				+ "FROM posts p INNER JOIN wards w ON p.wid = w.wid "
				+ "INNER JOIN districts d ON w.did = d.did "
				+ "WHERE price >= ? and price <= ? and status = 1 "
				+ "LIMIT 10";
		return jdbcTemplate.query(SQL, new ResultSetExtractor<List<Post>>() {
			  List<Post> listPost = new ArrayList<>();
			  @Override
			  public List<Post> extractData(ResultSet rs) throws SQLException, DataAccessException {
				  try {
					  while (rs.next()) {
						  listPost.add(new Post(rs.getInt("pid"), 
								  rs.getString("pname"), 
								  rs.getString("username"), 
								  rs.getString("description"), 
								  rs.getTimestamp("dateCreate"), 
								  rs.getInt("area"), 
								  rs.getString("picture"), 
								  rs.getInt("status"), 
								  rs.getString("addDetail"), 
								  rs.getInt("price"), 
								  new Ward(rs.getInt("wid"), rs.getString("wname"), rs.getInt("did")), 
								  new District(rs.getInt("did"), rs.getString("dname"))));
					  }
				  } catch (Exception e) {
						e.printStackTrace();
				  }
				  return listPost;
			  }
		  }, map.get(0), map.get(1));
	}
	
	public int up(int id) {
		final String SQL = "UPDATE posts SET status = 1 WHERE pid = ?";
		return jdbcTemplate.update(SQL, id);
	}
	
	public int cancel(int id) {
		final String SQL = "UPDATE posts SET status = 0 WHERE pid = ?";
		return jdbcTemplate.update(SQL, id);
	}
	
	public List<Post> getPostUniversity(Map<Integer, Integer> map) {
		final String SQL = "SELECT pid, pname, username, description, date_create AS dateCreate, "
				+ "area, picture, status, add_detail AS addDetail, price, p.wid, wname, w.did, dname "
				+ "FROM posts p INNER JOIN wards w ON p.wid = w.wid "
				+ "INNER JOIN districts d ON w.did = d.did "
				+ "WHERE d.did = ? OR d.did = ? and status = 1 "
				+ "ORDER BY pid DESC "
				+ "LIMIT 10";
		return jdbcTemplate.query(SQL, new ResultSetExtractor<List<Post>>() {
			  List<Post> listPost = new ArrayList<>();
			  @Override
			  public List<Post> extractData(ResultSet rs) throws SQLException, DataAccessException {
				  try {
					  while (rs.next()) {
						  listPost.add(new Post(rs.getInt("pid"), 
								  rs.getString("pname"), 
								  rs.getString("username"), 
								  rs.getString("description"), 
								  rs.getTimestamp("dateCreate"), 
								  rs.getInt("area"), 
								  rs.getString("picture"), 
								  rs.getInt("status"), 
								  rs.getString("addDetail"), 
								  rs.getInt("price"), 
								  new Ward(rs.getInt("wid"), rs.getString("wname"), rs.getInt("did")), 
								  new District(rs.getInt("did"), rs.getString("dname"))));
					  }
				  } catch (Exception e) {
						e.printStackTrace();
				  }
				  return listPost;
			  }
		  }, map.get(0), map.get(1));
	}
	
	public List<Post> statisticPost(Date datebegin) {
		final String SQL = "SELECT pid, pname, username, description, date_create AS dateCreate, "
				+ "area, picture, status, add_detail AS addDetail, price, p.wid, wname, w.did, dname "
				+ "FROM posts p INNER JOIN wards w ON p.wid = w.wid "
				+ "INNER JOIN districts d ON w.did = d.did "
				+ "WHERE DATE(date_create) = ? "
				+ "ORDER BY pid DESC "
				+ "LIMIT 20";
		return jdbcTemplate.query(SQL, new ResultSetExtractor<List<Post>>() {
			  List<Post> listPost = new ArrayList<>();
			  @Override
			  public List<Post> extractData(ResultSet rs) throws SQLException, DataAccessException {
				  try {
					  while (rs.next()) {
						  listPost.add(new Post(rs.getInt("pid"), 
								  rs.getString("pname"), 
								  rs.getString("username"), 
								  rs.getString("description"), 
								  rs.getTimestamp("dateCreate"), 
								  rs.getInt("area"), 
								  rs.getString("picture"), 
								  rs.getInt("status"), 
								  rs.getString("addDetail"), 
								  rs.getInt("price"), 
								  new Ward(rs.getInt("wid"), rs.getString("wname"), rs.getInt("did")), 
								  new District(rs.getInt("did"), rs.getString("dname"))));
					  }
				  } catch (Exception e) {
						e.printStackTrace();
				  }
				  return listPost;
			  }
		  }, datebegin);
	}
	
	public List<Post> statisticPost(Date datebegin, Date dateend) {
		final String SQL = "SELECT pid, pname, username, description, date_create AS dateCreate, "
				+ "area, picture, status, add_detail AS addDetail, price, p.wid, wname, w.did, dname "
				+ "FROM posts p INNER JOIN wards w ON p.wid = w.wid "
				+ "INNER JOIN districts d ON w.did = d.did "
				+ "WHERE date_create BETWEEN ? AND ? "
				+ "ORDER BY pid DESC "
				+ "LIMIT 20";
		return jdbcTemplate.query(SQL, new ResultSetExtractor<List<Post>>() {
			  List<Post> listPost = new ArrayList<>();
			  @Override
			  public List<Post> extractData(ResultSet rs) throws SQLException, DataAccessException {
				  try {
					  while (rs.next()) {
						  listPost.add(new Post(rs.getInt("pid"), 
								  rs.getString("pname"), 
								  rs.getString("username"), 
								  rs.getString("description"), 
								  rs.getTimestamp("dateCreate"), 
								  rs.getInt("area"), 
								  rs.getString("picture"), 
								  rs.getInt("status"), 
								  rs.getString("addDetail"), 
								  rs.getInt("price"), 
								  new Ward(rs.getInt("wid"), rs.getString("wname"), rs.getInt("did")), 
								  new District(rs.getInt("did"), rs.getString("dname"))));
					  }
				  } catch (Exception e) {
						e.printStackTrace();
				  }
				  return listPost;
			  }
		  }, datebegin, dateend);
	}
}
