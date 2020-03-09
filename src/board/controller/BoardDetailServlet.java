package board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Board;
import board.model.vo.BoardComment;


/**
 * Servlet implementation class BoardDetailServlet
 */
@WebServlet("/detail.bo")
public class BoardDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int b_code = Integer.parseInt(request.getParameter("b_code"));
		Board board = null;

		boolean flag = false;
		Cookie[] cookies = request.getCookies();
		if(cookies != null) {
		
			for(Cookie c : cookies) {
				if(c.getName().equals("b_code"+b_code)) {
				
					flag = true;
				}
			}
			if(!flag) {
		
				board = new BoardService().selectBoard(b_code);
				Cookie c1 = new Cookie("b_code"+b_code,String.valueOf(b_code));
				c1.setMaxAge(1 * 24 * 60 * 60);
				response.addCookie(c1);
			
			
				
			}else {
				board = new BoardService().selectBoardNoCnt(b_code);
				
			}
		}
		ArrayList<BoardComment> rlist = new BoardService().selectReplyList(b_code);
		if(board != null) {
		request.setAttribute("board", board);
		
		// ajax
	    request.setAttribute("rlist", rlist);

		request.getRequestDispatcher("views/communityPage/detailBoard.jsp").forward(request, response);
		
		}else {
			request.setAttribute("msg", "게시판 상세 조회에 실패하였습니다.");
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
