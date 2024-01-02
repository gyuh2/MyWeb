<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입 페이지</title>
<link rel="stylesheet" href="myweb.css" type="text/css">
</head>
<body>
<%  // 로그인된 사용자가 다시 회원가입 페이지에 접근하지 못하도록
	String s_id = null;
	if (session.getAttribute("s_id") != null){     // 로그인된 사용자라면
		s_id = (String)session.getAttribute("s_id");
	}
	if (s_id != null) {%>
	    <script>
	      alert("이미 로그인 되어있습니다.");
	      history.go(-1);  // 이전 작업으로 돌아가기
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
	<div class="section_join">
	  <div class="head_article">
	   <h2 class="tit_join">회원가입</h2>
	  </div>
	  <form method="post" action="myWeb_control.jsp">
	  <input type="hidden" name="action" value="userJoin">
	    <table class="tbl">
	      <tbody>
	        <tr>
	          <th>아이디</th><td><input type="text" name="userID" maxlength="20" placeholder="영문 혹은 영문과 숫자를 조합" required autofocus></td>
	        </tr>
	        <tr>
	          <th>비밀번호</th><td><input type="password" name="userPassword" maxlength="20" placeholder="비밀번호를 입력해주세요."></td>
	        </tr>
	        <tr>
	          <th>비밀번호 확인</th><td><input type="password" name="userPassword2" maxlength="20" placeholder="비밀번호를 한번 더 입력해주세요."></td>
	        </tr>
	        <tr>
	          <th>이름</th><td><input type="text" name="userName"></td>
	        </tr>
	        <tr>
	          <th>나이</th><td><input type="text" pattern="[0-9]*" name="userAge" placeholder="숫자만 입력해주세요."></td>
	        </tr>
	        <tr class="select_gender">
	          <th>성별</th>
	          <td>
	            <label class="checked">
	              <input type="radio" name="userGender" value="Man" checked="checked"><span class="ico"></span>남자
	            </label>
	            <label>
	              <input type="radio" name="userGender" value="Woman"><span class="ico"></span>여자
	            </label>
	          </td>
	        </tr>
	        <tr>
	          <th>이메일</th><td><input type="text" name="userEmail"></td>
	        </tr>
	        <tr>
	          <th>전화번호</th><td><input type="text" name="userPhone"></td>
	        </tr>
	      </tbody>    
	    </table>
	    <button class="btn_join1" type="reset" onclick="location.href='index.jsp'">취소</button>
	    <button class="btn_join2" type="submit">회원가입</button>
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
</html>