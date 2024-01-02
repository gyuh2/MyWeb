package user;
import java.sql.*;
import java.util.*;

public class UserDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;

	public Connection connect() throws ClassNotFoundException, SQLException { 
		Connection conn = null;
		String jdbcUrl = "jdbc:mysql://localhost:3306/jsp01";
		String dbId = "root";
		String dbPass = "1234";

		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		System.out.println("연결 성공");

		return conn;
	}
	
	public int checkUser(String id, String passwd) {
		Connection conn = null;
		PreparedStatement pstmt = null;	
		ResultSet rs = null;
		int x = -1;
		
		try {
			conn = connect();
			String sql = "select userPassword from user where userID = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String DBpasswd = rs.getString("userPassword");
				if(DBpasswd.equals(passwd)) {
					x = 1;  //아이디, 비밀번호 일치
					//System.out.println(x);
				}else {
					x = 0; //비밀번호 불일치
					//System.out.println(x);
				}
			}else {
				x = -1; //해당 아이디가 존재하지 않음
				//System.out.println(x);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			
		}
		return x;
	} // 로그인
	
	public int checkID(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;	
		ResultSet rs = null;
		int x = -1;
		
		try {
			conn = connect();
			String sql = "select userID from user where userID = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				x = 0;
				//System.out.println(x);
			}else{
				x = -1;
				//System.out.println(x);
			}
				
		}catch(Exception e) {
			e.printStackTrace();
		}
		return x;
	} // 아이디 확인
	
	public boolean insertUser(UserDTO userdto){
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "insert into user(userID, userPassword, userName, userAge, userGender, userEmail, userPhone) values(?,?,?,?,?,?,?)";
		
		try{
			conn = connect();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userdto.getUserID());
			pstmt.setString(2, userdto.getUserPassword());
			pstmt.setString(3, userdto.getUserName());
			pstmt.setString(4, userdto.getUserAge());
			pstmt.setString(5, userdto.getUserGender());
			pstmt.setString(6, userdto.getUserEmail());
			pstmt.setString(7, userdto.getUserPhone());
			pstmt.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
		return true;
	} // 회원가입
	
	public UserDTO getMyInfo(String id){
		Connection conn = null;
		PreparedStatement pstmt = null;	
		ResultSet rs = null;
		UserDTO myinfo = null;
		
		try{		
			conn = connect();
			
			String sql = "select * from user where userID = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				myinfo = new UserDTO();
				myinfo.setUserID(rs.getString("userID"));
				myinfo.setUserPassword(rs.getString("userPassword"));
				myinfo.setUserName(rs.getString("userName"));
				myinfo.setUserAge(rs.getString("userAge"));
				myinfo.setUserGender(rs.getString("userGender"));
				myinfo.setUserEmail(rs.getString("userEmail"));
				myinfo.setUserPhone(rs.getString("userPhone"));
				myinfo.setUserReg_date(rs.getTimestamp("userReg_date"));
				//System.out.println("읽어오기 성공");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return myinfo;
	} // 로그인된(세션에 있는) 사용자 정보
	
	
	public boolean updateUser(UserDTO userdto){
		Connection conn = null;
		PreparedStatement pstmt = null;	
		boolean x = false;
		int y = -1;
		
		try{
			conn = connect();

			String sql = "update user set userPassword=?, userEmail=?, userPhone=? where userID=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userdto.getUserPassword());
			pstmt.setString(2, userdto.getUserEmail());
			pstmt.setString(3, userdto.getUserPhone());
			pstmt.setString(4, userdto.getUserID());
			y = pstmt.executeUpdate(); // 1 
				
			if(y == 1){
				x = true;
			}else{
				x = false;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		//System.out.println(x);
		return x;
	} // 회원 정보 수정
	
	public boolean deleteUser(String id){
		Connection conn = null;
		PreparedStatement pstmt = null;	
		boolean x = false;
		int y = -1;
		
		try{
			conn = connect();

			String sql = "delete from user where userID = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			y = pstmt.executeUpdate(); // 1
			//System.out.println("회원 삭제 완료");

			if (y == 1) {
				x = true;
			} else {
				x = false;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return x;
	} // 회원 정보 삭제
	
	public ArrayList<UserDTO> getUserList() throws ClassNotFoundException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<UserDTO> userList = new ArrayList<UserDTO>();
		
		try{
			conn = connect();
			
			String sql = "select * from user";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				UserDTO u_data = new UserDTO();
				u_data.setUserID(rs.getString("userID"));
				u_data.setUserPassword(rs.getString("userPassword"));
				u_data.setUserName(rs.getString("userName"));
				u_data.setUserAge(rs.getString("userAge"));
				u_data.setUserGender(rs.getString("userGender"));
				u_data.setUserEmail(rs.getString("userEmail"));
				u_data.setUserPhone(rs.getString("userPhone"));
				u_data.setUserReg_date(rs.getTimestamp("userReg_date"));
				userList.add(u_data);
			}		
		}catch(SQLException e){
			e.printStackTrace();
		}
		return userList;
	} // 전체 사용자 명단
}