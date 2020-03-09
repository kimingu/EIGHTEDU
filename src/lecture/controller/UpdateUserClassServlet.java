package lecture.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import lecture.model.service.LectureService;
import user.model.vo.User;

/**
 * Servlet implementation class UpdateUserClassServlet
 */
@WebServlet("/UpdateUserClass.le")
public class UpdateUserClassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUserClassServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		
		User loginUser = (User)request.getSession().getAttribute("loginUser");
		
		int user_code = Integer.parseInt((String.valueOf(loginUser.getUserCode())));
		
		
		int l_code = Integer.parseInt(request.getParameter("l_code"));
		
		System.out.println(l_code);
		System.out.println(user_code);
		
		
		
		int result = new LectureService().updateUserClass(l_code , user_code);
		
		if(result > 0) {
			request.setAttribute("msg", "해당 강좌를 수강 완료하였습니다.");
			response.sendRedirect("leclist.le");
			
			
		}else {
			request.setAttribute("msg", "수강 완료 실패!!");
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
