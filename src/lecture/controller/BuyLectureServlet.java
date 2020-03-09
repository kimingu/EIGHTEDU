package lecture.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import lecture.model.service.LectureService;
import user.model.service.userService;
import user.model.vo.User;

/**
 * Servlet implementation class BuyLectureServlet 강좌 구매하기에 대한 부분
 */
@WebServlet("/BuyLecture.le")
public class BuyLectureServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuyLectureServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int l_code = Integer.parseInt(request.getParameter("l_code"));
		int loginUserCode = Integer.parseInt(request.getParameter("loginUserCode"));
				
		int result = new LectureService().buyLecture(l_code, loginUserCode);
		
		User u = new userService().loginUser2(loginUserCode);
		
		if(result > 0 && u != null) { // 해당 유저의 정보가 0이 아닌경우 즉, 로그인이 되어있는 경우
			request.getSession().invalidate();
			HttpSession session = request.getSession();
	        session.setAttribute("loginUser", u);
			
			request.setAttribute("msg", "구매완료");
			response.sendRedirect(request.getContextPath()+"/leclist.le");
		}else {
			request.setAttribute("msg", "구매실패");
			response.sendRedirect(request.getContextPath()+"/leclist.le");
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
