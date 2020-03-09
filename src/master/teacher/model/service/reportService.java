package master.teacher.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import master.teacher.model.dao.reportDao;
import master.teacher.model.vo.Report;

public class reportService {

	public int insertReport(String r_content, String r_number, String b_code, String user_code) {
		Connection conn = getConnection();
		int result = new reportDao().insertReport(conn, user_code, b_code, r_content, r_number);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public ArrayList<Report> selectReport() {
		Connection conn = getConnection();
		ArrayList<Report> list = new reportDao().selectReport(conn);
		close(conn);
		return list;
	}
}
