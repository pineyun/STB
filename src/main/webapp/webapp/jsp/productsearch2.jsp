<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!-- 
깃허브 테스트 view2
 -->
 
 

<div class="row">
						<ul class="list-wrapper">


							<c:forEach items="${productList}" var="productList">
								<li>
									<div id="product-img">
										<span
											id="">${productList.productStatus}</span>
										<a href="/STB/product/view.do?productId=${productList.productId}"> <img
											src="${contextPath}/uploads/${productList.file_name }" />
										</a>
									</div>

									<div id="product-info">
										<a
											href="/STB/product/view.do?productId=${productList.productId}"
											id="title">${productList.productTitle}</a> <span id="price">${productList.price}원</span>
										<%-- <span id="userid">${productList.userId}</span> --%>
										<span id="date">${productList.reg_date}</span>

									</div>
								</li>
							</c:forEach>

						</ul>
					</div>
