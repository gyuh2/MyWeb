<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="user.*"%>
<%@page import="java.util.*"%>
<jsp:useBean id="user" class="user.UserDAO" scope="page"></jsp:useBean>  

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사용자 명단</title>
<link rel="stylesheet" href="myweb.css" type="text/css">
</head>
<body>
<%
   String s_id = null;
   if (session.getAttribute("s_id") != null) { // 로그인된 사용자라면
	   s_id = (String)session.getAttribute("s_id");
   }
   if(s_id == null){ // 로그인되지 않은 사용자라면
%>
	   <script>
	     alert("로그인하셔야 본 서비스를 이용하실 수 있습니다");
	     location.href="login.jsp";
	   </script>
<%
   }else{ // 로그인 사용자라면
%>
<div class="header">
  <div class="logo">
    <a href="index.jsp"><img src="img/logo.jpg" alt="배화여자대학교"></a>
  </div>
  <div class="menu">
    <a href="list.jsp">사용자</a>
    <a href="delete.jsp">회원 탈퇴</a>
    <a href="modify.jsp">정보 수정</a>
    <a href="logout.jsp">로그아웃</a>
  </div>
</div>
<div class="content">
	<div class="section_list">
	  <div class="head_article">
	   <h2 class="tit_list">사용자 명단</h2>
	  </div>
	    <table>
	      <tbody>
	        <tr>
	          <th>아이디</th>
	          <th>비밀번호</th>
	          <th>이름</th>
	          <th>나이</th>
	          <th>성별</th>
	          <th>이메일</th>
	          <th>전화번호</th>
	          <th>가입일</th>
	        </tr>
	<%	
		ArrayList<UserDTO> userList = user.getUserList();
		for(UserDTO u_data:userList){
	%>
		<tr>
			<td><%=u_data.getUserID() %></td>
			<td><%=u_data.getUserPassword() %></td>
			<td><%=u_data.getUserName() %></td>
			<td><%=u_data.getUserAge() %></td>
			<td><%=u_data.getUserGender() %></td>
			<td><%=u_data.getUserEmail() %></td>
			<td><%=u_data.getUserPhone() %></td>
			<td><%=u_data.getUserReg_date() %></td>
		</tr>
		<%
		   }
		%>
	      </tbody>    
	    </table>
	</div>
</div>
<div class="footer">
  <p>
    <span>03039</span>
           서울특별시 종로구 필운대로 1길 34 배화여자대학교 
    <span>TEL. </span>
     02-397-0541 ㅣ 
    <span>FAX. </span>
     02-737-7260
  <br>
  Copyright ⓒ BEAWHA WOMEN’S UNIVERSITY. All Rights Reserved.
  </p>
</div>
</body>
<%
} // else의 닫는 구문
%>
</html>