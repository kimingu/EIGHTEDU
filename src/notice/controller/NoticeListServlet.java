package notice.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import notice.model.vo.PageInfo;
import notice.model.service.NoticeService;
import notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeListServlet
 */
@WebServlet("/list.no")
public class NoticeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String n_name = "";	
		String data = request.getParameter("data");
		if(data == null) {
			n_name = request.getParameter("n_name");
		}else if(data.equals("300") || data.equals("301") || data.equals("302") || data.equals("303") || data.equals("304") || data.equals("305")) {
			n_name = "공지사항";
		}else if(data.equals("310") || data.equals("311") || data.equals("312") || data.equals("313") || data.equals("314") || data.equals("315")) {
			n_name = "qna";
		}else if(data.equals("320") || data.equals("321") || data.equals("322") || data.equals("323") || data.equals("324") || data.equals("325")) {
			n_name = "문의내역";
		}
		
		if(data == null || data.equals("300") || data.equals("310") || data.equals("320")) {
			
			int listCount = NoticeService.getListCount(n_name);
			int currentPage;		// 현재 페이지
			int pageLimit;			// 한 페이지 하단에 보여질 페이지 수
			int maxPage;			// 전체 페이지에 가장 마지막 페이지
			int startPage;			// 한 페이지 하단에 보여질 시작 페이지
			int endPage;			// 한 페이지 하단에 보여질 끝 페이지
			
			int noticeLimit = 10;	// 한 페이지에 보여질 게시글 최대 수
			
			currentPage = 1;
			
			if(request.getParameter("currentPage") != null) {
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
			}
			
			pageLimit = 10;
			
			maxPage = (int)Math.ceil((double)listCount/noticeLimit);
			startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
			
			endPage = startPage + pageLimit - 1;
			
			if(maxPage < endPage) {
				endPage = maxPage;
			}
			
			PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, noticeLimit);
			
			ArrayList<Notice> list = new NoticeService().selectList(currentPage, noticeLimit, n_name);
			
			request.setAttribute("list", list);
			request.setAttribute("n_name", n_name);
			request.setAttribute("pi", pi);
			
			RequestDispatcher view = request.getRequestDispatcher("views/customerPage/notice.jsp");			
			view.forward(request, response);				
		}else {
			int listCount = NoticeService.getListCount2(data);
			int currentPage;		// 현재 페이지
			int pageLimit;			// 한 페이지 하단에 보여질 페이지 수
			int maxPage;			// 전체 페이지에 가장 마지막 페이지
			int startPage;			// 한 페이지 하단에 보여질 시작 페이지
			int endPage;			// 한 페이지 하단에 보여질 끝 페이지
			
			int noticeLimit = 10;	// 한 페이지에 보여질 게시글 최대 수
			
			currentPage = 1;
			
			if(request.getParameter("currentPage") != null) {
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
			}
			
			pageLimit = 10;
			
			maxPage = (int)Math.ceil((double)listCount/noticeLimit);
			startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
			
			endPage = startPage + pageLimit - 1;
			
			if(maxPage < endPage) {
				endPage = maxPage;
			}
			
			PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, noticeLimit);
			
			ArrayList<Notice> list = new NoticeService().selectList2(currentPage, noticeLimit, data);
						
			request.setAttribute("list", list);
			request.setAttribute("data", data);
			request.setAttribute("pi", pi);
			request.setAttribute("n_name", n_name);
			
			RequestDispatcher view = request.getRequestDispatcher("views/customerPage/notice.jsp");			
			view.forward(request, response);
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
