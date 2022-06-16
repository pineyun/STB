<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>함께하면 가벼운 소비, N분의1</title>
</head>
<body>
	<div id="wrap">
		<%-- <%@ include file="/jsp/header.jsp"%> --%>
		<jsp:include page="header.jsp"></jsp:include>

		<!-- SECTION -->

		<section>
			<div class="container">
				<div class="form_group">
					<label>카테고리</label> <select name="category_id" id="category_id">
						<option>전체</option>
						<c:forEach items="${clist}" var="category">
							<option value="${category.category_id}">${category.category_name}</option>
						</c:forEach>
					</select> <input type="search" name="keyword" id="keyword">

					<!-- SORT: -->
					<fieldset style="display: inline;">
						<input type="radio" name="productSort" value="desc"
							checked="checked">최신순 <input type="radio"
							name="productSort" value="asc">과거순
					</fieldset>

					<button id="btnSearch">검색</button>
					<br> <br>


				</div>
				<div id="here">
					<%-- productsearch2.jsp 수행결과가 온다. --%>

				</div>
			</div>
		</section>

		<%-- <%@ include file="/jsp/footer.jsp"%> --%>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
	<script>
		$(function() {
			$.ajax({
				url : "${path}/listProduct.do",
				data : {
					"category_id" : "%",
					"keyword" : "%",
					"sort" : "desc"
				},
				type : "post",
				success : function(responseData) {

					$("#here").html(responseData);
				}
			});

		});
	</script>
	<script>
		$(function() {
			$('#btnSearch').click(function() {
				//
				var category_id = $("#category_id").val();
				var keyword = $("#keyword").val();
				var sort = $("input[name='productSort']:checked").val();
				//alert(category_id + ":" + keyword + ":" + sort);
				$.ajax({
					url : "listProduct.do",
					data : {
						"category_id" : category_id,
						"keyword" : keyword,
						"sort" : sort
					},
					type : "post",
					success : function(responseData) {

						$("#here").html(responseData);
					}
				});
			});
		});
	</script>
</body>
</html>