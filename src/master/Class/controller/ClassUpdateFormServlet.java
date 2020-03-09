package master.Class.controller;

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

/**
 * Servlet implementation class ClassUpdateFormServlet
 */
@WebServlet("/updateForm.cl")
public class ClassUpdateFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClassUpdateFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		ArrayList<Lecture> list = new LectureService().selectListASC();
		request.setAttribute("list", list);
		
		int c_code = Integer.parseInt(request.getParameter("c_code"));
		
		Classs classs = new ClassService().selectLecture(c_code);
		
		String page = "";
		if(classs != null) {
			request.setAttribute("classs", classs);
			request.setAttribute("list", list);
			page = "views/masterPage/classUpdateForm.jsp";
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
