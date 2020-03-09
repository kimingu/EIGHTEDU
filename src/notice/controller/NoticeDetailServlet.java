package notice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.model.service.NoticeService;
import notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeDetailServlet
 */
@WebServlet("/detail.no")
public class NoticeDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int n_code = Integer.parseInt(request.getParameter("n_code"));
		String n_name = (String)request.getParameter("n_name");
		
		Notice notice = null;

		boolean flag = false;
		Cookie[] cookies = request.getCookies();
		if(cookies != null) {
		
			for(Cookie c : cookies) {
				if(c.getName().equals("n_code"+n_code)) {
				
					flag = true;
				}
			}
			if(!flag) {
		
				notice = new NoticeService().selectNotice(n_code);
				Cookie c1 = new Cookie("n_code"+n_code,String.valueOf(n_code));
				c1.setMaxAge(1 * 24 * 60 * 60);
				response.addCookie(c1);
			}else {
				notice = new NoticeService().selectNoticeNoCnt(n_code);
			}
		}
	
		if(notice != null) {
		request.setAttribute("notice", notice);
	
		request.getRequestDispatcher("views/customerPage/detailNotice.jsp").forward(request, response);
		
		}else {
			request.setAttribute("msg", "게시판 상세 조회에 실패하였습니다.");
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
