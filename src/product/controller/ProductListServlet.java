package product.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.google.gson.Gson;

import board.model.vo.Board;
import board.model.vo.PageInfo;
import product.model.service.productService;
import product.model.vo.Product;

/**
 * Servlet implementation class ProductListServlet
 */
@WebServlet("/productList.pro")
public class ProductListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String data = request.getParameter("data");
		String msg = (String) request.getAttribute("msg");
				
		
		if(data == null) {
			int listCount = new productService().getListCount();
			
			int currentPage;		// 현재 페이지
			int pageLimit;			// 한 페이지 하단에 보여질 페이지 수
			int maxPage;			// 전체 페이지에 가장 마지막 페이지
			int startPage;			// 한 페이지 하단에 보여질 시작 페이지
			int endPage;			// 한 페이지 하단에 보여질 끝 페이지
			
			int boardLimit = 8;	// 한 페이지에 보여질 게시글 최대 수
			
			currentPage = 1;
			
			if(request.getParameter("currentPage") != null) {
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
			}
			pageLimit = 10;
			
			maxPage = (int)Math.ceil((double)listCount/boardLimit);
			
			startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
			
			endPage = startPage + pageLimit - 1;
			if(maxPage < endPage) {
				endPage = maxPage;
			}
			
			PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);
			
			ArrayList<Product> list = new productService().selectAllList(currentPage, boardLimit);
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
			request.setAttribute("msg", msg);
			request.getRequestDispatcher("views/myPage/pointShop.jsp").forward(request, response);
		}else if(data.equals("전체") || data == ""){
			int listCount = new productService().getListCount();
			
			int currentPage;		// 현재 페이지
			int pageLimit;			// 한 페이지 하단에 보여질 페이지 수
			int maxPage;			// 전체 페이지에 가장 마지막 페이지
			int startPage;			// 한 페이지 하단에 보여질 시작 페이지
			int endPage;			// 한 페이지 하단에 보여질 끝 페이지
			
			int boardLimit = 8;	// 한 페이지에 보여질 게시글 최대 수
			
			currentPage = 1;
			
			if(request.getParameter("currentPage") != null) {
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
			}
			pageLimit = 10;
			
			maxPage = (int)Math.ceil((double)listCount/boardLimit);
			
			startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
			
			endPage = startPage + pageLimit - 1;
			if(maxPage < endPage) {
				endPage = maxPage;
			}
			
			PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);
			
			
			ArrayList<Product> list = new productService().selectAllList(currentPage, boardLimit);
			HashMap h = new HashMap<>();
			h.put(list, list);
			h.put(pi, pi);
			h.put(data, data);
			
			response.setContentType("application/json; charset=utf-8");
			// 응답할 객체, 응답할 스트림
			Gson g = new Gson();
			g.toJson(h, response.getWriter());
		}
		else {
			int listCount = new productService().getListCount(data);
			
			int currentPage;		// 현재 페이지
			int pageLimit;			// 한 페이지 하단에 보여질 페이지 수
			int maxPage;			// 전체 페이지에 가장 마지막 페이지
			int startPage;			// 한 페이지 하단에 보여질 시작 페이지
			int endPage;			// 한 페이지 하단에 보여질 끝 페이지
			
			int boardLimit = 8;	// 한 페이지에 보여질 게시글 최대 수
			
			currentPage = 1;
			
			if(request.getParameter("currentPage") != null) {
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
			}
			pageLimit = 10;
			
			maxPage = (int)Math.ceil((double)listCount/boardLimit);
			
			startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
			
			endPage = startPage + pageLimit - 1;
			if(maxPage < endPage) {
				endPage = maxPage;
			}
			
			PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);
			
			
			ArrayList<Product> list = new productService().selectTypeList(data, currentPage, boardLimit);
			HashMap h = new HashMap<>();
			h.put(list, list);
			h.put(pi, pi);
			h.put(data, data);
			
			response.setContentType("application/json; charset=utf-8");
			// 응답할 객체, 응답할 스트림
			Gson g = new Gson();
			g.toJson(h, response.getWriter());
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
