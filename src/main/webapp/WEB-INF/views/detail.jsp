<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>detail</title>

<script src="${pageContext.request.contextPath}/resources/jQuery/jquery-3.5.1.js"></script>
</head>
<body>
<%@include file="include/header.jsp" %>
<%//ajax문법 %>

<script>
$(document).ready(function(){
	console.log("1");	
	replylist();
	
	
	//댓글 저장 버튼 클릭 이벤트
    //$(#btnReplySave).click(function(){
	$(document).on('click', '#btnReplySave', function(){
		var rememo = $('#rememo').val();
		var rewriter = $('#rewriter').val();

		var url = "${pageContext.request.contextPath}/ajaxregister";//추가
		var paramData = {"rememo": rememo
				, "rewriter": rewriter
				, "bno":'${board.bno}'
		};		

		$.ajax({
			type: 'POST',
	        url: url,
	        data : paramData,
	        dataType: 'json',
			success: function(result){
				replylist();
				
				$('#rememo').val('');
				$('#rewriter').val('');
			}
			, error: function(error){
				console.log("에러 : " + error);
			}
		});
	});
});
	
// 댓글 조회
function replylist(){
	var url = "ajaxreply";
	var paramData = {"bno": "${board.bno}"}
	
	$.ajax({
		type:'POST',
		url : url,
		data: paramData,
		dataType: 'json',
		success: function(result){
			var htmls = "";
			if(result.length < 1){
				htmls += "등록된 댓글이 없습니다.";
			} else{
				$(result).each(function(){
					htmls += '<div class="media text-muted pt-3" id="reno' + this.reno + '">';

					htmls += '<span class="d-block">';
					htmls += this.reno + ' - ';
					htmls += '<strong class="text-gray-dark">' + this.rewriter + '</strong>';
					htmls += '<span style="padding-left: 7px; font-size: 9pt">';
					htmls += '<a href="javascript:void(0)" onclick="fn_editReply(' + this.reno + ', \'' + this.rewriter + '\', \'' + this.rememo + '\' )" style="padding-right:5px">수정</a>';
					htmls += '<a href="javascript:void(0)" onclick="fn_deleteReply(' + this.reno + ')" >삭제</a>';
					htmls += '</span>';
					htmls += '</span><br>';
					htmls += this.rememo;
					htmls += '</p>';
					htmls += '</div>';
				}); // each end
			}
			$("#replyList").html(htmls);
		},
		error:function(data){
			alert("에러가 발생했습니다.");
		}
	}); //ajax end
}

// 댓글 수정 저장

function fn_updateReply(reno, rewriter){
	var editrememo = $("#editrememo").val();
	
	var url = "${pageContext.request.contextPath}/ajaxupdate";//수정
	var paramData = {"reno" : reno,
			"rememo" : editrememo			
	};  //수정

	$.ajax({
        type: 'POST',
        url: url,
        data : paramData,
        dataType: 'json',
        success: function(result) {
    		console.log(result);    
	       	replylist();  // 댓글리스트 호출
        	
        },
        error:function(data){
			alert("에러가 발생했습니다.")
		}
	});
	
}

// 수정?
function fn_editReply(reno,rewriter,rememo){
	var htmls = "";

	htmls += '<div class="media text-muted pt-3" id="reno' + reno + '">';

	htmls += '<span class="d-block">';
	htmls +=  reno + ' - ';
	htmls += '<strong class="text-gray-dark">' + rewriter + '</strong>';
	htmls += '<span style="padding-left: 7px; font-size: 9pt">';
	htmls += '<a href="javascript:void(0)" onclick="fn_updateReply(' + reno + ', \'' + rewriter + '\')" style="padding-right:5px">저장</a>';
	htmls += '<a href="javascript:void(0)" onClick="replylist()">취소<a>';
	htmls += '</span>';
	htmls += '</span>';		
	htmls += '<textarea name="editrememo" id="editrememo" class="form-control" rows="3">';
	htmls += rememo;
	htmls += '</textarea>';
	htmls += '</p>';

	htmls += '</div>';	
	

	$('#reno' + reno).replaceWith(htmls);  //  선택한 요소를 다른 것으로 바꿉니다.변경(바꾸기)
	$('#reno' + reno + ' #editrememo').focus();

}

//삭제

function fn_deleteReply(reno){
	var url = "${pageContext.request.contextPath}/ajaxdelete";//수정
	var paramData = {"reno" : reno};  //수정

	$.ajax({
        type: 'POST',
        url: url,
        data : paramData,
        dataType: 'json',
        success: function(result) {
    		console.log(result);    
	       	replylist();  // 댓글리스트 호출
        	
        },
        error:function(data){
			alert("에러가 발생했습니다.")
		}
	});
}
</script>
    
    <main class="main">
      <%@include file="include/nav.jsp" %>
      <section class="content">
		<div class="box">
			<div class="box-header">
				<h3 class="box-title">상세보기</h3>
			</div>
			<div class="box-body">
				<div class="form-group">
					<label>제목</label> <input type="text" name="title"
						class="form-control" value="${board.title}" readonly="readonly" />
				</div>

				<div class="form-group">
					<label>내용</label>
					<textarea name="content" rows="5" readonly="readonly"
						class="form-control">${board.content}</textarea>
				</div>

				<div class="form-group">
					<label>작성자</label> <input type="text" name="id"
						class="form-control" value="${board.id}" readonly="readonly" />
				</div>
			</div>
		
		</div>
		<div class="box-footer">
			<button class="btn btn-warning">수정</button>
			<button class="btn btn-danger">삭제</button>
			<button class="btn btn-primary">목록</button>
			<button class="btn btn-info">댓글작성</button>
		</div>
		</div>
		<hr><p></p>
	<div>
		<div class="box-body">
		<table>
			<tr>
			<td rowspan="2" width="70%"><textarea class="form-control" name="rememo"  id="rememo" placeholder="댓글을 입력하세요."></textarea></td>
			<td><input type="text" name="rewriter" id="rewriter" placeholder="댓글 작성자"></td>
			</tr>
			<tr><td><button type="button" id="btnReplySave" class="">저장</button></td></tr>	
		</table>			
		</div>
	</div>
	<hr><p></p>
		<%@include file="reply.jsp" %>
	</section>
		<div id="replyList"></div>
	
    </main>
    <h1>${board.bno}</h1>
	<script>

		$(function(){
			//목록 버튼을 눌렀을 때 처리
			$(".btn-primary").click(function(){
				location.href="list";
			});
			//삭제 버튼을 눌렀을 때 처리
			$(".btn-danger").click(function(){
				location.href="delete?bno=" + ${board.bno};
			});
			//수정 버튼을 눌렀을 때 처리
			$(".btn-warning").click(function(){
				location.href="update?bno=" + ${board.bno};
			});
			//댓글작성 버튼을 눌렀을 때 처리
			$(".btn-info").click(function() {
				location.href = "replyregister?bno=" + ${board.bno};
			});
		})
	</script>
	
	
	
  </body>

</html>