package master.teacher.model.service;

import master.teacher.model.dao.TeacherDao;
import master.teacher.model.vo.Teacher;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

public class TeacherService {

	public int insertTeacher(String t_name, String t_phone, String t_address) {
		Connection conn = getConnection();
		int result = new TeacherDao().insertTeacher(conn, t_name, t_phone, t_address);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}

	public ArrayList<Teacher> selectTeacher() {
		Connection conn = getConnection();
		ArrayList<Teacher> list = new TeacherDao().selectTeacher(conn);
		close(conn);
		return list;
	}

	public int deleteTeacher(String t_code) {
		Connection conn = getConnection();
		int result = new TeacherDao().deleteTeacher(conn, t_code);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

}
