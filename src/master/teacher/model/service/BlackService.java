package master.teacher.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import master.teacher.model.dao.BlackDao;
import master.teacher.model.vo.Black;
import master.user.model.vo.User;

import static common.JDBCTemplate.*;
public class BlackService {

	public int insertBlack(String user_code) {
		Connection conn = getConnection();
		int result = new BlackDao().insertBlack(conn, user_code);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public ArrayList<Black> selectBlack() {
		Connection conn = getConnection();
		ArrayList<Black> list = new BlackDao().selectBlack(conn);
		close(conn);
		return list;
	}

	public int cancelBlack(String user_code) {
		Connection conn = getConnection();
		int result = new BlackDao().cancelBlack(conn, user_code);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}

}
