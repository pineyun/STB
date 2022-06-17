<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.math.BigInteger"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<title>공동구매 플랫폼, N분의1</title>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"
	rel="stylesheet">
<link rel=stylesheet href="../css/reset.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<style>
* {
	text-align: center;
	font-family: 'Nanum Gothic', sans-serif;
}

body {
	background-color: #ffea00;
}

#wrap {
	padding-top: 250px;
	width: 100%;
	margin: 0 auto;
}

#logo {
	margin-bottom: 20px;
}

p {
	font-size: 18px;
	margin-bottom: 50px;
}

.input_login {
	font-size: 16px;
	padding-left: 18px;
	text-align: left;
	letter-spacing: -1px;
	display: block;
	width: 331px;
	height: 45px;
	background-color: white;
	border-radius: 15px;
	border: none;
	margin: 0 auto;
	margin-bottom: 10px;
}

.btn_login {
	font-size: 16px;
	letter-spacing: -1px;
	display: block;
	width: 350px;
	height: 45px;
	background-color: white;
	border-radius: 15px;
	border: none;
	margin: 0 auto;
	margin-bottom: 10px;
	background-color: black;
	color: white;
}

a {
	display: inline-block;
	text-decoration: none;
	color: black;
}

#link a:hover {
	text-decoration: underline;
}
/* #link a:last-of-type {
	margin-left: 150px;
} */
#look_box {
	align-cotent: left;
	display: inline-block;
	margin-right: 100px;
}

#naver_id_login {
	display: block;
	border-radius: 15px;
	margin-bottom: 10px;
}
</style>

</head>
<body>
	<%--    <%
    String clientId = "eqagp0fQve1EtqpGZsux";//애플리케이션 클라이언트 아이디값";
    String redirectURI = URLEncoder.encode("http://localhost:9090/TeamProjectSecond/member/Nlogin", "UTF-8");
    SecureRandom random = new SecureRandom();
    String state = new BigInteger(130, random).toString();
    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
    apiURL += "&client_id=" + clientId;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&state=" + state;
    session.setAttribute("state", state);
 %> --%>



	<script type="text/javascript">
		$(function() {
			var msg = "${msg}";
			if (msg != "")
				alert(msg);

		})
	</script>
	<!--여기까지.네이버  -->

	<div id="wrap">
		<p id="logo">
			<img src="${path}/img/header/logo.png" alt="N분의1">
		</p>
		<p>
			함께하면 가벼운 소비,<br>세상의 모든 소비를 나눠보세요.
		</p>

		<form method="post" action="${path}/member/login">
			<input class="input_login" type="text" name="userId" id="user_Id"
				placeholder="이메일주소를 입력하세요."> <input class="input_login"
				type="password" name="password" id="password"
				placeholder="비밀번호를 입력하세요."> <input class="btn_login"
				type="submit" value="로그인">
			<div id="imgNaver">
				<!-- <input type="image" class="btn_login" alt="" src="../img/header/btnG_완성형2.png"  height=40px; > -->
				<!-- <a href=""><img height="50" src="../img/header/btnG_완성형2.png"/ class="btn_login" id="naver_id_login"></a> -->
				<div id="naver_id_login"></div>
				<script type="text/javascript">
					var naver_id_login = new naver_id_login(
							"eqagp0fQve1EtqpGZsux",
							"http://localhost:9090/STB/jsp/index.jsp");
					var state = naver_id_login.getUniqState();
					naver_id_login.setButton("white", 4, 75);
					naver_id_login.setDomain();
					naver_id_login.setState(state);
					naver_id_login.setPopup();
					naver_id_login.init_naver_id_login();
				</script>

			</div>


		</form>
		<div id="link">
			<div id="look_box">
				<a href="${path}/member/IdFindCheck">아이디</a> <a>/비밀번호찾기</a>
			</div>
			<a href="${path}/member/memberEnroll"> 회원가입</a>
		</div>
	</div>
	<!-- 
	<form action="" method="post" id="myfrm">
		 <input type="hidden" name="email" id="email"> 
		 <input type="hidden" name="nickname" id="nickname">
		 <input type="hidden" name="access_token" id="access_token">
	</form>  -->
</body>
</html>