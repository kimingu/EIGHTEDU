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
 * Servlet implementation class LectureChoiceListServlet
 */
@WebServlet("/choicelist.le")
public class LectureChoiceListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LectureChoiceListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User loginUser = (User)request.getSession().getAttribute("loginUser");
		
		
		
		String l_type = request.getParameter("l_type");
		

		if(loginUser != null && l_type.equals("나의교실")) {
			
			
			int user_code = Integer.parseInt((String.valueOf(loginUser.getUserCode())));
			
			ArrayList<UserClass> list2 = new userService().buyLectureList(user_code); // 구매하기 버튼 보이게 하는 조건

			
			ArrayList<Lecture> list = new LectureService().selectMyLecture(user_code); // 내가 구매한거 리스트를 보기위한 친구
			request.setAttribute("list", list);
			request.setAttribute("list2", list2);

			request.setAttribute("title", l_type);

			RequestDispatcher view = request.getRequestDispatcher("views/lectureAttendPage/main.jsp");
			view.forward(request, response);
		}
		
		else if(loginUser != null) {
		int user_code = Integer.parseInt((String.valueOf(loginUser.getUserCode())));
		ArrayList<Lecture> list = new LectureService().selectChoiceList(l_type);
		ArrayList<UserClass> list2 = new userService().buyLectureList(user_code); // 구매하기 버튼 보이게 하는 조건
		
		

			request.setAttribute("list", list);
			request.setAttribute("list2", list2);
			
			request.setAttribute("title", l_type);
			RequestDispatcher view = request.getRequestDispatcher("views/lectureAttendPage/main.jsp");
			view.forward(request, response);
		}else {
			
			ArrayList<Lecture> list = new LectureService().selectChoiceList(l_type);

			request.setAttribute("list", list);
			request.setAttribute("title", l_type);
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
