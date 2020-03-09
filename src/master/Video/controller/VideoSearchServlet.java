package master.Video.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import master.Video.model.service.VideoService;
import master.Video.model.vo.PageInfo;
import master.Video.model.vo.Video;


/**
 * Servlet implementation class VideoSearchServlet
 */
@WebServlet("/search.vi")
public class VideoSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VideoSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String keyword = request.getParameter("searchKeyword");
		String condition = request.getParameter("searchCondition");
		
		int listCount = VideoService.getListSearchCount(keyword, condition);
		int currentPage;		// 현재 페이지
		int pageLimit;			// 한 페이지 하단에 보여질 페이지 수
		int maxPage;			// 전체 페이지에 가장 마지막 페이지
		int startPage;			// 한 페이지 하단에 보여질 시작 페이지
		int endPage;			// 한 페이지 하단에 보여질 끝 페이지
		
		int videoLimit = 10;	// 한 페이지에 보여질 게시글 최대 수
		
		currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		pageLimit = 10;
		
		maxPage = (int)Math.ceil((double)listCount/videoLimit);
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		endPage = startPage + pageLimit - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, videoLimit);
		
		ArrayList<Video> list = new VideoService().searchVideo(keyword, condition, currentPage, videoLimit); 
		
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
		request.setAttribute("keyword", keyword);
		request.setAttribute("condition", condition);
		
		RequestDispatcher view = request.getRequestDispatcher("views/masterPage/video.jsp");			
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
