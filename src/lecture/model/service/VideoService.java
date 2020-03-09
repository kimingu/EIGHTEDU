package lecture.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;

import lecture.model.dao.VideoDao;
import lecture.model.vo.Video;

public class VideoService {

	public Video selectLecture(int c_code) {
		Connection conn = getConnection();
		
		Video v = null;
		
		v = new VideoDao().selectVideo(conn, c_code);
		if(v.getV_code() > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return v;
	}
}
