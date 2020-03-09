package product.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import board.model.dao.BoardDao;
import product.model.dao.productDao;
import product.model.vo.Product;
import static common.JDBCTemplate.*;

public class productService {

	public ArrayList<Product> selectAllList(int currentPage, int boardLimit) {
		Connection con = getConnection();
		ArrayList<Product> list = new productDao().selectAllList(con, currentPage, boardLimit);
		close(con);
		
		return list;
	}

	public ArrayList<Product> selectTypeList(String data, int currentPage, int boardLimit) {
		Connection con = getConnection();
		ArrayList<Product> list = new productDao().selectTypeList(con, data, currentPage, boardLimit);
		close(con);
		
		return list;
	}
	public ArrayList<Product> selectKeyWordList(String search) {
		Connection con = getConnection();
		ArrayList<Product> list = new productDao().selectKeyWordList(con, search);
		close(con);
		
		return list;
	}

	public int getListCount() {
		Connection conn = getConnection();

		int listCount = new productDao().getListCount(conn);

		close(conn);

		return listCount;
	}

	public int getListCount(String data) {
		Connection conn = getConnection();

		int listCount = new productDao().getListCount(conn, data);

		close(conn);

		return listCount;
	}

	public int buyProduct(int proNum, int loginUser) {
		Connection con = getConnection();
		int price = new productDao().getPrice(con, proNum);
		int result2 = new productDao().buyProduct(con, price, loginUser);
		if(price > 0 && result2 > 0) {
			int minus = new productDao().decrease(con, proNum);
			int updateOrderList = new productDao().updateOrder(con, proNum, loginUser);
			if(minus > 0 && updateOrderList > 0) {
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

	public int insertProduct(Product p) {
		Connection con = getConnection();
		int result = new productDao().insertProduct(con, p);
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		return result;
	}

	public int deleteProduct(int pronum) {
		Connection con = getConnection();
		int result = new productDao().deleteProduct(con, pronum);
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		return result;
	}

	

}
