package lecture.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class UserClass implements Serializable{
   /**
    * 
    */
   private static final long serialVersionUID = 3187112752658648023L;
   private int order_num;
   private int user_code;
   private int l_code;
   private int t_code;
   private Date order_date;
   private String lecLevel;
   
   public UserClass(int order_num, int user_code, int l_code) {
      super();
      this.order_num = order_num;
      this.user_code = user_code;
      this.l_code = l_code;
   }
   
   
// 추가구문
   public UserClass(int order_num, int user_code, int l_code, int t_code, Date order_date, String lecLevel) {
	super();
	this.order_num = order_num;
	this.user_code = user_code;
	this.l_code = l_code;
	this.t_code = t_code;
	this.order_date = order_date;
	this.lecLevel = lecLevel;
}



public int getOrder_num() {
      return order_num;
   }

   public void setOrder_num(int order_num) {
      this.order_num = order_num;
   }

   public int getUser_code() {
      return user_code;
   }

   public void setUser_code(int user_code) {
      this.user_code = user_code;
   }

   public int getL_code() {
      return l_code;
   }

   public void setL_code(int l_code) {
      this.l_code = l_code;
   }

   public Date getOrder_date() {
      return order_date;
   }

   public void setOrder_date(Date order_date) {
      this.order_date = order_date;
   }

   public String getLecLevel() {
      return lecLevel;
   }

   public void setLecLevel(String lecLevel) {
      this.lecLevel = lecLevel;
   }
   
   

   public int getT_code() {
	return t_code;
}

public void setT_code(int t_code) {
	this.t_code = t_code;
}

@Override
public String toString() {
	return "UserClass [order_num=" + order_num + ", user_code=" + user_code + ", l_code=" + l_code + ", t_code="
			+ t_code + ", order_date=" + order_date + ", lecLevel=" + lecLevel + "]";
}


   
}