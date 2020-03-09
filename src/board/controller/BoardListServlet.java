package board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Board;
import board.model.vo.PageInfo;
import notice.model.service.NoticeService;
import notice.model.vo.Notice;

/**
 * Servlet implementation class BoardListServlet
 */
@WebServlet("/list.bo")
public class BoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BoardListServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardService bService = new BoardService();
		request.setCharacterEncoding("utf-8");
		String b_name = "";
		String data  = request.getParameter("data");
		if(data == null) {
			b_name = request.getParameter("b_name");
		}else if(data.equals("100") || data.equals("101")|| data.equals("102")|| data.equals("103")|| data.equals("104")|| data.equals("105")) {
			b_name = "영어";
		}else if(data.equals("110")|| data.equals("111")|| data.equals("112")|| data.equals("113")|| data.equals("114")|| data.equals("115")) {
			b_name = "자료실";
		}else if(data.equals("120")|| data.equals("121")|| data.equals("122")|| data.equals("123")|| data.equals("124")|| data.equals("125")) {
			b_name = "일본어";
		}else if(data.equals("130")|| data.equals("131")|| data.equals("132")|| data.equals("133")|| data.equals("134")|| data.equals("135")) {
			b_name = "중국어";
		}
		
		if(data == null || data.equals("100") || data.equals("110")|| data.equals("120")|| data.equals("130")) {
			
		int listCount = bService.getListCount(b_name);
		int currentPage; // 현재 페이지
		int pageLimit; // 한 페이지 하단에 보여질 페이지 수
		int maxPage; // 전체 페이지에 가장 마지막 페이지
		int startPage; // 한 페이지 하단에 보여질 시작 페이지
		int endPage; // 한 페이지 하단에 보여질 끝 페이지

		int boardLimit = 10; // 한 페이지에 보여질 게시글 최대 수

		currentPage = 1;
		
		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		pageLimit = 10;

		maxPage = (int) Math.ceil((double) listCount / boardLimit);

		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;

		endPage = startPage + pageLimit - 1;

		if (maxPage < endPage) {
			endPage = maxPage;
		}

		PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);

		ArrayList<Board> list = bService.selectList(currentPage, boardLimit, b_name);
		request.setAttribute("list", list);
		request.setAttribute("b_name", b_name);
		request.setAttribute("pi", pi);
		
		RequestDispatcher view = request.getRequestDispatcher("views/communityPage/englishBoard.jsp");
		view.forward(request, response);
	}else {
		int listCount = BoardService.getListCount2(data);
		int currentPage;		// 현재 페이지
		int pageLimit;			// 한 페이지 하단에 보여질 페이지 수
		int maxPage;			// 전체 페이지에 가장 마지막 페이지
		int startPage;			// 한 페이지 하단에 보여질 시작 페이지
		int endPage;			// 한 페이지 하단에 보여질 끝 페이지
		
		int boardLimit = 10;	// 한 페이지에 보여질 게시글 최대 수
		
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
		
	
		ArrayList<Board> list = new BoardService().selectList2(currentPage, boardLimit, data);
					
		request.setAttribute("list", list);
		request.setAttribute("data", data);
		request.setAttribute("pi", pi);
		request.setAttribute("b_name", b_name);
		
		RequestDispatcher view = request.getRequestDispatcher("views/communityPage/englishBoard.jsp");			
		view.forward(request, response);
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
