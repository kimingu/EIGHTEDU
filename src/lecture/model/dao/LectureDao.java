package lecture.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import lecture.model.vo.Lecture;


public class LectureDao {
	private Properties prop = new Properties();
	
	public LectureDao() {
		String fileName = LectureDao.class.getResource("/sql/lecture/lecture-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 전체 리스트 조회용
	public ArrayList<Lecture> selectList(Connection conn) {
		ArrayList<Lecture> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Lecture(rset.getInt("l_code"),
									rset.getString("l_title"),
									rset.getInt("l_number"),
									rset.getInt("l_price"),
									rset.getString("l_type"),
									//rset.getInt("t_code"), 써도 되고 안써도 되는 부분.
									// 쓰게 된다면 lecture-query에서도 순서대로 맞추어 주어야함 근데 일단 가져가보자.
									rset.getInt("t_code"),
									rset.getString("l_content"),
									rset.getString("t_name"),
									rset.getString("status")));
				
			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
		close(rset);
		close(pstmt);
		}
		
		return list;
	}
	
	// 강의 선택하기 수정중
	
	public ArrayList<Lecture> selectChoiceList(Connection conn, String l_type) {
		ArrayList<Lecture> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectChoiceList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, l_type);
			rset = pstmt.executeQuery();
			
			
			while(rset.next()) {
				list.add(new Lecture(rset.getInt("l_code"),
									rset.getString("l_title"),
									rset.getInt("l_number"),
									rset.getInt("l_price"),
									rset.getString("l_type"),
									//rset.getInt("t_code"), 써도 되고 안써도 되는 부분.
									// 쓰게 된다면 lecture-query에서도 순서대로 맞추어 주어야함 근데 일단 가져가보자.
									rset.getInt("t_code"),
									rset.getString("l_content"),
									rset.getString("t_name"),
									rset.getString("status")));
				
			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
		close(rset);
		close(pstmt);
		}
		
		return list;
	}
	

		
		


	// 강의 넣기
	public int insertLecture(Connection conn, Lecture l) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertLecture");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, l.getL_title());
			pstmt.setInt(2, l.getL_number());
			pstmt.setInt(3, l.getL_price());
			pstmt.setString(4, l.getL_type());
			pstmt.setString(5, l.getT_name());
			pstmt.setString(6, l.getL_content());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		
		return result;
	}

	
	// 상세보기
	public Lecture selectLecture(Connection conn, int l_code) {
		Lecture l = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectLecture");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, l_code);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				l = new Lecture(rset.getInt("l_code"),
								rset.getString("l_title"),
								rset.getInt("l_number"),
								rset.getInt("l_price"),
								rset.getString("l_type"),
								rset.getInt("t_code"),
								rset.getString("l_content"),
								rset.getString("t_name"),
								rset.getString("status"));
				
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
			
		}


		return l;
	}
	
	//강좌삭제

	public int deleteLecture(Connection conn, int l_code) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteLecture");
		
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1,l_code);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}

		return result;
	}

	
	// 강좌 수정하기
	public int updateLecture(Connection conn, Lecture l) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateLecture");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, l.getL_title());
			pstmt.setInt(2, l.getL_number());
			pstmt.setInt(3, l.getL_price());
			pstmt.setString(4, l.getL_type());
			pstmt.setString(5, l.getL_content());
			pstmt.setString(6, l.getT_name());
			pstmt.setInt(7, l.getL_code());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		

		return result;
	}

	
	// 조회 내림차순으로 하기 DAO
	public ArrayList<Lecture> selectListASC(Connection conn) {
		ArrayList<Lecture> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListASC");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Lecture(rset.getInt("l_code"),
									rset.getString("l_title"),
									rset.getInt("l_number"),
									rset.getInt("l_price"),
									rset.getString("l_type"),
									//rset.getInt("t_code"), 써도 되고 안써도 되는 부분.
									// 쓰게 된다면 lecture-query에서도 순서대로 맞추어 주어야함 근데 일단 가져가보자.
									rset.getInt("t_code"),
									rset.getString("l_content"),
									rset.getString("t_name"),
									rset.getString("status")));
				
			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
		close(rset);
		close(pstmt);
		}
		
		return list;
	}

	public int getPrice(Connection con, int l_code) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("getPrice");
		int result = 0;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, l_code);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	public int buyLecture(Connection con, int price, int loginUserCode) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("buyProduct");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, price);
			pstmt.setInt(2, loginUserCode);
			pstmt.setInt(3, price);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
		
		
	}

	public int updateOrder(Connection con, int l_code,int t_code, int loginUserCode) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertOrder");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, loginUserCode);
			pstmt.setInt(2, l_code);
			pstmt.setInt(3, t_code);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	
	
	// 검색하기 DAO
	public ArrayList<Lecture> searchLecture(Connection conn, String keyword, String condition) {
		ArrayList<Lecture> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "";
		
		if(condition.equals("l_title")) {
			sql = prop.getProperty("searchTitle");
		}else if(condition.equals("t_name")) {
			sql = prop.getProperty("searchName");
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, keyword);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Lecture(rset.getInt("l_code"),
									rset.getString("l_title"),
									rset.getInt("l_number"),
									rset.getInt("l_price"),
									rset.getString("l_type"),
									//rset.getInt("t_code"), 써도 되고 안써도 되는 부분.
									// 쓰게 된다면 lecture-query에서도 순서대로 맞추어 주어야함 근데 일단 가져가보자.
									rset.getInt("t_code"),
									rset.getString("l_content"),
									rset.getString("t_name"),
									rset.getString("status")));
				
			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
		close(rset);
		close(pstmt);
		}
		
		return list;
	}

	public int getTcode(Connection con, int l_code) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("getTcode");
		int result = 0;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, l_code);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	
	// 수강내역 변경 DAO
	public int updateUserClass(Connection conn, int l_code, int user_code) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateUserClass");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "수강완료");
			pstmt.setInt(2, l_code);
			pstmt.setInt(3, user_code);
	
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	
	// 나의 구매내역만 보여지는 DAO
	public ArrayList<Lecture> selectMyLecture(Connection conn, int user_code) {
		ArrayList<Lecture> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMyLectureList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, user_code);
			rset = pstmt.executeQuery();
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Lecture(rset.getInt("l_code"),
									rset.getString("l_title"),
									rset.getInt("l_number"),
									rset.getInt("l_price"),
									rset.getString("l_type"),
									//rset.getInt("t_code"), 써도 되고 안써도 되는 부분.
									// 쓰게 된다면 lecture-query에서도 순서대로 맞추어 주어야함 근데 일단 가져가보자.
									rset.getInt("t_code"),
									rset.getString("l_content"),
									rset.getString("t_name"),
									rset.getString("status")));
				
			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
		close(rset);
		close(pstmt);
		}
		
		return list;
	}

	public ArrayList<Lecture> selectKeyWordList(Connection con, String search) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectKeyWordList");
		ArrayList<Lecture> list = null;
		try {
			list = new ArrayList<>();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, search);
			pstmt.setString(2, search);
			pstmt.setString(3, search);
			pstmt.setString(4, search);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Lecture(rset.getInt("l_code"),
						rset.getString("l_title"),
						rset.getInt("l_number"),
						rset.getInt("l_price"),
						rset.getString("l_type"),
						//rset.getInt("t_code"), 써도 되고 안써도 되는 부분.
						// 쓰게 된다면 lecture-query에서도 순서대로 맞추어 주어야함 근데 일단 가져가보자.
						rset.getInt("t_code"),
						rset.getString("l_content"),
						rset.getString("t_name"),
						rset.getString("status")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return list;
	}

		
		
	






}
