package main.model.service;

import java.util.ArrayList;
import java.sql.Connection;
import java.util.ArrayList;

import static common.JDBCTemplate.*;

import board.model.vo.Board;
import main.model.dao.MainDao;
import notice.model.vo.Notice;

public class MainService {

	public ArrayList<Notice> selectNoList() {
		Connection conn = getConnection();
		ArrayList<Notice> listNo = new MainDao().selectNoList(conn);
		close(conn);
		return listNo;
	}

	public ArrayList<Board> selectBoList() {
		Connection conn = getConnection();
		ArrayList<Board> listBo = new MainDao().selectBoList(conn);
		close(conn);
		return listBo;
	}

}
