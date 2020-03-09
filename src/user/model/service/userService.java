package user.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import lecture.model.vo.UserClass;
import user.model.dao.userDao;
import user.model.vo.LecList;
import user.model.vo.User;
import user.model.vo.UserOrder;
public class userService {

	public int insertUser(User user) {
		Connection con = getConnection();
		
		int result = new userDao().insertUser(con, user);
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		return result;
	}

	 public User loginUser(String id, String pwd) {
	      Connection conn = getConnection();
	      
	      User loginUser = new userDao().loginUser(conn, id, pwd);
	      
	      close(conn);
	      
	      return loginUser;
	 }

	 public User updateUser(User u) {
         Connection conn = getConnection();
         User updateu = null;
         
         int result = new userDao().updateUser(conn, u);
         if(result > 0) {
            updateu = new userDao().selectUser(conn, u.getUserCode());
            commit(conn);
         }else {
            rollback(conn);
         }
         
         close(conn);
         
         return updateu;
      }

	public int deleteUser(String userId, String userPwd) {
		Connection con = getConnection();
		int result = new userDao().deleteUser(con, userId, userPwd);
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		return result;
	}

	public int updatePwd(String userId, String userPwd, String changePwd) {
		Connection con = getConnection();
		int result = new userDao().updatePwd(con, userId, userPwd, changePwd);
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		return result;
	}

	public User searchId(String userName, String userNo) {
		Connection con = getConnection();
		User u = new userDao().searchId(con, userName, userNo);
		
		close(con);
		return u;
	}

	public User searchPwd(String userName, String userId) {
		Connection con = getConnection();
		User u = new userDao().searchPwd(con, userName, userId);
		
		close(con);
		return u;
	}

	public int checkId(String userId) {
		Connection con = getConnection();
		int result = new userDao().checkId(con, userId);
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		return result;
	}

	public User loginUser2(int userCode) {
		Connection conn = getConnection();
	      
	      User loginUser = new userDao().loginUser2(conn, userCode);
	      
	      close(conn);
	      
	      return loginUser;
	}

	public User updateUserPoint(User u) {
		Connection conn = getConnection();
        User updateu = null;
        
        int result = new userDao().updateUser2(conn, u);
        if(result > 0) {
           updateu = new userDao().selectUser(conn, u.getUserCode());
           commit(conn);
        }else {
           rollback(conn);
        }
        
        close(conn);
        
        return updateu;
	}

	public int getListCount(int userCode) {
		Connection conn = getConnection();

		int listCount = new userDao().getListCount(conn, userCode);

		close(conn);

		return listCount;
	}

	public int getListCount(String data, int userCode) {
		Connection conn = getConnection();

		int listCount = new userDao().getListCount(conn, data, userCode);

		close(conn);

		return listCount;
	}

	public int getBuyListCount(int userCode) {
		Connection conn = getConnection();

		int listCount = new userDao().getBuyListCount(conn, userCode);

		close(conn);

		return listCount;
	}
	public ArrayList<LecList> selectAllList(int currentPage, int boardLimit, int userCode) {
		Connection con = getConnection();
		ArrayList<LecList> list = new userDao().selectAllList(con, currentPage, boardLimit, userCode);
		close(con);
		
		return list;
	}

	public ArrayList<LecList> selectTypeList(String data, int currentPage, int boardLimit, int userCode) {
		Connection con = getConnection();
		ArrayList<LecList> list = new userDao().selectTypeList(con, data, currentPage, boardLimit, userCode);
		close(con);
		
		return list;
	}

	public ArrayList<UserOrder> myBuyList(int currentPage, int boardLimit, int userCode) {
		Connection con = getConnection();
		ArrayList<UserOrder> list = new userDao().myBuyList(con, currentPage, boardLimit, userCode);
		close(con);
		
		return list;
	}

	// 강좌 구매 내역 확인하는 구문

	public ArrayList<UserClass> buyLectureList(int user_code) {
		Connection con = getConnection();
		
		ArrayList<UserClass> list = new userDao().buyLectureList(con, user_code);
		close(con);
		
		return list;
	}



	

}
