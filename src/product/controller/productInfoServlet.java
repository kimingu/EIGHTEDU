package product.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class productInfoServlet
 */
@WebServlet("/productInfo.pro")
public class productInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public productInfoServlet() {
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
		String proname = request.getParameter("proname"); 
		int proprice = Integer.parseInt(request.getParameter("proprice")); 
		int remain = Integer.parseInt(request.getParameter("remain")); 
		
		request.setAttribute("proNum", proNum);
		request.setAttribute("loginUserCode", loginUserCode);
		request.setAttribute("proname", proname);
		request.setAttribute("proprice", proprice);
		request.setAttribute("remain", remain);
		request.getRequestDispatcher("views/myPage/productInfo.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
