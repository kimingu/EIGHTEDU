package master.Video.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lecture.model.service.LectureService;
import lecture.model.vo.Lecture;
import master.Class.model.service.ClassService;
import master.Class.model.vo.Classs;
import master.Video.model.service.VideoService;
import master.Video.model.vo.Video;


/**
 * Servlet implementation class ClassUpdateFormServlet
 */
@WebServlet("/updateForm.video")
public class VideoUpdateFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet() 업데이트도 인서트 구문과 같게 강좌랑 강의를 들고가야 하므로 arrayList 두개 가지고 출발
     */
    public VideoUpdateFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<Classs> list = new ClassService().selectListASC();
		ArrayList<Lecture> list1 = new LectureService().selectListASC();
		
		int v_code = Integer.parseInt(request.getParameter("v_code"));
		
		Video video = new VideoService().selectVideo(v_code);
		
		String page = "";
		if(video != null) {
			request.setAttribute("video", video);
			request.setAttribute("list", list);
			request.setAttribute("list1", list1);
			
			
			page = "views/masterPage/videoUpdateForm.jsp";
		}else {
			request.setAttribute("msg", "강의등록 수정에 실패하였습니다.");
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
