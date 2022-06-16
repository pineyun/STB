<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>REQUEST PAGE</title>
<style>
/*.request_sub_list {display: none; cursor: pointer;}*/
.request_list>table {border:1px solid gray;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	/*$(function(){
		$(".request_list").click(function(){
			  $(this).children(".request_sub_list").stop().slideDown(400);
			});
		$(".request_list").click(function(){
			$(this).children(".request_sub_list").stop().slideup(100);
		});
	});*/
	
	
	$(function(){
		$(".cancelRequest").click(function(){
			var requestid = $(this).attr("data-requestid");
			var productid = $(this).attr("data-productid");
			console.log(productid);
			location.href="manageRequest.do?manage=cancel&requestid="+requestid+"&productid="+productid;
		});
		$("#acceptRequest").click(function(){
			var requestid = $(this).attr("data-requestid");
			location.href="manageRequest.do?manage=accept&requestid="+requestid;
		});
	});
	
	
</script>
</head>
<body>
	
	<section>
		<div id="request_wrap">
			<h1>JOIN 관리하기</h1>
			<ul id="request_content">
				<li class="request_list">내가 만든 JOIN보기
					<table class="request_sub_list">
						<tr>
							<th>상품명</th>
							<th>신청인원/모집인원</th>
							<th>모집상태</th>
							<th>모집시작일</th>
							<th>신청한 사람</th>
					   </tr>
					   <c:forEach items="${myjoinList}" var="myjoin" varStatus="status">
					     	<c:set var="before" value="${myjoinList[status.index-1]}"/>
					     	<c:set var="current" value="${myjoinList[status.index]}"/>
					   <tr>
					   		<c:if test="${before.productTitle == current.productTitle }">
							    <td></td>
							    <td></td>
							    <td></td>
							    <td></td>
						    </c:if>
						    <c:if test="${before.productTitle != current.productTitle }">
							    <td>${current.productTitle }</td>
							    <td>${current.currentNumber}/${current.joinNumber}</td>
							    <td>${current.productStatus}</td>
							    <td>${current.reg_date}</td>
						    </c:if>
								<td>${myjoin.nickname} </td>
								<td>
									<c:if test="${current.request_status == 'y'}">
									   <input type="button" value="승인취소"  data-productid="${current.productId}" data-requestid="${current.request_id}" class="cancelRequest">
									</c:if>
									<c:if test="${current.request_status == 'n'}">
							   		<input type="button" value="승인하기" data-requestid="${current.request_id}" data-productid="${current.productId}" id="acceptRequest">
							</c:if>
								</td>
						</tr>	 
					</c:forEach>						
					</table>
				</li>
				<li class="request_list">신청한 JOIN보기
					<table class="request_sub_list">
						<tr>
							<th>상품명</th>
							<th>신청인원/모집인원</th>
							<th>모집상태</th>
							<th>모집시작일</th>
							<th>신청일</th>
					   </tr>
					 <c:forEach items="${myrequestList}" var="myrequest">
						 <tr>
							<td>${myrequest.productTitle}</td>
							<td>${myrequest.currentNumber}/${myrequest.joinNumber}</td>
							<td>${myrequest.productStatus}</td>
							<td>${myrequest.reg_date}</td>
							<td>${myrequest.request_date}</td>
							<td><input type="button" value="신청취소" data-productid="${current.productId}" data-requestid="${current.request_id}" class="cancelRequest"></li></td>
						</tr>	 
					</c:forEach>
					</table>
					<!-- <ul class="request_sub_list">
					 <li>상품명 현재인원/모집인원 상품상태</li>
					 <c:forEach items="${myrequestList}" var="myrequest">
					<li>
					
					${myrequest.productTitle}
					${myrequest.currentNumber}/
					${myrequest.joinNumber}
					${myrequest.productStatus}
						<input type="button" value="신청취소"/></li>
					</c:forEach>

					</ul> -->
				</li>
			</ul>
		</div>
	</section>
</body>
</html>