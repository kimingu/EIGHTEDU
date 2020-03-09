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
 * Servlet implementation class ClassDetailServlet
 */
@WebServlet("/detail.video")
public class VideoDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VideoDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int v_code = Integer.parseInt(request.getParameter("v_code"));
		
		Video video = new VideoService().selectVideo(v_code);
		
		String page = "";
		if(video != null) {
			request.setAttribute("video", video);
			page = "views/masterPage/videoInformation.jsp";
			
		}else {
			request.setAttribute("msg", "상세보기에 실패했습니다.");
			page = "views/common/error.jsp";
		}
		
		request.getRequestDispatcher(page).forward(request, response);
		
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
