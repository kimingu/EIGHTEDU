package master.Class.controller;

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

import lecture.model.service.LectureService;
import lecture.model.vo.Lecture;
import master.Class.model.service.ClassService;
import master.Class.model.vo.Classs;
import master.Class.model.vo.PageInfo;


/**
 * Servlet implementation class SelectClasslistServlet
 */
@WebServlet("/list.cl")
public class ClassListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClassListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String data = request.getParameter("data"); // ajax에서 받은 값을 반환
		if(data == null) {
		
		ClassService cService = new ClassService();
		int listCount = cService.getListCount();
		
		
		
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
		
		ArrayList<Classs> list =  cService.selectList(currentPage, boardLimit);
		
		RequestDispatcher view = request.getRequestDispatcher("views/masterPage/class.jsp");
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
	
		
		view.forward(request, response);
		}
		
		else {
			ArrayList<Classs> list = new ClassService().selectList(data);
			ArrayList<Lecture> list1 = new LectureService().selectListASC();
			System.out.println(list);
			System.out.println(list1);
			
			HashMap h = new HashMap<>();
			h.put(list, list);
			h.put(list1, list);
			
			response.setContentType("application/json; charset=utf-8");
			
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
