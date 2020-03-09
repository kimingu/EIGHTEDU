package master.teacher.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import master.teacher.model.vo.Black;
import master.user.model.vo.User;

public class BlackDao {
	private Properties prop = new Properties();
	
	
	public BlackDao() {
		String fileName = reportDao.class.getResource("/sql/teacher/User.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public int insertBlack(Connection conn, String user_code) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertBlack");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_code);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	public ArrayList<Black> selectBlack(Connection conn) {
		ArrayList<Black> list = new ArrayList<Black>();
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectBlack");
		ResultSet rset = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Black(rset.getInt("user_code"),
								rset.getString("user_name"),
								rset.getString("user_id")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	public int cancelBlack(Connection conn, String user_code) {
		int result = 0;
		PreparedStatement pstmt =null;
		String sql = prop.getProperty("cancelBlack");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_code);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
