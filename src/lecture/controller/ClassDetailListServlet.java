package lecture.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import master.Class.model.service.ClassService;
import master.Class.model.vo.Classs;

/**
 * Servlet implementation class ClassDetailListServlet 해당 강의의 강좌를 보는 리스트! 강의보기
 */
@WebServlet("/detaillist.le")
public class ClassDetailListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClassDetailListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int l_code = Integer.parseInt(request.getParameter("l_code"));
		
		ArrayList<Classs> list = new ClassService().selectLectureClass(l_code);

		request.setAttribute("list", list);
		
		RequestDispatcher view = request.getRequestDispatcher("views/lectureAttendPage/class.jsp");
		view.forward(request, response);
		
		
		//Classs classs = new ClassService().selectLectureClass(l_code);
		

		//String page = "";
		//if(classs != null) {
		//	request.setAttribute("classs", classs);
		//	page = "views/lectureAttendPage/class.jsp";
			
		//}else {
		//	request.setAttribute("msg", "상세보기에 실패했습니다.");
		//	page = "views/common/error.jsp";
		//}
		
		//request.getRequestDispatcher(page).forward(request, response);
		
		
		
		
	}
		

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
