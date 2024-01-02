<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>index 페이지</title>
<link rel="stylesheet" href="myweb.css" type="text/css">
</head>
<body>
<%
  String s_id = null;
  if (session.getAttribute("s_id") != null) {      // 현재 세션에 존재한다면
	  s_id = (String)session.getAttribute("s_id");
  }
%>
<div class="header">
  <div class="logo">
    <a href="index.jsp"><img src="img/logo.jpg" alt="배화여자대학교"></a>
  </div>
<%
  if(s_id == null){ // 로그인이 되어있지 않다면
%>
  <div class="menu">
    <a href="join.jsp">회원가입</a>
    <a href="login.jsp">로그인</a>
  </div>
<%
  }else {
%>
  <div class="menu">
    <a href="list.jsp">사용자</a>
    <a href="delete.jsp">회원 탈퇴</a>
    <a href="modify.jsp">정보 수정</a>
    <a href="logout.jsp">로그아웃</a>
  </div>
<%
  }
%>
</div>
<div class="content">
	<div class="section_img"> 
	  <div class="slide img1"></div> 
	  <div class="slide img2"></div> 
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
</html>