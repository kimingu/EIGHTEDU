package user.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import common.JDBCTemplate;
import lecture.model.vo.UserClass;
import user.model.vo.LecList;
import user.model.vo.User;
import user.model.vo.UserOrder;

public class userDao {

	private Properties prop = new Properties();

	public userDao() {
		// 항상 member-query.properties에서 값을 가져올 수 있도록
		// 기본 생성자 안에서 properties 파일을 불러오는 작업을 하자
		String fileName = JDBCTemplate.class.getResource("/sql/user/User.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public int insertUser(Connection con, User user) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertUser");

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user.getUserName());
			pstmt.setString(2, user.getUserId());
			pstmt.setString(3, user.getUserPwd());
			pstmt.setString(4, user.getEmail());
			pstmt.setString(5, user.getPhone());
			pstmt.setString(6, user.getGender());
			pstmt.setString(7, user.getUserNo());
			pstmt.setString(8, user.getAddress());
			pstmt.setString(9, user.getAliass());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public User loginUser(Connection conn, String id, String pwd) {
		User loginUser = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("loginUser");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, id);
			pstmt.setString(2, pwd);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				loginUser = new User(rset.getInt("user_Code"), rset.getString("user_Name"), rset.getString("user_Id"),
						rset.getString("user_Pwd"), rset.getString("email"), rset.getString("phone"),
						rset.getString("gender"), rset.getString("user_No"), rset.getString("address"),
						rset.getDate("enroll_Date"), rset.getInt("point"), rset.getString("grade"),
						rset.getString("status"), rset.getString("aliass"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return loginUser;
	}

	public int updateUser(Connection conn, User u) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("updateUser");

		try {
			pstmt = conn.prepareStatement(query);

			pstmt.setString(1, u.getUserName());
			pstmt.setString(2, u.getPhone());
			pstmt.setString(3, u.getEmail());
			pstmt.setString(4, u.getAddress());
			pstmt.setString(5, u.getGender());;
			pstmt.setString(6, u.getAliass());
			pstmt.setString(7, u.getUserNo());
			pstmt.setInt(8, u.getUserCode());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public User selectUser(Connection conn, int userCode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectUser");
		User u = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userCode);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				u = new User(rset.getInt(1), rset.getString(2),
							rset.getString(3), rset.getString(4),
							rset.getString(5), rset.getString(6),
							rset.getString(7), rset.getString(8),
							rset.getString(9), rset.getDate(10),
							rset.getInt(11), rset.getString(12),
							rset.getString(13), rset.getString(14));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return u;
	}

	public int deleteUser(Connection con, String userId, String userPwd) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("deleteUser");
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updatePwd(Connection con, String userId, String userPwd, String changePwd) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("updatePwd");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, changePwd);
			pstmt.setString(2, userId);
			pstmt.setString(3, userPwd);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace(); 
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public User searchId(Connection con, String userName, String userNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchId");
		User u = null;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userName);
			pstmt.setString(2, userNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				u = new User(rset.getInt(1), rset.getString(2),
						rset.getString(3), rset.getString(4),
						rset.getString(5), rset.getString(6),
						rset.getString(7), rset.getString(8),
						rset.getString(9), rset.getDate(10),
						rset.getInt(11), rset.getString(12),
						rset.getString(13), rset.getString(14));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return u;
	}

	public User searchPwd(Connection con, String userName, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchPwd");
		User u = null;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userName);
			pstmt.setString(2, userId);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				u = new User(rset.getInt(1), rset.getString(2),
						rset.getString(3), rset.getString(4),
						rset.getString(5), rset.getString(6),
						rset.getString(7), rset.getString(8),
						rset.getString(9), rset.getDate(10),
						rset.getInt(11), rset.getString(12),
						rset.getString(13), rset.getString(14));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return u;
	}

	public int checkId(Connection con, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("checkId");
		int result = 0;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = 1;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return result;
	}

	public User loginUser2(Connection conn, int userCode) {
		User loginUser = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("loginUser2");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, userCode);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				loginUser = new User(rset.getInt("user_Code"), rset.getString("user_Name"), rset.getString("user_Id"),
						rset.getString("user_Pwd"), rset.getString("email"), rset.getString("phone"),
						rset.getString("gender"), rset.getString("user_No"), rset.getString("address"),
						rset.getDate("enroll_Date"), rset.getInt("point"), rset.getString("grade"),
						rset.getString("status"), rset.getString("aliass"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return loginUser;
	}

	public int updateUser2(Connection conn, User u) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("updateUser2");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, u.getPoint());
			pstmt.setInt(2, u.getUserCode());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
	}

	public int getListCount(Connection conn, int userCode) {
		int listCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("getLecListCount");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userCode);
			rset = pstmt.executeQuery();

			if (rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
	}

	public int getListCount(Connection conn, String data, int userCode) {
		int listCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("getLecListCount2");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, data);
			pstmt.setInt(2, userCode);
			rset = pstmt.executeQuery();

			if (rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
	}
	public int getBuyListCount(Connection conn, int userCode) {
		int listCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("getBuyListCount");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userCode);
			rset = pstmt.executeQuery();

			if (rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
	}


	public ArrayList<LecList> selectAllList(Connection con, int currentPage, int boardLimit, int userCode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAllList");
		ArrayList<LecList> list = null;
		try {
			pstmt = con.prepareStatement(sql);
			int startRow = (currentPage - 1) * boardLimit + 1;
			int endRow = startRow + boardLimit - 1;

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			pstmt.setInt(3, userCode);
			rset = pstmt.executeQuery();
			list = new ArrayList<>();
			while(rset.next()) {
				list.add(new LecList(rset.getString(1), rset.getString(2),
						rset.getString(3), rset.getString(4)));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public ArrayList<LecList> selectTypeList(Connection con, String data, int currentPage, int boardLimit,
			int userCode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectTypeList");
		ArrayList<LecList> list = null;
		int startRow = (currentPage - 1) * boardLimit + 1;
		int endRow = startRow + boardLimit - 1;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			pstmt.setInt(3, userCode);
			pstmt.setString(4, data);
			
			rset = pstmt.executeQuery();
			list = new ArrayList<>();
			while(rset.next()) {
				list.add(new LecList(rset.getString(1), rset.getString(2),
						rset.getString(3), rset.getString(4)));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return list;
	}

	public ArrayList<UserOrder> myBuyList(Connection con, int currentPage, int boardLimit, int userCode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("myBuyList");
		ArrayList<UserOrder> list = null;
		int startRow = (currentPage - 1) * boardLimit + 1;
		int endRow = startRow + boardLimit - 1;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			pstmt.setInt(3, userCode);
			
			rset = pstmt.executeQuery();
			list = new ArrayList<>();
			while(rset.next()) {
				list.add(new UserOrder(rset.getString(1), rset.getString(2),
						rset.getInt(3), rset.getDate(4)));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

// 강좌 구매내역 확인 DAO
	public ArrayList<UserClass> buyLectureList(Connection con, int user_code) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectClassList");
		ArrayList<UserClass> list = null;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, user_code);
			
			rset = pstmt.executeQuery();
			list = new ArrayList<>();
			
			
			while(rset.next()) {
				list.add(new UserClass(rset.getInt(1), rset.getInt(2), rset.getInt(3),
										rset.getInt(4), rset.getDate(5), rset.getString(6)));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	
}
