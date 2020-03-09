package board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Board;
import user.model.vo.User;

/**
 * Servlet implementation class updateBoard
 */
@WebServlet("/update.bo")
public class BoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BoardUpdateServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		User loginUser = (User)request.getSession().getAttribute("loginUser");
		String aliass = String.valueOf(loginUser.getAliass());
		
		int b_code = Integer.parseInt(request.getParameter("b_code"));
		String b_title = request.getParameter("update_title");
		String b_content = request.getParameter("update_content");
		String b_name = request.getParameter("select_b_name");	
		int m_code = Integer.parseInt(request.getParameter("select_m_code"));
	
		Board board = new Board();
		board.setB_code(b_code);
		board.setB_name(b_name);
		board.setB_title(b_title);
		board.setB_content(b_content);
		board.setM_code(m_code);
		
		
		int result = new BoardService().updateBoard(board);

		if(result > 0) {
			request.getRequestDispatcher("detail.bo").forward(request, response);
		}else {
			request.setAttribute("msg", "게시글 수정에 실패했습니다.");
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
