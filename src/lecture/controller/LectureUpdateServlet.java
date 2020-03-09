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
 * Servlet implementation class LectureUpdateServlet
 */
@WebServlet("/update.le")
public class LectureUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LectureUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String title = request.getParameter("title"); //강의제목
		int number = Integer.parseInt(request.getParameter("number"));
		int price = Integer.parseInt(request.getParameter("price"));
		String type = request.getParameter("type"); // 분류코드
		String content = request.getParameter("content"); // 강의 내용
		String t_name = request.getParameter("t_name"); // 강사선생님
		int l_code = Integer.parseInt(request.getParameter("l_code"));
		
		Lecture l = new Lecture(title, number, price, type, content,t_name, l_code);
		
		int result = new LectureService().updateLecture(l);
		
		if(result > 0) {
			response.sendRedirect("detail.le?l_code="+l_code);
			
			
		}else {
			request.setAttribute("msg", "강좌 등록 실패!!");
			request.getRequestDispatcher("views/common/error.jsp").forward(request, response);
			
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
