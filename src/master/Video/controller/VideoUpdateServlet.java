package master.Video.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import master.Video.model.service.VideoService;
import master.Video.model.vo.Video;

/**
 * Servlet implementation class ClassUpdateServlet
 */
@WebServlet("/update.vi")
public class VideoUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VideoUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		
		String v_link = request.getParameter("v_link");
		String c_title  = request.getParameter("c_title");
		String l_title = request.getParameter("l_title");
		
		int v_code = Integer.parseInt(request.getParameter("v_code"));
		
		Video v = new Video(v_link, c_title, v_code, l_title);
		
		int result = new VideoService().updateVideo(v);
		
		if(result > 0) {
			response.sendRedirect("detail.video?v_code="+v_code);
			
			
		}else {
			request.setAttribute("msg", "강의 등록 실패!!");
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
