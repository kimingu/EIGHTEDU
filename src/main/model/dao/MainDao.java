package main.model.dao;

import java.io.*;
import java.sql.*;
import java.util.*;
import static common.JDBCTemplate.*;

import board.model.vo.Board;
import notice.model.vo.Notice;

public class MainDao {
	private Properties prop = new Properties();

	public MainDao() {		
		String fileName = MainDao.class.getResource("/sql/main/main-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public ArrayList<Notice> selectNoList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Notice> listNo = new ArrayList<>();
		String sql = prop.getProperty("selectNoList");
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				listNo.add(new Notice(rset.getInt("n_code"),
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
		return listNo;
	}

	public ArrayList<Board> selectBoList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> listBo = new ArrayList<>();
		String sql = prop.getProperty("selectBoList");
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				listBo.add(new Board(rset.getInt("b_code"), 
						rset.getInt("user_code"), 
						rset.getInt("m_code"),
						rset.getDate("create_date"), 
						rset.getInt("b_count"), 
						rset.getString("b_title"),
						rset.getString("b_content"), 
						rset.getString("status"),
						rset.getString("b_name"),
						rset.getString("m_name"), 
						rset.getString("aliass")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return listBo;
	}

}
