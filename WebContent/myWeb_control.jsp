<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="user" class="user.UserDAO" scope="page"></jsp:useBean>   
<jsp:useBean id="userdto" class="user.UserDTO"></jsp:useBean>
<jsp:setProperty name="userdto" property="*" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>control 페이지</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String action = request.getParameter("action");
	
	try{
		if(action.equals("userJoin")) { //회원가입
			String id = request.getParameter("userID");
			String passwd = request.getParameter("userPassword");
			String passwd2 = request.getParameter("userPassword2");
			
			if(user.checkID(id)==0){%>
				<script>
				  alert("이미 사용중인 아이디입니다.");
				  history.go(-1);
				</script>			
			<%} // 아이디 중복
			else{ // 아이디 중복이 아니라면
				if(!passwd.equals(passwd2)){%>
					<script>
					  alert("비밀번호가 일치하지 않습니다.");
					  history.go(-1);
					</script>	
				<%} // 비밀번호 불일치
				else{ // 비밀번호 일치
					if(user.insertUser(userdto)){%>
						<script>
						  alert("회원가입이 완료되었습니다.\n로그인 후 사용해주세요.");
						  location.href="login.jsp";
						</script>				
					<%} //회원 가입 성공
					else{%>
						<script>
				          alert("모든 정보를 입력하세요.");
				          history.go(-1);
				        </script>		
					<%}			
				} 
			} 
		} 	
		else if(action.equals("userLogin")) { //로그인   
			String id = request.getParameter("userID");
			String passwd = request.getParameter("userPassword");
	
			if(id == null || id.equals("") || passwd == null || passwd.equals("") ){%>
				<script>
			      alert("아이디와 비밀번호가 입력되지 않았습니다.")
			      history.go(-1);
			    </script>
			<%}	
			
			int check = user.checkUser(id, passwd);
			if (check == 1){ // 회원가입된 사용자라면 현재 아이디 값을 세션에 s_id 이름으로 저장
				session.setAttribute("s_id", id);
				String s_id = (String)session.getAttribute("s_id");%>
			    <script>
			      alert("<%=s_id%>님 환영합니다.");
			      location.href="index.jsp";
			    </script><%
			}else if(check == 0){%>
				<script>
				  alert("비밀번호가 일치하지 않습니다.");
				  history.go(-1);
				</script>
			<%}else{%>
				<script>
				  alert("아이디가 존재하지 않습니다.");
				  history.go(-1);
				</script>			
			<%}
		} 
		else if(action.equals("userModify")) { //회원 정보 수정
	        //modify.jsp 페이지는 로그인된 유저만 접근 가능
	        String s_id = (String)session.getAttribute("s_id");
			String now_pw = request.getParameter("now_pw");   //현재 비밀번호
			String new_pw = request.getParameter("new_pw");   //새 비밀번호
			String conf_pw = request.getParameter("conf_pw"); //새 비밀번호 확인
			String email = request.getParameter("userEmail"); 
			String phone = request.getParameter("userPhone"); 
			
			if(now_pw == null || now_pw.equals("") || new_pw == null || new_pw.equals("") || conf_pw == null || conf_pw.equals("") 
					||email == null || email.equals("") || phone == null || phone.equals("")){%>
				<script>
			      alert("모든 정보를 입력해 주세요.")
			      history.go(-1);
			    </script>
			<%}		
			
			int check = user.checkUser(s_id, now_pw);
			if (check == 1){
				if (new_pw.equals(conf_pw)){
					userdto.setUserID(s_id); //로그인된 아이디
					userdto.setUserPassword(new_pw);
					userdto.setUserEmail(email);
					userdto.setUserPhone(phone);
					boolean result = user.updateUser(userdto);
					if (result){%>
						<script>
					      alert("회원 정보가 수정되었습니다.")
					      location.href="index.jsp";
					    </script>
					<%}else{%>
						<script>
				          alert("회원 정보 수정에 실패하였습니다.")
				          history.go(-1);
				        </script>
					<%}
				}else{%>
					<!--새 비번과 새 비번 확인 불일치-->
					<script>
			          alert("새 비밀번호와 비밀번호 확인이 일치하지 않습니다.")
			          history.go(-1);
			        </script>
				<%}
			}else{%>
				<!-- 입력한 현재 비밀번호와 DB에 저장된 비번 불일치 -->
			    <script>
			      alert("현재 비밀번호를 다시 확인하세요.")
			      history.go(-1);
			    </script>
			<%}	
		} 
		else if(action.equals("userDelete")) { // 회원 탈퇴
			String s_id = (String)session.getAttribute("s_id");
			String del_pw = request.getParameter("del_pw");
			int check = user.checkUser(s_id, del_pw);
			
			if(check == 1){
				boolean d_result = user.deleteUser(s_id); // true면 회원 탈퇴 성공 
				if (d_result){
					session.invalidate();%>
					<script>
				      alert("회원 탈퇴가 되었습니다.")
				      location.href="index.jsp";
				    </script>
				<%}else{%>
					<script>
			          alert("회원 탈퇴에 실패하였습니다.")
			          history.go(-1);
			        </script>
				   <%}%>
			<%}else{%>
			    <script>
			      alert("비밀번호를 다시 확인하세요.")
			      history.go(-1);
			    </script>
			   <%}
		} 
	}catch(Exception e){
		e.printStackTrace();
	}
%>
</body>
</html>