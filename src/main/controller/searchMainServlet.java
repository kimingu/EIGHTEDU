package main.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import board.model.service.BoardService;
import board.model.vo.Board;
import board.model.vo.PageInfo;
import lecture.model.service.LectureService;
import lecture.model.vo.Lecture;
import notice.model.service.NoticeService;
import notice.model.vo.Notice;
import product.model.service.productService;
import product.model.vo.Product;

/**
 * Servlet implementation class searchMainServlet
 */
@WebServlet("/search.main")
public class searchMainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public searchMainServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String search = request.getParameter("searchInputArea");
		String ajax = request.getParameter("ajax");

		if (ajax == null) {

			ArrayList<Product> listP = new productService().selectKeyWordList(search);
			ArrayList<Board> listB = new BoardService().selectKeyWordList(search);
			ArrayList<Lecture> listL = new LectureService().selectKeyWordtList(search);
			ArrayList<Notice> listN = new NoticeService().selectKeyWordList(search);
			request.setAttribute("listP", listP);
			request.setAttribute("listB", listB);
			request.setAttribute("listL", listL);
			request.setAttribute("listN", listN);

			request.setAttribute("searchResult", search);
			request.getRequestDispatcher("views/mainPage/mainSearch.jsp").forward(request, response);
		}else {
			ArrayList<Product> listP = new productService().selectKeyWordList(search);
			ArrayList<Board> listB = new BoardService().selectKeyWordList(search);
			ArrayList<Lecture> listL = new LectureService().selectKeyWordtList(search);
			ArrayList<Notice> listN = new NoticeService().selectKeyWordList(search);
			
			
			HashMap h = new HashMap<>();
			h.put(listP, listP);
			h.put(listB, listB);
			h.put(listL, listL);
			h.put(listN, listN);
			h.put(search, search);
			response.setContentType("application/json; charset=utf-8");
			// 응답할 객체, 응답할 스트림
			Gson g = new Gson();
			g.toJson(h, response.getWriter());
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
