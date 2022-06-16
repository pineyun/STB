<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel=stylesheet href="../css/reset.css">
<link rel=stylesheet href="../css/common.css">
<link rel=stylesheet href="../css/productInsert.css">
<link rel=stylesheet href="${contextPath}/css/boardList.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>조인 만들기</title>
<script>
	/* 총액, 인원 입력하면 자동으로 1/n 계산해서 보여주기 */
	$(function(){
			$("#price, #join_number").change(function(){
				var price = $("#price").val();
				var join_number = $("#join_number").val();
				if(price=="") price=0;
				if(join_number=="") join_number=0;
				if(join_number==0) 
					$("#divide_price").html("")
				else 
					$("#divide_price").html(Math.floor(price/join_number));
			});
	});
</script>
</head>
<body>
	<div id="wrap">
		<%@ include file="/jsp/header.jsp"%>
		<div id="here">
		<section id="productInsert">
		
			<h1>조인 만들기</h1>
			<form action="productInsert.do" method="post" enctype="multipart/form-data">
				<div class="form_group">
					<label>카테고리</label>
					<select name="category_id">
						<c:forEach items="${clist}" var="category">
			   				<option value="${category.category_id}">${category.category_name}</option>
			 			</c:forEach>
					</select>
				</div>
				<div class="form_group">
					<label>제목</label>
					<input type="text" name="title" maxlength="50">
				</div>
				<div class="form_group">
					<label>총액</label>
					<input type="number" name="price" id="price">
				</div>
				<div class="form_group">
					<label>조인인원</label>
					<input type="number" name="join_number"  id="join_number"_>
				</div>
				<div class="form_group">
					<label>예상 1/N가격</label>
					<p id="divide_price"></p>
				</div>
				<div class="form_group">
					<label>사진1</label>
					<input type="file" name="photos" accept="image/*">
				</div>
				<div class="form_group">
					<label>사진2</label>
					<input type="file" name="photos" accept="image/*">
				</div>
				<div class="form_group">
					<label>사진3</label>
					<input type="file" name="photos" accept="image/*">
				</div>
				<div class="form_group">
					<label>사진4</label>
					<input type="file" name="photos" accept="image/*">
				</div>
				<div class="form_group">
					<label>사진5</label>
					<input type="file" name="photos" accept="image/*">
				</div>
				<div class="form_group">
					<label>내용</label>
					<textarea name="content" class="form_content" maxlength="1000"></textarea>
				</div>
				<div class="insert_btn">
					<input type="submit" value="등록">
					<input class="btn btn-secondary" type="reset" value="취소">	
				</div>
				
			</form>
			
		</section>
		</div>
		<%@ include file="/jsp/footer.jsp"%>
	</div>
</body>
</html>