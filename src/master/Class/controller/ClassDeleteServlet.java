package master.Class.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import master.Class.model.service.ClassService;

/**
 * Servlet implementation class ClassDeleteServlet
 */
@WebServlet("/delete.cl")
public class ClassDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClassDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int c_code = Integer.parseInt(request.getParameter("c_code"));
		
		int result = new ClassService().deleteClass(c_code);
		
		if(result > 0) {
			response.sendRedirect("list.cl");
		}else {
			request.setAttribute("msg", "강좌 삭제를 실패했습니다.");
			request.getRequestDispatcher("views/common/error.jsp");
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
