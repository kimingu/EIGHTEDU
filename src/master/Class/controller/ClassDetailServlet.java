package master.Class.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import master.Class.model.service.ClassService;
import master.Class.model.vo.Classs;

/**
 * Servlet implementation class ClassDetailServlet
 */
@WebServlet("/detail.cl")
public class ClassDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClassDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int c_code = Integer.parseInt(request.getParameter("c_code"));
		
		Classs classs = new ClassService().selectLecture(c_code);
		
		String page = "";
		if(classs != null) {
			request.setAttribute("classs", classs);
			page = "views/masterPage/classInformation.jsp";
			
		}else {
			request.setAttribute("msg", "상세보기에 실패했습니다.");
			page = "views/common/error.jsp";
		}
		
		request.getRequestDispatcher(page).forward(request, response);
		
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
