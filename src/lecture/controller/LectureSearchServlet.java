package lecture.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lecture.model.service.LectureService;
import lecture.model.vo.Lecture;
import lecture.model.vo.UserClass;
import user.model.service.userService;
import user.model.vo.User;

/**
 * Servlet implementation class LectureSearchServlet
 */
@WebServlet("/search.le")
public class LectureSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LectureSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		User loginUser = (User)request.getSession().getAttribute("loginUser");
		
		if(loginUser != null) {
		String keyword = request.getParameter("searchKeyword");
		String condition = request.getParameter("searchCondition");
		
		
		int user_code = Integer.parseInt((String.valueOf(loginUser.getUserCode())));
		ArrayList<UserClass> list2 = new userService().buyLectureList(user_code);
		
		ArrayList<Lecture> list = new LectureService().searchLecture(keyword, condition);
		
		request.setAttribute("list", list);
		request.setAttribute("list2", list2);
		request.setAttribute("keyword", keyword);
		
		RequestDispatcher view = request.getRequestDispatcher("views/lectureAttendPage/main.jsp");
		view.forward(request, response);
		}
		
		else {
			
			String keyword = request.getParameter("searchKeyword");
			String condition = request.getParameter("searchCondition");
			
			ArrayList<Lecture> list = new LectureService().searchLecture(keyword, condition);
			
			request.setAttribute("list", list);
			request.setAttribute("keyword", keyword);
			
			RequestDispatcher view = request.getRequestDispatcher("views/lectureAttendPage/main.jsp");
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
