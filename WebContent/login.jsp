<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 페이지</title>
<link rel="stylesheet" href="myweb.css" type="text/css">
</head>
<body>
<% // 로그인된 사용자가 다시 로그인 페이지에 접근하지 못하도록
	String s_id = null;
	if (session.getAttribute("s_id") != null){     // 로그인된 사용자라면
		s_id = (String)session.getAttribute("s_id");
	}
	if (s_id != null) {%>
	    <script>
	      alert("이미 로그인 되어있습니다.");
	      history.go(-1); // 이전 작업으로 돌아가기
	    </script><%
	}
%>
<div class="header">
  <div class="logo">
    <a href="index.jsp"><img src="img/logo.jpg" alt="배화여자대학교"></a>
  </div>
  <div class="menu">
    <a href="join.jsp">회원가입</a>
    <a href="login.jsp">로그인</a>
  </div>
</div>
<div class="content">
	<div class="section_login">
	  <h3 class="tit_login">로그인</h3>
	  <div class="write_form">
	    <form method="post" action="myWeb_control.jsp">
	    <input type="hidden" name="action" value="userLogin">
	      <input type="text" name="userID" placeholder="아이디를 입력해주세요." autofocus>
	      <input type="password" name="userPassword" placeholder="비밀번호를 입력해주세요.">
	      <button class="btn_type1" type="submit">
	        <span class="txt_type">로그인</span>
	      </button>
	      <button class="btn_type2" type="button" onclick="location.href='join.jsp'">
	        <span class="txt_type">회원가입</span>
	      </button>
	    </form>
	  </div>
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