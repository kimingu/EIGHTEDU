package notice.controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import notice.model.service.NoticeService;
import notice.model.vo.Notice;
import user.model.vo.User;

/**
 * Servlet implementation class NoticeInsertServlet
 */
@WebServlet("/insert.no")
public class NoticeInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		User loginUser = (User)request.getSession().getAttribute("loginUser");
		String aliass = String.valueOf(loginUser.getAliass());
		
		String n_title = request.getParameter("n_title");
		String n_content = request.getParameter("n_content");
		int m_code = Integer.parseInt(request.getParameter("select_m_code"));
		String n_name = request.getParameter("select_n_name");
		Notice n = new Notice(m_code, aliass, n_title, n_content, n_name);
		int result = new NoticeService().insertNotice(n);
		if(result > 0) {
			response.sendRedirect(request.getContextPath() + "/list.no?n_name="+URLEncoder.encode(n_name, "UTF-8"));
		}else {
			request.setAttribute("msg", "게시글 등록에 실패했습니다.");
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
