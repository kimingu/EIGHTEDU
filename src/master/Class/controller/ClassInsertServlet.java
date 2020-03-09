package master.Class.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import master.Class.model.service.ClassService;
import master.Class.model.vo.Classs;
import user.model.vo.User;

/**
 * Servlet implementation class InsertClasslistServlet
 */
@WebServlet("/insert.cl")
public class ClassInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClassInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		
		String c_title = request.getParameter("c_title");
		String c_time = request.getParameter("c_time");
		int c_next = Integer.parseInt(request.getParameter("c_next"));	
		String l_title = request.getParameter("l_title");
		String t_name = request.getParameter("t_name");
		
	
		
		Classs c = new Classs(c_title,c_time,c_next,l_title,t_name);
		
		int result = new ClassService().insertBoard(c);
		
		response.sendRedirect(request.getContextPath() + "/list.cl");
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
