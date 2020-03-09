package lecture.model.service;
import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import lecture.model.dao.LectureDao;
import lecture.model.vo.Lecture;
import notice.model.dao.NoticeDao;
import notice.model.vo.Notice;
import product.model.dao.productDao;

public class LectureService {
	// 전체 Lecture 조회
	public ArrayList<Lecture> selectList() {

			Connection conn = getConnection();
			ArrayList<Lecture> list = new LectureDao().selectList(conn);
			
			close(conn);
			
			return list;
		
		
	}
	
	
	
	// 강좌 선택용(영어, 일본어, 중국어)
	public ArrayList<Lecture> selectChoiceList(String l_type) {
		
		Connection conn = getConnection();
		ArrayList<Lecture> list = new LectureDao().selectChoiceList(conn, l_type);
		
		close(conn);
		
		return list;
	}
	
	
	// Lecture 입력하기
	public int insertLecture(Lecture l) {
		Connection conn = getConnection();
		int result = new LectureDao().insertLecture(conn, l);
		
		if(result > 0) {
			commit(conn);
			
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	// 강좌 상세보기
	public Lecture selectLecture(int l_code) {
		Connection conn = getConnection();
		
		Lecture l = null;
		
		l = new LectureDao().selectLecture(conn, l_code);
		
		if(l.getL_code() > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		
		return l;
	}
	
	// 강좌정보 삭제
	public int deleteLecture(int l_code) {
		Connection conn = getConnection();
		
		int result = new LectureDao().deleteLecture(conn, l_code);
		
		if (result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	// 강좌등록 수정용
	public int updateLecture(Lecture l) {
		Connection conn = getConnection();
		
		int result = new LectureDao().updateLecture(conn,l);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}


	// 조회 내림차순으로 하기
	public ArrayList<Lecture> selectListASC() {

		Connection conn = getConnection();
		ArrayList<Lecture> list = new LectureDao().selectListASC(conn);
		
		close(conn);
		
		return list;
	}



	public int buyLecture(int l_code, int loginUserCode) {
		Connection con = getConnection();
		int price = new LectureDao().getPrice(con, l_code); // 해당하는 강좌의 가격을 불러오기위해 출발!
		
		int t_code = new LectureDao().getTcode(con, l_code); // 해당하는 선생님의 코드번호를 알기위해 출발!
		
		int result2 = new LectureDao().buyLecture(con, price, loginUserCode); // 해당강좌의 가격과, 해당 유저의 코드번호를 가지고 출발!
		if(price > 0 && result2 >0) {

			int updateOrderList = new LectureDao().updateOrder(con, l_code, t_code,loginUserCode); // 내 정보의 구매지기록에 남기기 위해 출발!
			if(updateOrderList > 0) {
				commit(con);
			}else {
				rollback(con);
			}
			
		} else {
			rollback(con);
		}
		close(con);
		
		
		return result2; 
	}


	
	// 검색하기 기능구현

	public ArrayList<Lecture> searchLecture(String keyword, String condition) {
		
		Connection conn = getConnection();
		ArrayList<Lecture> list = new ArrayList<Lecture>();
		list = new LectureDao().searchLecture(conn, keyword, condition);
		close(conn);
		
		return list;
		
	}



	// 수강여부 설정
	public int updateUserClass(int l_code, int user_code) {
		Connection conn = getConnection();
		
		int result = new LectureDao().updateUserClass(conn, l_code, user_code);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}


	
	// 내 구매내역만 보여지게

	public ArrayList<Lecture> selectMyLecture(int user_code) {
		
		Connection conn = getConnection();
		ArrayList<Lecture> list = new LectureDao().selectMyLecture(conn, user_code);
		
		close(conn);
		
		return list;
	}



	public ArrayList<Lecture> selectKeyWordtList(String search) {
		Connection con = getConnection();
		ArrayList<Lecture> list = new LectureDao().selectKeyWordList(con, search);
		
		close(con);
		return list;
	}
	




}
