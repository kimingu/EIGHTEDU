package master.teacher.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import master.teacher.model.service.BlackService;

/**
 * Servlet implementation class BlackCancelServlet
 */
@WebServlet("/clear.be")
public class BlackCancelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BlackCancelServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user_code = request.getParameter("user_code");
		int result = new BlackService().cancelBlack(user_code);
		if(result > 0) {
			request.getRequestDispatcher("list.be").forward(request, response);
		}else {
			request.getRequestDispatcher("views/common/error.jsp").forward(request, response);
			request.setAttribute("msg", "블랙리스트 철회에 실패했습니다.");
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
