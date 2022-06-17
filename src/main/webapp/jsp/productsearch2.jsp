<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!-- 
깃허브 테스트 view2
 -->
<section id="product_detail">
<div class="row">
	<ul class="list-wrapper">
		<c:forEach items="${productList}" var="productList">
			<li class="ajax_product_detail" onclick = "ajax_product_detail(${productList.productId});" data-product-id="${productList.productId}">
				<div id="product-img">
					<span id="product-status">${productList.productStatus}</span> <p>
						<img src="${contextPath}/uploads/${productList.file_name }" />
					</p>
				</div>
				<div id="product-info">
					<p id="title">${productList.productTitle}</p>
					<span id="price">${productList.price}원</span>
					<%-- <span id="userid">${productList.userId}</span> --%>
					<span id="date">${productList.reg_date}</span>
				</div>
			</li>
		</c:forEach>
	</ul>
</div>
</section>
