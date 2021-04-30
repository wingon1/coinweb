<%@ page language="java" contentType="text/html; charset=EUC-KR"
pageEncoding="EUC-KR" import="coinweb.vo.BoardVO, coinweb.dao.BoardDAO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    
<!DOCTYPE html>
<html>
<head>
<title>Coinweb - ����ȭ�� ��������</title>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
  <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
  <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
  <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.css" rel="stylesheet">
  <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.js"></script>
  
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/freeboard.css">

</head>
<script type="text/javascript">

/*CONTENT EMPTY&RESET*/
$(document).ready(function(){
	/*modal-background ������. �̰� �����ϸ� �׸� ���� ÷���Ҷ� ������ modal �� ���� ���� */
	$(".note-btn").click(function(){
		$(".modal-backdrop").css("z-index","0").css("background-color","#000");
		$(".note-toolbar").css("z-index","0");
		
	});
	/*reset*/
	$("#contentBtnReset").click(function(){
		$("#summernote").summernote("reset");
	});
	/*������ ��ư Ŭ����*/
	$("#contentBtn").click(function(){
		
		if($("#title").val()==""){
			alert("������ �Է��ϼ���");
			$("#title").focus();
			return false;	
		/*content ������*/				
		}else if($('#summernote').summernote('isEmpty')) {
			  alert('������ �Է��ϼ���');
			  $('#summernote').summernote('focus');
			  return false;
		/*��� ajax*/	  
		}else {
			var htmlContent = $('#summernote').summernote('code');
			alert(htmlContent);
		/*
			$(".summernote").html(htmlContent);
			freeboard_form.submit;			
		*/
		}
			
	});		
});
</script>

<body>
<jsp:include page="../header.jsp"></jsp:include> 
		
		
	
		<div class="freeboard_header">
			<h1 class="freeboard_header_h1">
			�Խ��Ǽ���</h1></div>
		
	<div class="container">	 
		
		<form name="boardForm" action ="freeboard_update_controller.do" method="post" class="board_update">
		<input type="hidden" name="no" value="${no}">
		<input type="hidden" name="content" id="content">
			
					
						<input type="text" id="title" name="title" value="${vo.title}" class="title form-control">
						
					
						<textarea rows="content" cols="content" id="summernote" id="content" name="content">${vo.content}</textarea>
					
				
					<div style="text-align: center;">
						<a href="${pageContext.request.contextPath}/freeboard_content.do?no=${no}"><button type="button" class="btn btn-comm-con" >���� ������</button></a>
						<button type="submit" id="btnUpdate" class="btn btn-comm-con">�����ϱ�</button>
						<a href="${pageContext.request.contextPath}/freeboard_delete.do?no=${no}"><button type="button" class="btn btn-comm-con">�����ϱ�</button></a>
						<a href="${pageContext.request.contextPath}/index.do"><button type="button" class="btn btn-comm-con">Ȩ����</button></a>
					</div>
		</form>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include> 
	
	<script>
	$('#summernote').summernote({
	 height: 500,                 // set editor height
	 minHeight: 500,            // set minimum height of editor
	 maxHeight: 800,            // set maximum height of editor
    focus: true,
    
	});		

	</script> 
</body>






</html>