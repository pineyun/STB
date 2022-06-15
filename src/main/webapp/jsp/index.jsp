<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>함께하면 가벼운 소비, N분의1</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link rel=stylesheet href="../css/reset.css">
<link rel=stylesheet href="../css/boardList.css">
<link rel=stylesheet href="../css/common.css?after">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>

 <script type="text/javascript">

  var naver_id_login = new naver_id_login("eqagp0fQve1EtqpGZsux");
  // 접근 토큰 값 출력
  alert(naver_id_login.oauthParams.access_token);
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()",);
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
	email = naver_id_login.getProfileData('email');
    alert(naver_id_login.getProfileData('email'));
    alert(naver_id_login.getProfileData('nickname'));
  	window.close();
  	
    top.opener.location.href="http://localhost:9090/STB/jsp/index.jsp";

  }
</script>
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
	                  <input type="radio" name="productSort" value="desc" checked="checked">최신순 
	                     <input type="radio" name="productSort" value="asc">과거순
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

		  $(function(){
			  $.ajax({
					 url:"../listProduct.do",
					 data:{"category_id":"%",
							"keyword":"%", "sort":"desc"},
					 type:"post",
					 success:function(responseData){
						 
						 $("#here").html(responseData);
					 }
				 });

			  $("#input_search").on("keydown", function(event){
				  
				  if(event.keyCode == 13) {  
						 $.ajax({
							 url:"../listProduct.do",
							 data:{"category_id":"%",
									"keyword":$(this).val(), "sort":"desc"},
							 type:"post",
							 success:function(responseData){
								 
								 $("#here").html(responseData);
							 }
						 });
				  }
			  });
		  });
		
		</script>
		<script>
            $(function() {
               $('#btnSearch').click(
                     function() {
                        //
                        var category_id = $("#category_id").val();
                        var keyword = $("#keyword").val();
                        var sort = $(
                              "input[name='productSort']:checked")
                              .val();
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