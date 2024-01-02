<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원탈퇴 페이지</title>
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
	<div class="section_delete">
	  <div class="head_article">
	   <h2 class="tit_delete">탈퇴 안내</h2>
	  </div>
	  <form method="post" action="myWeb_control.jsp">
	  <input type="hidden" name="action" value="userDelete">
	    <table class="tbl">
	      <tbody>
	        <tr>
	          <td colspan="2"><span class="info">* 탈퇴 후에는 아이디 (<b><%=s_id%></b>)로 가입한 모든 정보가 삭제되어 복구가 불가능합니다.</span></td>
	        </tr>
	        <tr>
	          <th>비밀번호 확인</th><td><input type="password" name="del_pw" maxlength="20" placeholder="비밀번호를 입력해주세요." autofocus></td>
	        </tr>
	      </tbody>    
	    </table>
	    <button class="btn_join1" type="reset" onclick="location.href='index.jsp'">취소</button>
	    <button class="btn_join2" type="submit">탈퇴</button>
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