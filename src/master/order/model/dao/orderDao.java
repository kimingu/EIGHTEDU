package master.order.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import master.order.model.vo.Order;

public class orderDao {
	private Properties prop = new Properties();

	// 회원 리스트 카운트
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
		
		// 회원 리스트 카운트2
		public int getListCount2(Connection conn) {
			int listCount = 0;

			Statement stmt = null;
			ResultSet rset = null;

			String sql = prop.getProperty("getListCount2");

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
		
		// 주문 리스트 조회
		public ArrayList<Order> orderBeforeList(Connection conn, int currentPage, int userLimit) {
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			ArrayList<Order> list = new ArrayList<>();
			String sql = prop.getProperty("orderBeforeList");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				int startRow = (currentPage - 1) * userLimit + 1;
				int endRow = startRow + userLimit - 1;
				
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					list.add(new Order(rset.getInt("order_Num"),
							rset.getInt("user_code"),
							rset.getInt("pro_num"),
							rset.getDate("order_date")));
				}
			}catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			return list;
		}


		//주문 리스트2 조회
		public ArrayList<Order> orderAfterList(Connection conn, int currentPage, int userLimit) {
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			ArrayList<Order> list = new ArrayList<>();
			String sql = prop.getProperty("orderAfterList");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				int startRow = (currentPage - 1) * userLimit + 1;
				int endRow = startRow + userLimit - 1;

				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					list.add(new Order(rset.getInt("order_Num"),
										rset.getInt("user_code"),
										rset.getInt("pro_num"),
										rset.getDate("order_date")));
				}
			}catch (SQLException e) {
					e.printStackTrace();
				} finally {
					close(rset);
					close(pstmt);
				}
				return list;
			}
		
}

