package user.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.model.service.userService;
import user.model.vo.User;

/**
 * Servlet implementation class LoginKakaoServlet
 */
@WebServlet("/loginKakao.us")
public class LoginKakaoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginKakaoServlet() {
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
		String userId = request.getParameter("userIdKakao");
		String userPwd = request.getParameter("userPwdKakao");
		String userName = request.getParameter("userName");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String gender = request.getParameter("gender");
		String address = request.getParameter("address");
		String alias = request.getParameter("userIdKakao");
		User user = new User(userName, userId, userPwd, email, phone, "m", "201900-0000000", address, alias);
		User loginUser = new userService().loginUser(user.getUserId(), user.getUserPwd());
		int result = 0;
		
		if(loginUser == null) { // 회원테이블에 없을 경우
			result = new userService().insertUser(user); // 새로 회원가입
			if (result > 0) { 
				loginUser = new userService().loginUser(user.getUserId(), user.getUserPwd());
				if (loginUser != null) {
					HttpSession session = request.getSession();
					session.setAttribute("loginUser", loginUser);
					request.getSession().setAttribute("msg", loginUser.getUserName() + "님의 방문을 환영합니다.");
					response.sendRedirect(request.getContextPath());
				} else { // 실패일 경우
					request.setAttribute("msg", "로그인 실패");

					RequestDispatcher view = request.getRequestDispatcher("views/common/error.jsp");
					view.forward(request, response);
				}

			} else {
				request.setAttribute("msg", "회원가입에 실패하였습니다.");
				request.getRequestDispatcher("views/common/error.jsp").forward(request, response);
			}
		}else {
			loginUser = new userService().loginUser(user.getUserId(), user.getUserPwd());
			if (loginUser != null) {
				HttpSession session = request.getSession();
				session.setAttribute("loginUser", loginUser);
				request.getSession().setAttribute("msg", loginUser.getUserName() + "님의 방문을 환영합니다.");
				response.sendRedirect(request.getContextPath());
			} else { // 실패일 경우
				request.setAttribute("msg", "로그인 실패");

				RequestDispatcher view = request.getRequestDispatcher("views/common/error.jsp");
				view.forward(request, response);
			}
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
