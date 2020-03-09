package lecture.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import static common.JDBCTemplate.*;

import lecture.model.vo.Video;

public class VideoDao {
	private Properties prop = new Properties();
	
	public VideoDao() {
		String fileName = VideoDao.class.getResource("/sql/lecture/video-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	// 동영상 상세보기 쿼리문은 (LECTURE 폴더 하위에 존재!)
	public Video selectVideo(Connection conn, int c_code) {
		Video v = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectVideo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, c_code);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				v = new Video(rset.getInt("v_code"),
								rset.getString("v_link"),
								rset.getInt("c_code"),
								rset.getString("status"),
								rset.getString("c_title"));
				System.out.println(1111);
			}
			System.out.println(v);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return v;
	}

}
