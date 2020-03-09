package master.teacher.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import master.teacher.model.service.reportService;

/**
 * Servlet implementation class ReportInsertServlet
 */
@WebServlet("/insert.re")
public class ReportInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String r_content = request.getParameter("r_content");
		String r_number= request.getParameter("r_number");
		String b_code = request.getParameter("b_code");
		String user_code = request.getParameter("user_code");
		
		int result = new reportService().insertReport(r_content, r_number, b_code, user_code);
		
		if(result > 0) {
			response.sendRedirect(request.getContextPath() + "/views/masterPage/endReport.jsp");
		}else {
			request.setAttribute("msg", "게시판 작성에 실패하였습니다.");
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
