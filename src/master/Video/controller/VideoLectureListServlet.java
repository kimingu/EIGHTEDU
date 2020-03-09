package master.Video.controller;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lecture.model.service.LectureService;
import lecture.model.vo.Lecture;
import master.Class.model.service.ClassService;
import master.Class.model.vo.Classs;
import master.Class.model.vo.PageInfo;

/**
 * Servlet implementation class ClassLectureListServlet
 */
@WebServlet("/list.chvideo")
public class VideoLectureListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VideoLectureListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		
		
		ArrayList<Classs> list = new ClassService().selectListASC();
		ArrayList<Lecture> list1 = new LectureService().selectListASC();

		
		request.setAttribute("list", list);
		request.setAttribute("list1", list1);
		
		RequestDispatcher view = request.getRequestDispatcher("views/masterPage/insertVideo.jsp");
		view.forward(request, response);
		
		


	}
		
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
