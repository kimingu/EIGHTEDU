package master.Class.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import lecture.model.vo.Lecture;
import master.Class.model.vo.Classs;


public class ClassDao {
	private Properties prop = new Properties();
	
	public ClassDao() {

		String fileName = ClassDao.class.getResource("/sql/master/master-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	

	// 게시판 리스트 갯수 조회용 dao
	public int getListCount(Connection conn) {
		int listCount = 0;

		Statement stmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("getListCount");

		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);

			if (rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return listCount;
	}


	// 게시판 조회용 Dao
	public ArrayList<Classs> selectList(Connection conn, int currentPage, int boardLimit) {
		ArrayList<Classs> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (currentPage - 1) * boardLimit + 1;
			int endRow = startRow + boardLimit - 1;

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Classs(rset.getInt("c_code"),
									rset.getString("c_title"),
									rset.getString("c_time"),
									rset.getInt("c_next"),
									rset.getInt("l_code"),
									rset.getInt("t_code"),
									rset.getString("status"),
									rset.getString("t_name"),
									rset.getString("l_title")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}



	public int insertBoard(Connection conn, Classs c) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertClass");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, c.getC_title());
			pstmt.setString(2, c.getC_time());
			pstmt.setInt(3, c.getC_next());
			pstmt.setString(4, c.getL_title());
			pstmt.setString(5, c.getT_name());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
		

	}

	// class 상세보기!!
	public Classs selectLecture(Connection conn, int c_code) {
		Classs c = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectClass");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, c_code);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				c = new Classs(rset.getInt("c_code"),
								rset.getString("c_title"),
								rset.getString("c_time"),
								rset.getInt("c_next"),
								rset.getInt("l_code"),
								rset.getInt("t_code"),
								rset.getString("status"),
								rset.getString("t_name"),
								rset.getString("l_title"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return c;
	}


	public ArrayList<Classs> selectLectureClass(Connection conn, int l_code) {
		ArrayList<Classs> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectLectureClass");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, l_code);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Classs(rset.getInt("c_code"),
								rset.getString("c_title"),
								rset.getString("c_time"),
								rset.getInt("c_next"),
								rset.getInt("l_code"),
								rset.getInt("t_code"),
								rset.getString("status"),
								rset.getString("t_name"),
								rset.getString("l_title")));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	// 강의 삭제하기
	public int deleteClass(Connection conn, int c_code) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteClass");
		
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, c_code);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}

		return result;
	}

	// 강의 수정하기
	public int updateClass(Connection conn, Classs c) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateClass");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, c.getC_title());
			pstmt.setString(2, c.getC_time());
			pstmt.setInt(3, c.getC_next());
			pstmt.setString(4, c.getL_title());
			pstmt.setInt(5, c.getC_code());
	
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		

		return result;
	}


	
	// 강좌 리스트 뽑아오기
	public ArrayList<Classs> selectListASC(Connection conn) {
		
		ArrayList<Classs> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListTitle");
		try {
			pstmt = conn.prepareStatement(sql);
			


			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Classs(rset.getInt("c_code"),
									rset.getString("c_title"),
									rset.getString("c_time"),
									rset.getInt("c_next"),
									rset.getInt("l_code"),
									rset.getInt("t_code"),
									rset.getString("status"),
									rset.getString("t_name"),
									rset.getString("l_title")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}


	public int getListSearchCount(Connection conn, String keyword, String condition) {
		
		int listCount = 0;
		ResultSet rset = null;

		PreparedStatement pstmt = null;
		String sql = "";
		
		if(condition.equals("l_title")) {
			sql = prop.getProperty("countSearchLtitle");
		}else if(condition.equals("c_title")) {
			sql = prop.getProperty("countSearchCtitle");
			
		}else if(condition.equals("t_name"))
			sql = prop.getProperty("countSearchTname");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, keyword);
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
	}




	public ArrayList<Classs> searchClass(Connection conn, String keyword, String condition, int currentPage, int noticeLimit) {
	
		ArrayList<Classs> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		
		String sql = "";
		
		if(condition.equals("l_title")) {
			sql = prop.getProperty("searchLTitle");
		}else if(condition.equals("c_title")) {
			sql = prop.getProperty("searchCTitle");
		}else if(condition.equals("t_name")) {
			sql = prop.getProperty("searchTname");
		}
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (currentPage - 1) * noticeLimit + 1;
			int endRow = startRow + noticeLimit - 1;

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			pstmt.setString(3, keyword);

			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Classs(rset.getInt("c_code"),
									rset.getString("c_title"),
									rset.getString("c_time"),
									rset.getInt("c_next"),
									rset.getInt("l_code"),
									rset.getInt("t_code"),
									rset.getString("status"),
									rset.getString("t_name"),
									rset.getString("l_title")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}


	
	
	public ArrayList<Classs> selectList(Connection conn, String data) {
ArrayList<Classs> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList2");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, data);


			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Classs(rset.getInt("c_code"),
									rset.getString("c_title"),
									rset.getString("c_time"),
									rset.getInt("c_next"),
									rset.getInt("l_code"),
									rset.getInt("t_code"),
									rset.getString("status"),
									rset.getString("t_name"),
									rset.getString("l_title")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}




}
