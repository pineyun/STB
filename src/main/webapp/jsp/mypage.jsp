<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>

<div id="myPage-container">
	<ul class="myPageBar">
		<li id="memberInfo"><a href="">내정보(개인)</a></li>
		<li id="wishList"><a href="">위시리스트</a></li>
		<li id="myJoin">나의 JOIN</li>
		<li id="InfoPost"><a href="">고객센터</a></li>
	</ul>
	<div id="myPageSession">
		<div id="memberUpdate-container">
			<h1>회원정보</h1>
			<form id="memberUpdateFrm" method="POST">
				<table>
					<tr>
						<th>아이디</th>
						<td><c:set var="loginMember" value="${loginMember}" />
						<input type="text" name="userId" id="userId"
							value="${loginMember.userId}" readonly> <!-- 읽기만가능 --></td>
						<!-- 사용자가 입력했던 정보가져오기 -->
					</tr>
					<tr>
						<th>닉네임</th>
						<td><input type="text"  name="ncikName" id="ncikName" value="${loginMember.nickName}" readonly><br></td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td><input type="tel" oninput="autoTel(thisvalue = this)" placeholder="(-제외)01012345678" name="phone" id="phone" maxlength="13" value="" required><br></td>
					</tr>
				</table>
			</form>
			<div id="form-button">
				<input type="button" onclick="updateMember();" value="수정"/>
				<input type="button" onclick="location.href='${path}/member/updatePassword'" value="비밀번호변경"/>
				<input type="button" onclick="deleteMember();" value="탈퇴"/>
			</div>
		</div>
	</div>
</div>
<script>
		$(function() {
			$('#myJoin').click(function() {
				$.ajax({
					url : "${path}/requestList.do",
					success : function(responseData) {
						$("#myPageSession").html(responseData);
					}
				});
			});
		});
</script>
<!-- 회원탈퇴폼 -->
<form id="memberDelFrm" action="${path}/member/memberDelete" method="POST">
	<input type="hidden" name="userId" value="${loginMember.userId}" />
</form>
<script>

// 일반회원 수정
const updateMember = () => {
	// 폼의 action값 할당 후 제출
	//console.log("회원정보 수정");
	$(memberUpdateFrm)
		.attr("action", "<%=request.getContextPath()%>/member/MemberUpdate")
		.submit();
};

// 전화번호 -(하이픈)자동입력
const autoTel = (target) => {
	 target.value = target.value
	   .replace(/[^0-9]/, '')
	   .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
};
var numCheck = /^(01[016789]{1}|02|0[0-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
// 일반회원유효성검사
$("#memberUpdateFrm").submit((e) => {
	//phone
	const $phone = $(phone);
	if(!numCheck.test($phone.val())){
		alert("유효한 전화번호가 아닙니다.");
		$phone.focus();
		return false;
	}
	alert("수정완료!");
	return true;
});

//회원탈퇴
const deleteMember = () => {
	if(confirm("정말로 탈퇴하시겠습니까?")){
		$(memberDelFrm).submit();
	}
};

</script>