package master.order.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import master.order.model.service.orderService;
import master.order.model.vo.Order;
import master.order.model.vo.PageInfo;

/**
 * Servlet implementation class OrderListServlet
 */
@WebServlet("/list.or")
public class OrderListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		orderService oService = new orderService();
		
		int listCount = oService.getListCount(); // 회원 리스트 총 갯수

		
		int currentPage;
		int pageLimit;
		int maxPage;
		int startPage;
		int endPage;
		
		int orderLimit = 10;
		
		currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		pageLimit = 10;

		maxPage = (int)Math.ceil((double)listCount/orderLimit);

		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;

		endPage = startPage + pageLimit - 1;

		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		//2
		int listCount2 = oService.getListCount2(); // 회원 리스트 총 갯수
		
		int currentPage2;
		int pageLimit2;
		int maxPage2;
		int startPage2;
		int endPage2;
		
		int orderLimit2 = 10;
		
		currentPage2 = 1;
		
		if(request.getParameter("currentPage2") != null) {
			currentPage2 = Integer.parseInt(request.getParameter("currentPage2"));
		}
		
		pageLimit2 = 10;

		maxPage2 = (int)Math.ceil((double)listCount2/orderLimit2);

		startPage2 = (currentPage2 - 1) / pageLimit2 * pageLimit2 + 1;

		endPage2 = startPage2 + pageLimit2 - 1;

		if(maxPage2 < endPage2) {
			endPage2 = maxPage2;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, orderLimit);
		PageInfo pi2 = new PageInfo(currentPage2, listCount2, pageLimit2, maxPage2, startPage2, endPage2, orderLimit2);

		
		ArrayList<Order> list = oService.orderBeforeList(currentPage, orderLimit);
		ArrayList<Order> list2 = oService.orderAfterList(currentPage2, orderLimit2);

		request.setAttribute("list", list);
		request.setAttribute("list2", list2);
		
		request.setAttribute("pi", pi);
		request.setAttribute("pi2", pi2);
		
		RequestDispatcher view = request.getRequestDispatcher("views/masterPage/shop_order.jsp");
		
		view.forward(request, response);
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
