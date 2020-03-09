package board.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import board.model.dao.BoardDao;
import board.model.vo.Board;
import board.model.vo.BoardComment;


public class BoardService {
	
	// 게시판 리스트 갯수 조회용 서비스 
	public int getListCount(String b_name) {
		Connection conn = getConnection();

		int listCount = new BoardDao().getListCount(conn, b_name);

		close(conn);

		return listCount;
	}

	// 게시판 조회용
	public ArrayList<Board> selectList(int currentPage, int boardLimit, String b_name) {
		Connection conn = getConnection();
		ArrayList<Board> list = new BoardDao().selectList(conn, currentPage, boardLimit, b_name);
		
		close(conn);
		return list;
	}

	// 게시판 작성
	public int insertBoard(Board b) {
		Connection conn = getConnection();
		int result = new BoardDao().insertBoard(conn, b);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	// 게시글 선택해오기(조회수 증가x)
	public Board selectBoardNoCnt(int b_code) {
		Connection conn = getConnection();
		
		Board b = new BoardDao().selectBoard(conn,b_code);
		
		close(conn);
		
		return b;
	}

	// 게시판 상세 보기 서비스(조회수 증가) 
	public Board selectBoard(int b_code) {
		Connection conn = getConnection();
		
		// 조회수 증가
		int result = new BoardDao().increaseCount(conn,b_code);
		
		Board b = null;
		
		if(result> 0) {
			b =new BoardDao().selectBoard(conn,b_code);
			commit(conn);
			
		}else {
			rollback(conn);
		}
		close(conn);
	 
		return b;
	}

	// 게시글 삭제 서비스 
	public int deleteBoard(int b_code) {
		Connection conn = getConnection();
		
		int result = new BoardDao().deleteBoard(conn,b_code);
	
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return result;
	}

	// 게시글 수정 서비스 
	public int updateBoard(Board board) {
		Connection conn = getConnection();
		
		int result = new BoardDao().updateBoard(conn, board);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	// 댓글 작성 
	public ArrayList<BoardComment> insertReply(BoardComment r) {
		Connection conn = getConnection();
		
	    BoardDao bDao = new BoardDao();
	    
	    int result = bDao.insertComment(conn,r);
	    
	    ArrayList<BoardComment> rlist = null;
	    
	    if(result > 0) {
	    	commit(conn);
	    	rlist = bDao.selectCommentList(conn,r.getB_code());
	    }else {
	    	rollback(conn);
	    	
	    }
	   close(conn);
	    
		return rlist;
	}

	public ArrayList<BoardComment> selectReplyList(int b_code) {
		Connection conn = getConnection();
		
		ArrayList<BoardComment> rlist = new BoardDao().selectCommentList(conn, b_code);
		
		close(conn);
		return rlist;
	}

	// 게시글 검색 
	public ArrayList<Board> searchBoard(String keyword, String condition, String b_name, int currentPage,
			int boardLimit) {
		Connection conn = getConnection();
		ArrayList<Board> list = new ArrayList<Board>();
		list = new BoardDao().searchBoard(conn,keyword,condition,b_name,currentPage,boardLimit);
		close(conn);
		return list;
	
	}

	public static int getListSearchCount(String b_name, String keyword, String condition) {
		Connection conn = getConnection();
		
		int listCount = new BoardDao().getListSearchCount(conn, b_name, keyword,condition);

		close(conn);
		return listCount;
	}

	public static int getListCount2(String data) {
		Connection conn = getConnection();
		
		int listCount = new BoardDao().getListCount2(conn,data);
		
		close(conn);
		return listCount;
	}

	public ArrayList<Board> selectList2(int currentPage, int boardLimit, String data) {
		Connection conn = getConnection();
		ArrayList<Board> list = new BoardDao().selectList2(conn, currentPage, boardLimit, data);
		close(conn);
		return list;
	}
    // 검색 결과 보여주는 리스트
	public ArrayList<Board> selectKeyWordList(String search) {
		Connection conn = getConnection();
		ArrayList<Board> list = new BoardDao().selectKeyWordList(conn, search);
		close(conn);
		return list;
	}
	// 메인 영어 리스트 서비스 
	public ArrayList<Board> mainselectEngList() {
		Connection conn = getConnection();
		ArrayList<Board> listEng = new BoardDao().mainSelectEngList(conn);
		
		close(conn);
		
		return listEng;
	}

	// 메인 일본어 리스트 서비스 
	public ArrayList<Board> mainselectJpList() {
		Connection conn = getConnection();
		ArrayList<Board> listJp = new BoardDao().mainSelectJpList(conn);
		close(conn);
		
		return listJp;
	}

	// 메인 중국어 리스트 서비스 
	public ArrayList<Board> mainselectChList() {
		Connection conn = getConnection();
		ArrayList<Board> listCh = new BoardDao().mainSelectChList(conn);
		close(conn);
		
		return listCh;
	}

	// 메인 자료실 리스트 서비스 
	public ArrayList<Board> mainselectDtList() {
		Connection conn = getConnection();
		ArrayList<Board> listCh = new BoardDao().mainSelectDtList(conn);
		close(conn);
		
		return listCh;
	}

	// 댓글 삭제 서비스 
	public int deleteComment(int c_code) {
		Connection conn = getConnection();
		
		int result = new BoardDao().deleteComment(conn,c_code);
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return result;
		
		
	}

	

}
