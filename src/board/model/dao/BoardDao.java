package board.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import board.model.vo.Board;
import board.model.vo.BoardComment;

public class BoardDao {
	private Properties prop = new Properties();

	public BoardDao() {
		String fileName = BoardDao.class.getResource("/sql/board/board-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 게시판 조회용 Dao
	public ArrayList<Board> selectList(Connection conn, int currentPage, int boardLimit, String b_name) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = new ArrayList<>();
		String sql = prop.getProperty("selectList");
		try {
			pstmt = conn.prepareStatement(sql);

			int startRow = (currentPage - 1) * boardLimit + 1;
			int endRow = startRow + boardLimit - 1;

			pstmt.setString(1, b_name);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new Board(rset.getInt("b_code"), 
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

		return list;
	}

	// 게시글 작성 Dao
	public int insertBoard(Connection conn, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertBoard");
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, b.getAliass());
			pstmt.setInt(2, b.getM_code());
			pstmt.setString(3, b.getB_title());
			pstmt.setString(4, b.getB_content());
			pstmt.setString(5, b.getB_name());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// 게시판 상세보기 Dao
	public Board selectBoard(Connection conn, int b_code) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Board b = null;

		String query = prop.getProperty("selectBoard");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, b_code);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				b = new Board(rset.getInt("b_code"), rset.getInt("user_code"), rset.getInt("m_code"),
						rset.getDate("create_date"), rset.getInt("b_count"), rset.getString("b_title"),
						rset.getString("b_content"), rset.getString("status"), rset.getString("b_name"),
						rset.getString("m_name"), rset.getString("aliass"));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return b;
	}

	// 조회수 증가 Dao
	public int increaseCount(Connection conn, int b_code) {
		PreparedStatement pstmt = null;

		int result = 0;

		String query = prop.getProperty("increaseCount");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, b_code);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	// 게시판 삭제 dao
	public int deleteBoard(Connection conn, int b_code) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("deleteBoard");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, b_code);
		

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	// 게시글 수정 dao
	public int updateBoard(Connection conn, Board board) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("updateBoard");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, board.getB_title());
			pstmt.setString(2, board.getB_content());
			pstmt.setString(3, board.getB_name());
			pstmt.setInt(4, board.getM_code());
			pstmt.setInt(5, board.getB_code());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	// 게시판 리스트 갯수 조회용 dao
	public int getListCount(Connection conn ,String b_name) {
		int listCount = 0;
	      ResultSet rset = null;
	      PreparedStatement pstmt = null;
	      String sql = prop.getProperty("countList");
	      try {
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, b_name);
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

	// 댓글 입력 dao
	public int insertComment(Connection conn, BoardComment r) {
		PreparedStatement pstmt = null;

		int result = 0;

		String sql = prop.getProperty("insertComment");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, r.getB_code());
			pstmt.setString(2, r.getC_content());
			pstmt.setInt(3, r.getUser_code());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

	// 댓글 리스트 셀렉 dao
	public ArrayList<BoardComment> selectCommentList(Connection conn, int b_code) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<BoardComment> rlist = null;
		
		String sql = prop.getProperty("selectReplyList");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, b_code);

			rs = pstmt.executeQuery();

			rlist = new ArrayList<BoardComment>();
			
			while(rs.next()) {
				rlist.add(new BoardComment(rs.getInt("c_code"),
						                   rs.getInt("b_code"),
						                   rs.getString("c_content"),
						                   rs.getDate("create_date"),
						                   rs.getString("aliass"),
						                   rs.getInt("user_code")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally { 
			close(rs);
			close(pstmt);
		}

		return rlist;
	}

	// 검색 dao
	public ArrayList<Board> searchBoard(Connection conn, String keyword, String condition, String b_name,
			int currentPage, int boardLimit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = new ArrayList<>();
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
			
			int startRow = (currentPage - 1) * boardLimit + 1;
			int endRow = startRow + boardLimit - 1;
			
			pstmt.setString(1, b_name);
			pstmt.setInt(2,startRow);
			pstmt.setInt(3, endRow);
			pstmt.setString(4, keyword);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Board(rset.getInt("b_code"),
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
		
	
		return list;
		
	
}

	// 서치 페이징
	public int getListSearchCount(Connection conn, String b_name, String keyword, String condition) {
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
			pstmt.setString(1,b_name);
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

	public ArrayList<Board> selectList2(Connection conn, int currentPage, int boardLimit, String data) {
		PreparedStatement pstmt = null;
		ResultSet rset = null; 
		ArrayList<Board> list = new ArrayList<>();
		
		String sql = prop.getProperty("selectList2");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (currentPage - 1) * boardLimit + 1;
			int endRow = startRow + boardLimit - 1;
			
			pstmt.setString(1, data);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Board(rset.getInt("b_code"),
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
		
		return list;
	}
	
	public ArrayList<Board> selectKeyWordList(Connection conn, String search) {
		PreparedStatement pstmt = null;
		ResultSet rset = null; 
		ArrayList<Board> list = new ArrayList<>();
		
		String sql = prop.getProperty("selectKeyWordList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, search);
			pstmt.setString(2, search);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Board(rset.getInt("b_code"),
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
		
		return list;
	}

	// 메인 영어 리스트 
	public ArrayList<Board> mainSelectEngList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null; 
		String sql = prop.getProperty("mainSelectEngList");
		ArrayList<Board> listEng = new ArrayList<>();
		String word = "영어";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, word);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				listEng.add(new Board(rset.getInt("b_code"),
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
		
		
		return listEng;
	}

	// 메인 일본어 리스트 
	public ArrayList<Board> mainSelectJpList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null; 
		String sql = prop.getProperty("mainSelectJpList");
		ArrayList<Board> listJp = new ArrayList<>();
		String word = "일본어";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, word);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				listJp.add(new Board(rset.getInt("b_code"),
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
		
		
		return listJp;
	}

	// 메인 중국어 리스트 
	public ArrayList<Board> mainSelectChList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null; 
		String sql = prop.getProperty("mainSelectChList");
		ArrayList<Board> listCh = new ArrayList<>();
		String word = "중국어";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, word);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				listCh.add(new Board(rset.getInt("b_code"),
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
		
		
		return listCh;	
		}

	// 메인 자료실 리스트 dao 
	public ArrayList<Board> mainSelectDtList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null; 
		String sql = prop.getProperty("mainSelectDtList");
		ArrayList<Board> listDt = new ArrayList<>();
		String word = "자료실";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, word);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				listDt.add(new Board(rset.getInt("b_code"),
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
		
		
		return listDt;	
	}

	// 댓글 삭제 dao 
	public int deleteComment(Connection conn, int c_code) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("deleteComment");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1,c_code);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	

	
}