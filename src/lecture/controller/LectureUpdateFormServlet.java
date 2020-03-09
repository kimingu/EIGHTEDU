package lecture.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lecture.model.service.LectureService;
import lecture.model.vo.Lecture;

/**
 * Servlet implementation class LectureUpdateFormServlet
 */
@WebServlet("/updateForm.le")
public class LectureUpdateFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LectureUpdateFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int l_code = Integer.parseInt(request.getParameter("l_code"));
		
		Lecture lecture = new LectureService().selectLecture(l_code);
		
		String page = "";
		if(lecture != null) {
			request.setAttribute("lecture", lecture);
			page = "views/lectureAttendPage/lectureUpdateForm.jsp";
		}else {
			request.setAttribute("msg", "강좌등록 조회에 실패하였습니다.");
			page = "views/common/error.jsp";
			
		}
		request.getRequestDispatcher(page).forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
