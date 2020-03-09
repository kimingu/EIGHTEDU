package user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.model.service.userService;
import user.model.vo.User;

/**
 * Servlet implementation class updateUserPointServlet
 */
@WebServlet("/updateUserPoint.us")
public class updateUserPointServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateUserPointServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("UTF-8");
      int userCode = Integer.parseInt(request.getParameter("userCode"));
      int point = Integer.parseInt(request.getParameter("point"));
      User u = new userService().loginUser2(userCode);
      u.setPoint(u.getPoint() + point);
      User loginUser = new userService().updateUserPoint(u);
      if(loginUser != null) {
         request.getSession().invalidate();
         HttpSession session = request.getSession();
           session.setAttribute("loginUser", loginUser);
         
         request.getSession().setAttribute("msg", "충전완료");
         response.sendRedirect(request.getContextPath()+"/views/myPage/complete.jsp");
      }else {
         request.getSession().setAttribute("msg", "충전실패");
         response.sendRedirect(request.getContextPath()+"/views/myPage/complete.jsp");
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