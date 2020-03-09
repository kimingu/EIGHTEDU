package notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.model.service.NoticeService;
import notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeUpdateServlet
 */
@WebServlet("/update.no")
public class NoticeUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("UTF-8");

		int n_code = Integer.parseInt(request.getParameter("n_code"));
		String n_title = request.getParameter("n_title");
		String n_content = request.getParameter("n_content");
		String n_name = request.getParameter("select_n_name");
		int m_code = Integer.parseInt(request.getParameter("select_m_code"));
		Notice notice = new Notice();
		notice.setN_code(n_code);
		notice.setN_title(n_title);
		notice.setN_content(n_content);
		notice.setN_name(n_name);
		notice.setM_code(m_code);
		
		int result = new NoticeService().updateNotice(notice);
		
		if(result > 0) {
			request.getRequestDispatcher("detail.no").forward(request, response);
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
