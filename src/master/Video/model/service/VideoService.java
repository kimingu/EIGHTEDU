package master.Video.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import master.Class.model.dao.ClassDao;
import master.Video.model.dao.VideoDao;
import master.Video.model.vo.Video;


// 게시판 리스트 갯수 증가
public class VideoService {

	// 게시판 리스트 갯수 조회용 서비스
	public int getListCount() {
		Connection conn = getConnection();

		int listCount = new VideoDao().getListCount(conn);

		close(conn);

		return listCount;
	}

	public ArrayList<Video> selectList(int currentPage, int boardLimit) {
		Connection conn = getConnection();
		ArrayList<Video> list = new VideoDao().selectList(conn, currentPage, boardLimit);
		
		close(conn);
		return list;
	}

	// 동영상(강의) 상세보기
	public Video selectVideo(int v_code) {
		Connection conn = getConnection();
		
		Video v = null;
		
		v = new VideoDao().selectVideo(conn, v_code);
		
		if(v.getV_code() > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		
		return v;
	}

	public int insertVideo(Video v, String l_title) {
		
		Connection conn = getConnection();
		int result = new VideoDao().insertVideo(conn, v, l_title);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	// 동영상 삭제하기

	public int deleteVideo(int v_code) {
		Connection conn = getConnection();
		
		int result = new VideoDao().deleteVideo(conn, v_code);
		
		if (result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	// 검색된 리스트들 조회!

	public static int getListSearchCount(String keyword, String condition) {
		Connection conn = getConnection();

		int listCount = new VideoDao().getListSearchCount(conn, keyword, condition);

		close(conn);

		return listCount;
	}

	
	public ArrayList<Video> searchVideo(String keyword, String condition, int currentPage, int videoLimit) {
		Connection conn = getConnection();
		ArrayList<Video> list = new ArrayList<Video>();
		list = new VideoDao().searchVideo(conn, keyword, condition, currentPage, videoLimit);
		close(conn);
		return list;
	}

	public int updateVideo(Video v) {
		Connection conn = getConnection();
		
		int result = new VideoDao().updateVideo(conn, v);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}



	
	
	
}
