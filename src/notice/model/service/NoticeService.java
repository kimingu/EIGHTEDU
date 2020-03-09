package notice.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static common.JDBCTemplate.*;

import notice.model.dao.NoticeDao;
import notice.model.vo.Notice;

public class NoticeService {

	public ArrayList<Notice> selectList(int currentPage, int noticeLimit, String n_name) {
		Connection conn = getConnection();
		ArrayList<Notice> list = new NoticeDao().selectList(conn, currentPage, noticeLimit, n_name);
		close(conn);
		return list;
	}

	public int insertNotice(Notice n) {
		Connection conn = getConnection();
		int result = new NoticeDao().insertNotice(conn, n);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}

	
	public Notice selectNotice(int n_code) {
		Connection conn = getConnection();
		
		// 조회수 증가
		int result = new NoticeDao().increaseCount(conn,n_code);
		
		Notice n = null;
		
		if(result > 0) {
			n = new NoticeDao().selectNotice(conn,n_code);
			commit(conn);
			
		}else {
			rollback(conn);
		}
		close(conn);
	 
		return n;
	}

	public Notice selectNoticeNoCnt(int n_code) {
		Connection conn = getConnection();
		
		Notice n = new NoticeDao().selectNotice(conn,n_code);
		
		close(conn);
		
		return n;
	}

	public int deleteNotice(int n_code) {
		Connection conn = getConnection();
		
		int result = new NoticeDao().deleteNotice(conn, n_code);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int updateNotice(Notice n) {
		Connection conn = getConnection();
		int result = 0;
		result = new NoticeDao().updateNotice(conn, n);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public ArrayList<Notice> searchNotice(String keyword, String condition, String n_name, int currentPage, int noticeLimit) {
		Connection conn = getConnection();
		ArrayList<Notice> list = new ArrayList<Notice>();
		list = new NoticeDao().searchNotice(conn, keyword, condition, n_name, currentPage, noticeLimit);
		close(conn);
		return list;
	}

	public static int getListCount(String n_name) {
		Connection conn = getConnection();

		int listCount = new NoticeDao().getListCount(conn, n_name);

		close(conn);

		return listCount;
	}

	
	public static int getListSearchCount(String n_name, String keyword, String condition) {
		Connection conn = getConnection();

		int listCount = new NoticeDao().getListSearchCount(conn, n_name, keyword, condition);

		close(conn);

		return listCount;
	}

	public int checkNotice(int n_code, String n_title, String n_content, String report1, String report2) {
		Connection conn = getConnection();
		int result = new NoticeDao().checkNotice(conn, n_code, n_title, n_content, report1, report2);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public static int getListCount2(String data) {
		Connection conn = getConnection();

		int listCount = new NoticeDao().getListCount2(conn, data);

		close(conn);

		return listCount;
	}

	public ArrayList<Notice> selectList2(int currentPage, int noticeLimit, String data) {
		Connection conn = getConnection();
		ArrayList<Notice> list = new NoticeDao().selectList2(conn, currentPage, noticeLimit, data);
		close(conn);
		return list;
	}

	public ArrayList<Notice> selectKeyWordList(String search) {
		Connection con = getConnection();
		ArrayList<Notice> list = new NoticeDao().selectKeyWordList(con, search);
		close(con);
		return list;
	}

}
