package product.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import product.model.service.productService;
import user.model.service.userService;
import user.model.vo.User;

/**
 * Servlet implementation class buyProductServlet
 */
@WebServlet("/buyProduct.pro")
public class buyProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public buyProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int proNum = Integer.parseInt(request.getParameter("pronum"));
		int loginUserCode = Integer.parseInt(request.getParameter("loginUserCode"));
		
		int result = new productService().buyProduct(proNum, loginUserCode);
		User u = new userService().loginUser2(loginUserCode);
		if(result > 0 && u != null) {
			request.getSession().invalidate();
			HttpSession session = request.getSession();
	        session.setAttribute("loginUser", u);
			
			request.getSession().setAttribute("msg", "구매완료");
			response.sendRedirect(request.getContextPath()+"/views/myPage/complete2.jsp");
		}else {
			request.getSession().setAttribute("msg", "구매실패(재고 또는 포인트가 부족합니다)");
			response.sendRedirect(request.getContextPath()+"/views/myPage/complete2.jsp");
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
