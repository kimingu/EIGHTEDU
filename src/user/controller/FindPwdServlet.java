package user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.model.service.userService;
import user.model.vo.User;

/**
 * Servlet implementation class FindPwdServlet
 */
@WebServlet("/findPwd.us")
public class FindPwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindPwdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String userName = request.getParameter("userName");
		String userId = request.getParameter("userId");
		
		User u = new userService().searchPwd(userName, userId);
		String randPwd = (int)(Math.random() * 100000 + 100000) + "";
		if(u != null) {
			int update = new userService().updatePwd(u.getUserId(), u.getUserPwd(), randPwd);
			if(update > 0) {
				request.getSession().setAttribute("msg", "회원님의 임시비밀번호 : " + randPwd);
				response.sendRedirect("views/loginPage/FindPwd.jsp");
			}
		}else {
			request.setAttribute("msg", "해당 정보를 가진 회원이 없습니다.");
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
