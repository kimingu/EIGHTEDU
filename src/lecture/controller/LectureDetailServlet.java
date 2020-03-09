package lecture.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lecture.model.service.LectureService;
import lecture.model.vo.Lecture;
import lecture.model.vo.UserClass;
import user.model.service.userService;
import user.model.vo.User;

/**
 * Servlet implementation class LectureDetailServlet
 */
@WebServlet("/detail.le")
public class LectureDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LectureDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		User loginUser = (User)request.getSession().getAttribute("loginUser");
		
		
		if(loginUser != null) {
		int user_code = Integer.parseInt((String.valueOf(loginUser.getUserCode())));

		
		
		int l_code = Integer.parseInt(request.getParameter("l_code"));
		
		Lecture lecture = new LectureService().selectLecture(l_code);
		
		
		ArrayList<UserClass> list = new userService().buyLectureList(user_code); // 주의! LectureService가아닌 UserService로 감 
		// 내가 그동안 구매했던 강좌들의 목록들을 쭉 가져옴!
		
		ArrayList<UserClass> list2 = new ArrayList(); // 새로운 값을 추가하기위해 임의의 list2를 생성
		
		
		// 가져온 list(모든 강좌의)의 사이즈 만큼 반복해서 돌리지만,해당하는 유저의 코드 번호를 가져오며 그중 현재 세션에 유지되어있는 로그인
		// 유저와 동일한 경우에만 경우에만 해당값을 추가해서 가져간다.
		for(int i = 0; i < list.size(); i++) {
			if(list.get(i).getUser_code() == user_code) {
				list2.add(list.get(i));
			}
		}
		
		
		
		
		String page = "";
		if(lecture != null) {
			request.setAttribute("lecture", lecture);
			request.setAttribute("list", list2);
			page = "views/lectureAttendPage/lectureInformation.jsp";
			
		}else {
			request.setAttribute("msg", "상세보기에 실패했습니다.");
			page = "views/common/error.jsp";
		}
		
		request.getRequestDispatcher(page).forward(request, response);
		
		
		}else {
			int l_code = Integer.parseInt(request.getParameter("l_code"));
			Lecture lecture = new LectureService().selectLecture(l_code);
			
			
			String page = "";
			if(lecture != null) {
				request.setAttribute("lecture", lecture);
				page = "views/lectureAttendPage/lectureInformation.jsp";
				
			}else {
				request.setAttribute("msg", "상세보기에 실패했습니다.");
				page = "views/common/error.jsp";
			}
			
			request.getRequestDispatcher(page).forward(request, response);
			
			
			
			
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
