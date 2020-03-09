package master.Video.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import master.Video.model.service.VideoService;

/**
 * Servlet implementation class ClassDeleteServlet
 */
@WebServlet("/delete.video")
public class VideoDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VideoDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int v_code = Integer.parseInt(request.getParameter("v_code"));
		
		int result = new VideoService().deleteVideo(v_code);
		
		if(result > 0) {
			response.sendRedirect("list.video");
		}else {
			request.setAttribute("msg", "강좌 삭제를 실패했습니다.");
			request.getRequestDispatcher("views/common/error.jsp");
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
