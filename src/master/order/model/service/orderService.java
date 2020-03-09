package master.order.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import master.order.model.dao.orderDao;
import master.order.model.vo.Order;

public class orderService {
				// 주문 처리 전 리스트 갯수 조회 서비스
			public int getListCount() {
				Connection conn = getConnection();
				
				int listCount = new orderDao().getListCount(conn);
				
				close(conn);
				
				return listCount;
			}
			
				// 주문 처리 후 리스트 갯수 조회 서비스2
				public int getListCount2() {
					Connection conn = getConnection();
					
					int listCount = new orderDao().getListCount2(conn);
					
					close(conn);
						
					return listCount;
				}

				
				// 리스트 갯수 조회
				public ArrayList<Order> orderBeforeList(int currentPage, int orderLimit) {
					Connection conn = getConnection();
					ArrayList<Order> list = new orderDao().orderBeforeList(conn, currentPage, orderLimit);
					
					close(conn);
					return list;
				}
				//리스트 2 갯수 조회
				public ArrayList<Order> orderAfterList(int currentPage, int orderLimit) {
					Connection conn = getConnection();
					ArrayList<Order> list2 = new orderDao().orderAfterList(conn, currentPage, orderLimit);
					
					close(conn);
					return list2;
				}
}
