package notice.model.dao;

import java.io.*;
import java.sql.*;
import java.util.*;

import notice.model.vo.Notice;
import static common.JDBCTemplate.*;
public class NoticeDao {

	private Properties prop = new Properties();

	public NoticeDao() {
		String fileName = NoticeDao.class.getResource("/sql/notice/notice-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public ArrayList<Notice> selectList(Connection conn, int currentPage, int noticeLimit, String n_name) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Notice> list = new ArrayList<>();

		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);

			int startRow = (currentPage - 1) * noticeLimit + 1;
			int endRow = startRow + noticeLimit - 1;

			pstmt.setString(1, n_name);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Notice(rset.getInt("n_code"),
									rset.getInt("user_code"),
									rset.getInt("m_code"),
									rset.getDate("create_date"),
									rset.getInt("n_count"),
									rset.getString("n_title"),
									rset.getString("n_content"),
									rset.getString("status"),
									rset.getString("n_name"),
									rset.getString("m_name"),
									rset.getString("aliass")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	public int insertNotice(Connection conn, Notice n) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertNotice");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, n.getAliass());
			pstmt.setInt(2, n.getM_code());
			pstmt.setString(3, n.getN_title());
			pstmt.setString(4, n.getN_content());
			pstmt.setString(5, n.getN_name());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	public Notice selectNotice(Connection conn, int n_code) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Notice n = null;
		
		String sql = prop.getProperty("selectNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, n_code);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				n = new Notice(rset.getInt("n_code"),
								rset.getInt("user_code"),
								rset.getInt("m_code"),
								rset.getDate("create_date"),
								rset.getInt("n_count"),
								rset.getString("n_title"),
								rset.getString("n_content"),
								rset.getString("status"),
						   		rset.getString("n_name"),
						   		rset.getString("m_name"),
						   		rset.getString("aliass"));
						
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
	
		return n;
	}
	public int increaseCount(Connection conn, int n_code) {
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String query = prop.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, n_code);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	public int deleteNotice(Connection conn, int n_code) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("deleteNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, n_code);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn);
		}
		return result;
	}
	public int updateNotice(Connection conn, Notice n) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("updateNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, n.getN_title());
			pstmt.setString(2, n.getN_content());
			pstmt.setString(3, n.getN_name());
			pstmt.setInt(4, n.getM_code());
			pstmt.setInt(5, n.getN_code());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn);
		}
		
		return result;
	}
	public ArrayList<Notice> searchNotice(Connection conn, String keyword, String condition, String n_name, int currentPage, int noticeLimit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Notice> list = new ArrayList<>();
		String sql = "";
		
		if(condition.equals("writer")) {
			sql = prop.getProperty("searchWriter");
		}else if(condition.equals("title")) {
			sql = prop.getProperty("searchTitle");
		}else if(condition.equals("content")) {
			sql = prop.getProperty("searchContent");
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (currentPage - 1) * noticeLimit + 1;
			int endRow = startRow + noticeLimit - 1;

			pstmt.setString(1, n_name);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			pstmt.setString(4, keyword);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Notice(rset.getInt("n_code"),
									rset.getInt("user_code"),
									rset.getInt("m_code"),
									rset.getDate("create_date"),
									rset.getInt("n_count"),
									rset.getString("n_title"),
									rset.getString("n_content"),
									rset.getString("status"),
									rset.getString("n_name"),
									rset.getString("m_name"),
									rset.getString("aliass")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public int getListCount(Connection conn, String n_name) {
		int listCount = 0;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("countList");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, n_name);
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
	
	public int getListSearchCount(Connection conn, String n_name, String keyword, String condition) {
		int listCount = 0;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = "";
		if(condition.equals("writer")) {
			sql = prop.getProperty("countSearchWriter");
		}else if(condition.equals("title")) {
			sql = prop.getProperty("countSearchTitle");
		}else if(condition.equals("content")) {
			sql = prop.getProperty("countSearchContent");
		}
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, n_name);
			pstmt.setString(2, keyword);
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
	public int checkNotice(Connection conn, int n_code, String n_title, String n_content, String report1, String report2) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "";
		String new_content = n_content + "<br><br><br><br> ———— [답변입니다] ———— <br>" + report2;
		String new_title = "[답변완료] " + n_title;
		if(report1.equals("ok")) {
			sql = prop.getProperty("okayNotice");			
		}else if(report1.equals("fail")) {
			sql = prop.getProperty("failNotice");
		}
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, new_title);
			pstmt.setString(2, new_content);
			pstmt.setInt(3, n_code);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	public int getListCount2(Connection conn, String data) {
		int listCount = 0;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("countList2");		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, data);
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
	public ArrayList<Notice> selectList2(Connection conn, int currentPage, int noticeLimit, String data) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Notice> list = new ArrayList<>();

		String sql = prop.getProperty("selectList2");
		
		try {
			pstmt = conn.prepareStatement(sql);

			int startRow = (currentPage - 1) * noticeLimit + 1;
			int endRow = startRow + noticeLimit - 1;

			pstmt.setString(1, data);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Notice(rset.getInt("n_code"),
									rset.getInt("user_code"),
									rset.getInt("m_code"),
									rset.getDate("create_date"),
									rset.getInt("n_count"),
									rset.getString("n_title"),
									rset.getString("n_content"),
									rset.getString("status"),
									rset.getString("n_name"),
									rset.getString("m_name"),
									rset.getString("aliass")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	public ArrayList<Notice> selectKeyWordList(Connection con, String search) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Notice> list = new ArrayList<>();

		String sql = prop.getProperty("selectKeyWordList");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, search);
			pstmt.setString(2, search);
			
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Notice(rset.getInt("n_code"),
									rset.getInt("user_code"),
									rset.getInt("m_code"),
									rset.getDate("create_date"),
									rset.getInt("n_count"),
									rset.getString("n_title"),
									rset.getString("n_content"),
									rset.getString("status"),
									rset.getString("n_name"),
									rset.getString("m_name"),
									rset.getString("aliass")));
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
