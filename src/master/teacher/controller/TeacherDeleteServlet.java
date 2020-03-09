package master.teacher.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import master.teacher.model.service.TeacherService;

/**
 * Servlet implementation class TeacherDeleteServlet
 */
@WebServlet("/delete.te")
public class TeacherDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TeacherDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String t_code = request.getParameter("t_code");
		int result = new TeacherService().deleteTeacher(t_code);
		if(result > 0) {
			request.getRequestDispatcher("list.te").forward(request, response);
		}else {
			request.getRequestDispatcher("views/common/error.jsp").forward(request, response);
			request.setAttribute("msg", "강사 삭제에 실패했습니다.");
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
