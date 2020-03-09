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
import master.teacher.model.vo.Teacher;

public class TeacherDao {
	private Properties prop = new Properties();
	
	public TeacherDao() {
		String fileName = TeacherDao.class.getResource("/sql/teacher/teacher-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertTeacher(Connection conn, String t_name, String t_phone, String t_address) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertTeacher");
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, t_name);
			pstmt.setString(2, t_phone);
			pstmt.setString(3, t_address);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public ArrayList<Teacher> selectTeacher(Connection conn) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectTeacher");
		ResultSet rset = null;
		ArrayList<Teacher> list = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Teacher(rset.getInt("t_code"), 
						rset.getString("t_name"), 
						rset.getString("t_phone"),
						rset.getString("t_address")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int deleteTeacher(Connection conn, String t_code) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteTeacher");
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, t_code);
			result = pstmt.executeUpdate();			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
