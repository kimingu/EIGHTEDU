package master.Class.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import lecture.model.dao.LectureDao;
import lecture.model.vo.Lecture;
import master.Class.model.dao.ClassDao;
import master.Class.model.vo.Classs;
import notice.model.dao.NoticeDao;
import notice.model.vo.Notice;

// 게시판 리스트 갯수 증가
public class ClassService {

	// 게시판 리스트 갯수 조회용 서비스
	public int getListCount() {
		Connection conn = getConnection();

		int listCount = new ClassDao().getListCount(conn);

		close(conn);

		return listCount;
	}

	public ArrayList<Classs> selectList(int currentPage, int boardLimit) {
		Connection conn = getConnection();
		ArrayList<Classs> list = new ClassDao().selectList(conn, currentPage, boardLimit);
		
		close(conn);
		return list;
	}

	
	//class 집어넣기
	public int insertBoard(Classs c) {
		Connection conn = getConnection();
		int result = new ClassDao().insertBoard(conn, c);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	// 강좌 리스트 가져오기
	public Classs selectLecture(int c_code) {
		Connection conn = getConnection();
		
		Classs c = null;
		
		c = new ClassDao().selectLecture(conn, c_code);
		
		if(c.getL_code() > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		
		return c;
	}

	public ArrayList<Classs> selectLectureClass(int l_code) {
		Connection conn = getConnection();
		ArrayList<Classs> list = new ClassDao().selectLectureClass(conn, l_code);
		
		close(conn);
		
		return list;
	}

	public int deleteClass(int c_code) {
		Connection conn = getConnection();
		
		int result = new ClassDao().deleteClass(conn, c_code);
		
		if (result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int updateClass(Classs c) {
		Connection conn = getConnection();
		
		int result = new ClassDao().updateClass(conn, c);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	
	
	// 페이징바 없이 가져오기
	public ArrayList<Classs> selectListASC() {
		Connection conn = getConnection();
		
		ArrayList<Classs> list = new ClassDao().selectListASC(conn);
		
		close(conn);
		
		return list;
		
		
	}

	
	//  검색된 게시판 갯수 조회용 리스트
	public static int getListSearchCount(String keyword, String condition) {
		Connection conn = getConnection();

		int listCount = new ClassDao().getListSearchCount(conn, keyword, condition);

		close(conn);

		return listCount;
	}

	// 검색된 리스트 조회
	public ArrayList<Classs> searchClass(String keyword, String condition, int currentPage, int noticeLimit) {
		Connection conn = getConnection();
		ArrayList<Classs> list = new ArrayList<Classs>();
		list = new ClassDao().searchClass(conn, keyword, condition,currentPage, noticeLimit);
		close(conn);
		return list;
	}

	
	public static int getListCount(String n_name) {
		Connection conn = getConnection();

		int listCount = new NoticeDao().getListCount(conn, n_name);

		close(conn);

		return listCount;
	}

	
	
	// ajax 값 뽑아오기
	public ArrayList<Classs> selectList(String data) {
		Connection conn = getConnection();
		ArrayList<Classs> list = new ClassDao().selectList(conn, data);
		
		close(conn);
		return list;
	}

	

	


	

	
	
}
