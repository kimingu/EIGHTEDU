package user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.model.service.userService;

/**
 * Servlet implementation class ChangePwdServlet
 */
@WebServlet("/changePwd.us")
public class ChangePwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePwdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String changePwd = request.getParameter("changePwd");
		
		int result = new userService().updatePwd(userId, userPwd, changePwd);
		if(result > 0) {
			request.getSession().setAttribute("msg", "비밀번호가 변경되었습니다.");
			response.sendRedirect(request.getContextPath()+"/views/myPage/complete.jsp");
		}else {
			request.getSession().setAttribute("msg", "비밀번호 변경에 실패했습니다.");
			response.sendRedirect(request.getContextPath()+"/views/myPage/complete.jsp");
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
