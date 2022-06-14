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
        contentType:"application/json; charset=utf-8",
        dataType:"json",
        success:function(data){    
        	alert("글쓰기가 완료되었습니다.");
        }
    }).fail(function(error){
        JSON.stringify(error);
    });
    }
});
