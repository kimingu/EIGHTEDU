package master.user.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import master.user.model.dao.userDao;
import master.user.model.vo.User;

public class userService {
	//블랙회원 복구 서비스
	public int returnUser(int user_code) {
		Connection conn = getConnection();
		
		int result = new userDao().returnUser(conn, user_code);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	// 회원 삭제 서비스
	public int deleteUser(int user_code) {
		Connection conn = getConnection();
		
		int result = new userDao().deleteUser(conn, user_code);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	// 회원 리스트 갯수 조회 서비스
		public int getListCount() {
			Connection conn = getConnection();
			
			int listCount = new userDao().getListCount(conn);
			
			close(conn);
			
			return listCount;
		}
		
	// 회원 리스트 갯수 조회 서비스2
			public int getListCount2() {
				Connection conn = getConnection();
				
				int listCount = new userDao().getListCount2(conn);
				
				close(conn);
					
				return listCount;
			}
	
	// 회원 리스트 조회 서비스
		public ArrayList<User> selectList(int currentPage, int userLimit) {
			Connection conn = getConnection();
			ArrayList<User> list = new userDao().selectList(conn, currentPage, userLimit);
			
			close(conn);
			return list;
		}

	//블랙 회원 리스트 조회 서비스
		public ArrayList<User> selectBlackList(int currentPage, int userLimit) {
			Connection conn = getConnection();
			ArrayList<User> list2 = new userDao().selectBlackList(conn, currentPage, userLimit);
			
			close(conn);
			return list2;
		}

}
