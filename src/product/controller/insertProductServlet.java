package product.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.model.service.productService;
import product.model.vo.Product;

/**
 * Servlet implementation class insertProductServlet
 */
@WebServlet("/insert.pro")
public class insertProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insertProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String proName = request.getParameter("proName");
		int remain = Integer.parseInt(request.getParameter("remain"));
		int price = Integer.parseInt(request.getParameter("price"));
		String type = request.getParameter("type");
		
		Product p = new Product(proName, remain, price, type);
		int result = new productService().insertProduct(p);
		if(result > 0) {
			request.getSession().setAttribute("msg", "상품등록에 성공하였습니다.");
			request.getRequestDispatcher("/ShopList.ma").forward(request, response);
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
