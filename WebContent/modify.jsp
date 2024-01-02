<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@page import="user.*"%>
<jsp:useBean id="user" class="user.UserDAO" scope="page"></jsp:useBean>   

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>개인정보 수정 페이지</title>
<link rel="stylesheet" href="myweb.css" type="text/css">
</head>
<body>
<%
   String s_id = null;
   if (session.getAttribute("s_id") != null) { // 로그인된 사용자라면
	   s_id = (String)session.getAttribute("s_id");
   }
   if(s_id == null){  // 로그인되지 않은 사용자라면
 %>
	   <script>
	     alert("로그인하셔야 본 서비스를 이용하실 수 있습니다");
	     location.href="login.jsp";
	   </script>
<%
   }else{ // 로그인 사용자라면
	   UserDTO myInfo = user.getMyInfo(s_id);
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
	<div class="section_mod">
	  <div class="head_article">
	   <h2 class="tit_mod">개인 정보 수정</h2>
	  </div>
	  <form method="post" action="myWeb_control.jsp">
	  <input type="hidden" name="action" value="userModify">
	    <table class="tbl">
	      <tbody>
	        <tr>
	          <th>아이디</th><td><input type="text" value="<%= myInfo.getUserID() %>" readonly></td>
	        </tr>
	        <tr>
	          <th>현재 비밀번호</th><td><input type="password" name="now_pw" maxlength="20" placeholder="현재 비밀번호" autofocus></td>
	        </tr>
	        <tr>
	          <th>새 비밀번호</th><td><input type="password" name="new_pw" maxlength="20" placeholder="새 비밀번호"></td>
	        </tr>
	        <tr>
	          <th>새 비밀번호 확인</th><td><input type="password" name="conf_pw" maxlength="20" placeholder="새 비밀번호 확인"></td>
	        </tr>
	        <tr>
	          <th>이름</th><td><input type="text" value="<%= myInfo.getUserName() %>" readonly></td>
	        </tr>
	        <tr>
	          <th>나이</th><td><input type="text" value="<%= myInfo.getUserAge() %>" readonly></td>
	        </tr>
	        <tr>
	          <th>성별</th><td><input type="text" value="<%= myInfo.getUserGender() %>" readonly></td>
	        </tr>
	        <tr>
	          <th>이메일</th><td><input type="text" name="userEmail" value="<%= myInfo.getUserEmail() %>"></td>
	        </tr>
	        <tr>
	          <th>전화번호</th><td><input type="text" name="userPhone" value="<%= myInfo.getUserPhone() %>"></td>
	        </tr>
	      </tbody>    
	    </table>
	    <button class="btn_join1" type="button" onclick="location.href='delete.jsp'">탈퇴하기</button>
	    <button class="btn_join2" type="submit">정보수정</button>
	  </form>
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