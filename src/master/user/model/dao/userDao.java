package master.user.model.dao;

import static common.JDBCTemplate.close;

import java.io.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import master.user.model.vo.User;

public class userDao {
	private Properties prop = new Properties();
	
	public userDao() {
		String fileName = userDao.class.getResource("/sql/user/User.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	

	// 블랙회원 복구 dao
	public int returnUser(Connection conn, int user_code) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("returnUser");
		System.out.println(user_code);
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, user_code);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
	return result;
	}
	
	// 회원 삭제 dao
	public int deleteUser(Connection conn, int user_code) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("deleteUser1");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, user_code);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
	return result;
}

	// 회원 리스트 카운트
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
	
	// 회원 리스트 카운트2
	public int getListCount2(Connection conn) {
		int listCount = 0;

		Statement stmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("getListCount2");

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

	// 회원 리스트 조회
	public ArrayList<User> selectList(Connection conn, int currentPage, int userLimit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<User> list = new ArrayList<>();
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (currentPage - 1) * userLimit + 1;
			int endRow = startRow + userLimit - 1;

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new User(rset.getInt("user_Code"),
								rset.getString("user_No"),
								rset.getString("user_Id"),
								rset.getString("user_Name"),
								rset.getString("Email"),
								rset.getString("Phone"),
								rset.getString("Address"),
								rset.getDate("enroll_date")));
				}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	//블랙 회원 리스트 조회
	public ArrayList<User> selectBlackList(Connection conn, int currentPage, int userLimit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<User> list = new ArrayList<>();
		String sql = prop.getProperty("selectBlackList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (currentPage - 1) * userLimit + 1;
			int endRow = startRow + userLimit - 1;

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new User(rset.getInt("user_code"),
								rset.getString("user_no"),
								rset.getString("user_id"),
								rset.getString("user_name"),
								rset.getString("email"),
								rset.getString("phone"),
								rset.getString("address"),
								rset.getDate("enroll_date")));
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
