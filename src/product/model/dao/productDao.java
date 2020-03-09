package product.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import common.JDBCTemplate;
import product.model.vo.Product;
import static common.JDBCTemplate.*;

public class productDao {
	
	private Properties prop = new Properties();

	public productDao() {
		// 항상 member-query.properties에서 값을 가져올 수 있도록
		// 기본 생성자 안에서 properties 파일을 불러오는 작업을 하자
		String fileName = JDBCTemplate.class.getResource("/sql/product/Product.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public ArrayList<Product> selectAllList(Connection con, int currentPage, int boardLimit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAllList");
		ArrayList<Product> list = null;
		try {
			pstmt = con.prepareStatement(sql);
			int startRow = (currentPage - 1) * boardLimit + 1;
			int endRow = startRow + boardLimit - 1;

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			list = new ArrayList<>();
			while(rset.next()) {
				list.add(new Product(rset.getInt(1), rset.getString(2),
						rset.getString(3), rset.getInt(4), rset.getInt(5)));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public ArrayList<Product> selectTypeList(Connection con, String data, int currentPage, int boardLimit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectTypeList");
		ArrayList<Product> list = null;
		int startRow = (currentPage - 1) * boardLimit + 1;
		int endRow = startRow + boardLimit - 1;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, data);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			list = new ArrayList<>();
			while(rset.next()) {
				list.add(new Product(rset.getInt(1), rset.getString(2),
						rset.getString(3), rset.getInt(4), rset.getInt(5)));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return list;
	}
	
	public ArrayList<Product> selectKeyWordList(Connection con, String search) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectKeyWordList");
		ArrayList<Product> list = null;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, search);
			pstmt.setString(2, search);
			pstmt.setString(3, search);
			pstmt.setString(4, search);
			
			rset = pstmt.executeQuery();
			list = new ArrayList<>();
			while(rset.next()) {
				list.add(new Product(rset.getInt(1), rset.getString(2),
						rset.getString(3), rset.getInt(4), rset.getInt(5)));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int getListCount(Connection conn) {
		int listCount = 0;

		Statement stmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("getListCount");

		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);

			if (rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return listCount;
	}

	public int getListCount(Connection conn, String data) {
		int listCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("getListCount2");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, data);
			rset = pstmt.executeQuery();

			if (rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
	}

	public int buyProduct(Connection con, int price, int loginUser) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("buyProduct");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, price);
			pstmt.setInt(2, loginUser);
			pstmt.setInt(3, price);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public int getPrice(Connection con, int proNum) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("getPrice");
		int result = 0;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, proNum);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	public int decrease(Connection con, int proNum) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("decreasePro");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, proNum);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateOrder(Connection con, int proNum, int loginUser) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertOrder");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, loginUser);
			pstmt.setInt(2, proNum);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertProduct(Connection con, Product p) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertProduct");
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, p.getPro_name());
			pstmt.setString(2, p.getPro_type());
			pstmt.setInt(3, p.getRemain());
			pstmt.setInt(4, p.getPrice());
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteProduct(Connection con, int pronum) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("deleteProduct");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pronum);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	

}
