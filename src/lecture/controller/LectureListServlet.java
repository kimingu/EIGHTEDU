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
 * Servlet implementation class selecLeclistServlet
 */
@WebServlet("/leclist.le")
public class LectureListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LectureListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		User loginUser = (User)request.getSession().getAttribute("loginUser");
		if(loginUser != null) {
			int user_code = Integer.parseInt((String.valueOf(loginUser.getUserCode())));
			ArrayList<Lecture> list = new LectureService().selectList();
			ArrayList<UserClass> list2 = new userService().buyLectureList(user_code);
			
			
			request.setAttribute("list", list);
			request.setAttribute("list2", list2);
			request.setAttribute("title", "교실"); // 처음 전체화면 보여주기 위한 뷰

			RequestDispatcher view = request.getRequestDispatcher("views/lectureAttendPage/main.jsp");
			view.forward(request, response);
			
		}else {
			
			ArrayList<Lecture> list = new LectureService().selectList();
			request.setAttribute("list", list);
			request.setAttribute("title", "교실"); // 처음 전체화면 보여주기 위한 뷰
			
			
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
