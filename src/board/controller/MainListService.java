package board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Board;

/**
 * Servlet implementation class MainListService
 */
@WebServlet("/mainList.bo")
public class MainListService extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainListService() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		ArrayList<Board> listEng = new BoardService().mainselectEngList();
		request.setAttribute("listEng", listEng);
		
		ArrayList<Board> listJp = new BoardService().mainselectJpList();
		request.setAttribute("listJp", listJp);
		
		ArrayList<Board> listCh = new BoardService().mainselectChList();
		request.setAttribute("listCh", listCh);
		
		ArrayList<Board> listDt = new BoardService().mainselectDtList();
		request.setAttribute("listDt", listDt);
		
		RequestDispatcher view = request.getRequestDispatcher("views/communityPage/mainBoard.jsp");
		view.forward(request, response);
		

	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
