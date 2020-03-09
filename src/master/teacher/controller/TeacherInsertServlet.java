package master.teacher.controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import master.teacher.model.service.TeacherService;
import master.teacher.model.vo.Teacher;

/**
 * Servlet implementation class TeacherInsertServlet
 */
@WebServlet("/insert.te")
public class TeacherInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TeacherInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String t_name = request.getParameter("t_name");
		String t_phone = request.getParameter("t_phone");
		String t_address = request.getParameter("t_address");
		
		int result = new TeacherService().insertTeacher(t_name, t_phone, t_address);
		
		if(result > 0) {
			response.sendRedirect(request.getContextPath() + "/list.te");
		}else {
			request.setAttribute("msg", "강사 등록에 실패하였습니다.");
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
