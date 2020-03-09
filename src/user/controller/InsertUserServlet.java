package user.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.model.service.userService;
import user.model.vo.User;

/**
 * Servlet implementation class InsertUserServlet
 */
@WebServlet("/insert.us")
public class InsertUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String userName = request.getParameter("userName");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String gender = request.getParameter("gender");
		String userNo = request.getParameter("userNo");
		String address1 = request.getParameter("address1");
		String address2 = request.getParameter("address2");
		String address3 = request.getParameter("address3");
		String address4 = request.getParameter("address4");
		String address5 = request.getParameter("address5");
		
		String alias = request.getParameter("alias");
		
		//User user = new User(userName, userId, userPwd, gender, userNo, alias);
		User user = new User(userName, userId, userPwd, email, phone, gender, userNo, address1+", "+address2+", "+address3 + ", "+address4+", "+address5, alias);
		int result = new userService().insertUser(user);
		
		if(result > 0) {
			request.getSession().setAttribute("msg", "회원가입이 완료되었습니다.");
			response.sendRedirect(request.getContextPath());
		}else {
			request.setAttribute("msg", "회원가입에 실패하였습니다.");
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
