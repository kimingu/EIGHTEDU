package notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.model.service.NoticeService;

/**
 * Servlet implementation class NoticeCheckServlet
 */
@WebServlet("/check.no")
public class NoticeCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int n_code = Integer.parseInt(request.getParameter("n_code"));
		String n_title = request.getParameter("n_title");
		String n_content = request.getParameter("n_content");
		String report1 = request.getParameter("report1");
		String report2 = request.getParameter("report2");
		int result = new NoticeService().checkNotice(n_code, n_title, n_content, report1, report2);
		if(result > 0) {
			request.setAttribute("n_code", n_code);
			request.getRequestDispatcher("/views/customerPage/end.jsp").forward(request, response);
		} else {
			request.setAttribute("msg", "게시글 수정에 실패했습니다.");
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
