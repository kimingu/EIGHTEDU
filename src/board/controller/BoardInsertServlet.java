package board.controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Board;
import user.model.vo.User;

/**
 * Servlet implementation class insertBoard
 */
@WebServlet("/insert.bo")
public class BoardInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BoardInsertServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("utf-8");

		User loginUser = (User) request.getSession().getAttribute("loginUser");
		String aliass = String.valueOf(loginUser.getAliass());

		String board_title = request.getParameter("board_title");
		String board_content = request.getParameter("board_content");
		int m_code = Integer.parseInt(request.getParameter("select_m_code"));
		String b_name = request.getParameter("select_b_name");
		

		Board b = new Board(m_code, board_title, board_content,  b_name,aliass);

		int result = new BoardService().insertBoard(b);
		
		if (result > 0) {
			response.sendRedirect(request.getContextPath() + "/list.bo?b_name="+URLEncoder.encode(b_name,"utf-8"));
			
		} else {
			request.setAttribute("msg", "게시판 작성에 실패하였습니다.");
			request.getRequestDispatcher("views/common/error.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
