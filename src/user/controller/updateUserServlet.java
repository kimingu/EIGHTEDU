//업데이트 서블렛입니다

package user.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.model.service.userService;
import user.model.vo.User;

/**
 * Servlet implementation class UpdateUserServlet
 */
@WebServlet("/update.us")
public class updateUserServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       request.setCharacterEncoding("UTF-8");
       int userCode = Integer.parseInt(request.getParameter("userCode"));
         String userId = request.getParameter("userId");
      String userPwd = request.getParameter("userPwd");
      String userName = request.getParameter("userName");
      String email = request.getParameter("email");
      String phone = request.getParameter("phone");
      String gender = request.getParameter("gender");
      String userNo = request.getParameter("userNo");
      String address1 = request.getParameter("address1");
      String address2 = request.getParameter("address2");
      String address3 = request.getParameter("address3");
      String address4 = request.getParameter("address4");
      String address5 = request.getParameter("address5");
      String alias = request.getParameter("alias");
      User user = new User(userCode, userName, userId, userPwd, email, phone, gender, userNo, address1+", "+address2+", "+address3 + ", "+address4+", "+address5, alias);
        User updateUser = new userService().updateUser(user);
      
      if(updateUser != null) {
        request.getSession().setAttribute("loginUser", updateUser);
        request.getSession().setAttribute("msg", "회원정보 수정 완료");
         response.sendRedirect(request.getContextPath());
         
      }else {
         request.setAttribute("msg", "회원정보 수정에 실패했습니다.");
         RequestDispatcher view = request.getRequestDispatcher("views/common/error.jsp");
         view.forward(request, response);
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