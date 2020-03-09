package lecture.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lecture.model.service.VideoService;
import lecture.model.vo.Video;

/**
 * Servlet implementation class ClassVideoDetailServlet 강의보기를 눌렀을때 이동하는 영상보는 구간
 */
@WebServlet("/detail.vi")
public class ClassVideoDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClassVideoDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int c_code = Integer.parseInt(request.getParameter("c_code"));
		Video video = new VideoService().selectLecture(c_code);
		
		String page = "";
		if(video != null) {
			request.setAttribute("video", video);
			page = "views/lectureAttendPage/lectureDetail.jsp";
		}
		else {
			request.setAttribute("msg", "해당 영상이 존재하지 않네요!.");
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
