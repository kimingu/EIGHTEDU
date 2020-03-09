package master.teacher.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Statement;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import master.teacher.model.vo.Report;

public class reportDao {
	private Properties prop = new Properties();
	
	public reportDao() {
		String fileName = reportDao.class.getResource("/sql/teacher/User.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public int insertReport(Connection conn, String user_code, String b_code, String r_content, String r_number) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertReport");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, r_content);
			pstmt.setString(2, user_code);
			pstmt.setString(3, b_code);
			pstmt.setString(4, r_number);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	public ArrayList<Report> selectReport(Connection conn) {
		ArrayList<Report> list = new ArrayList<Report>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReport");
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Report(rset.getString("r_code"),
									rset.getString("r_content"),
									rset.getString("r_number"),
									rset.getString("user_code"),
									rset.getString("b_code")));
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
