<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>


<c:set var="contextPath" value="${pageContext.request.contextPath}" />


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel=stylesheet href="../css/reset.css">
<link rel=stylesheet href="../css/boardDetail.css">

</head>
<body>
	<div class=board-wrapper>
		<div class=category></div>
		<div class=title-wrapper>
			<div id=item-img>
				<div id=img-bag>
					<img src="../img/testimg/gogood.jpg" alt="상품">
				</div>
			</div>
			<div id=item-info>
				<div id=item-title>
					<span>${productView.productTitle}</span> <span id=item-date>${productView.userId}</span>
					<div>
						<span id=item-price>${productView.price}</span> <span
							id=join-number>/${productView.joinNumber}</span>
					</div>
				</div>
				<div id=item-ect>
					<span class=item-ect-class> <img
						src="../img/testimg/eye-outline.svg" alt="조회수">${productView.viewCount}
					</span> <span class=item-ect-class> <img
						src="../img/testimg/heart-outline.svg" alt="조회수">${productView.wishCount}
					</span>
				</div>
				<div id=item-sssss>${productView.productContent}</div>
				<div id=item-buy>
					<input type="hidden" id="like_check" value="like.like_check">

					<c:if test="${productView.wish_check == 1 }">
						<button id="heart"  class="heart"  data-like="-1" >
							<img src="../img/testimg/eye-outline.svg" alt="좋아요버튼"  clas="likeimg">
							<p class="wish_count"></p>
						</button>
					</c:if>

					<c:if test="${productView.wish_check == 0 }">
						<button id="heart"  class="heart" data-like="+1" >
							<img src="../img/testimg/heart.svg" alt="좋아요버튼"  class="likeimg">
							<p class="wish_count"></p>
						</button>
					</c:if>




					<button id=buy>${productView.currentNumber+1}/${productView.joinNumber}</button>
				</div>


			</div>

		</div>

		<div class=board-contents>
			내용 </br> </br> </br> </br>
		</div>


		<div class="card">
			<form>
				<%-- <input type="hidden" id="userId" value="${loginMember}" />  --%>
				<input type="hidden" id="boardId" value="${productView.productId}" />
				<div class="card-body">
					<textarea style="width: 90%; display: inline-block;"
						id="reply-content" class="form-control" rows="1"></textarea>
					<button type="button" style="float: right;" id="btn-reply"
						class="btn btn-primary">댓글등록</button>
				</div>
			</form>

		</div>

		<div class=board-reply-wrapper>
			<div class="card">
				<div class="card-header">댓글 리스트</div>
				<ul id="reply--box" class="list-group">
					<c:forEach var="reply" items="${replyList}">
						<li id="reply-${reply.reply_ID}"
							class="list-group-item d-flex justify-content-between"><input
							type="hidden" id=replyId " value="${reply.reply_ID}" />

							<div>${reply.reply_CONTENT}</div>
							<div class="d-flex">
								<div class="font-italic">
									작성자 : ${reply.user_ID} <br /> ${reply.reply_DATE} &nbsp;
								</div>
								<%-- <c:set target="${loginMember}" property="userId"></c:set>
								<c:if test="${productView.userId == principal.user.id}"></c:if> --%>
								<button
									onclick="index.replyDelete(${productView.productId}, ${reply.reply_ID})"
									class="btn btn-warning badge" id="btn-replyDelete">삭제</button>

							</div></li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>

	<!-- 	<script src="../../js/board.js"></script>
 -->
	<script>
$(document).ready(function(){
	$(".heart").on('click', function() {
		var like = $(this).attr("data-like");
		console.log($("#boardId").val() + like)
		$.ajax({
			url: '${contextPath}/like/likeUpdate.do',
			type: 'POST',
			data: {
				boardId: $("#boardId").val(),
				"like01" : like
				
			},
			success:function(responseData){
				 alert(responseData);
				 location.href =  "${contextPath}/product/view.do?productId=" +  $("#boardId").val();
			}, 
		})
	})
	
});

$("#btn-reply").on('click', function() {
	let data = {
			userId: $("#userId").val(),
			boardId: $("#boardId").val(),
			content: $("#reply-content").val()
			
	    };
		console.log(data);
		if($("#reply-content").val().trim() === ""){

	    		alert("댓글을 입력하세요.");
	    		$("#reply-content").val("").focus();
	    }else{
		    $.ajax({
		        type: "POST",
		        url: "${contextPath}/writeReply.do",
		        data: data,
		       // contentType:"application/json; charset=utf-8",
		       // dataType:"json",
		        success:function(data,textStatus){
		        	alert("댓글이 작성되었습니다.");
		        	var nextPage = "${contextPath}/product/view.do?productId=" + $("#boardId").val();
					location.href = nextPage;
					
		        },
		        error:function(data,textStatus){
		        	console.log(data)
		        	alert("에러발생");
		        }
	
		    });
	   	}
});

$("#btn-replyDelete").on('click', function() {
	let data = {
			userId: $("#userId").val(),
			boardId: $("#boardId").val(),
			replyId: $("#replyId").val()
			
	    };
		console.log(data);
		if($("#reply-content").val().trim() === ""){

	    		alert("댓글을 입력하세요.");
	    		$("#reply-content").val("").focus();
	    }else{
		    $.ajax({
		        type: "DELETE",
		        url: "${contextPath}/writeReply.do",
		        data: data,
		       // contentType:"application/json; charset=utf-8",
		       // dataType:"json",
		        success:function(data,textStatus){
		        	alert(data);
		        	var nextPage = "${contextPath}/product/view.do?productId=" + $("#boardId").val();
					location.href = nextPage;
					
		        },
		        error:function(data,textStatus){
		        	alert("에러발생");
		        }
	
		    });
	   	}
});
$("#buy").on('click', function() {
	alert("hi");
});

</script>

</body>
</html>