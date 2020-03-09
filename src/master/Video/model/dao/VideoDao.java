package master.Video.model.dao;

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

import master.Class.model.vo.Classs;
import master.Video.model.vo.Video;


public class VideoDao {
	private Properties prop = new Properties();
	
	public VideoDao() {

		String fileName = VideoDao.class.getResource("/sql/master/master-query.properties").getPath();

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

		String sql = prop.getProperty("getListCount1");

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


	public ArrayList<Video> selectList(Connection conn, int currentPage, int boardLimit) {
		ArrayList<Video> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectVideoList");
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (currentPage - 1) * boardLimit + 1;
			int endRow = startRow + boardLimit - 1;

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Video(rset.getInt("v_code"),
									rset.getString("v_link"),
									rset.getInt("c_code"),
									rset.getString("status"),
									rset.getString("c_title"),
									rset.getString("c_time"),
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


	
	// video목록 상세보기
	public Video selectVideo(Connection conn, int v_code) {
		Video v = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectVideo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, v_code);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				v = new Video(rset.getInt("v_code"),
								rset.getString("v_link"),
								rset.getInt("c_code"),
								rset.getString("status"),
								rset.getString("c_title"),
								rset.getString("c_time"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return v;
	}


	// video 값 넣기
	public int insertVideo(Connection conn, Video v, String l_title) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertVideo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, v.getV_link());
			pstmt.setString(2, v.getC_title());
			pstmt.setString(3, l_title);

			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}


	
	// 동영상 삭제하기
	public int deleteVideo(Connection conn, int v_code) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteVideo");
		
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, v_code);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}

		return result;
	}


	public int getListSearchCount(Connection conn, String keyword, String condition) {

		int listCount = 0;

		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = "";
		if(condition.equals("c_title")) {
			sql = prop.getProperty("countSearchCtitle1");
		}else if(condition.equals("l_title")) {
			sql = prop.getProperty("countSearchLtitle1");
		}


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


	public ArrayList<Video> searchVideo(Connection conn, String keyword, String condition, int currentPage,
			int videoLimit) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Video> list = new ArrayList<>();
		
		String sql = "";
		
		if(condition.equals("c_title")) {
			
			sql = prop.getProperty("searchCTitle1");
		}else if(condition.equals("l_title")) {
			sql = prop.getProperty("searchLTitle1");
		}
		

			
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				int startRow = (currentPage - 1) * videoLimit + 1;
				int endRow = startRow + videoLimit - 1;

				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
				pstmt.setString(3, keyword);

				
				rset = pstmt.executeQuery();
				
				
				while(rset.next()) {
					list.add(new Video(rset.getInt("v_code"),
										rset.getString("v_link"),
										rset.getInt("c_code"),
										rset.getString("status"),
										rset.getString("c_title"),
										rset.getString("c_time"),
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


	public int updateVideo(Connection conn, Video v) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("updateVideo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, v.getV_link());
			pstmt.setString(2, v.getC_title());
			pstmt.setString(3, v.getL_title());
			pstmt.setInt(4, v.getV_code());

			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
}
