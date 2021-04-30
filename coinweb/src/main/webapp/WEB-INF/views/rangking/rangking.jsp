<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="coinweb.dao.*, coinweb.vo.*"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/coin.css">
<script src="js/jquery-3.3.1.min.js"></script>


<title>Coinweb - ����ȭ�� ��������</title>
</head>
<body>

	<jsp:include page="../header.jsp" />
	
	<!-- ��ŷ  -->
	<section class="rangking">
		<div class="rangk_header">
			<h1 class="rangking_header_h1">
			<img src="${pageContext.request.contextPath}/images/iconmonstr-award-24-120.png" style="width: 50px; height: 50px;">
			<br>���ͷ� ��ŷ</h1>
			<p>���ͷ��� KRW�� �������� ���˴ϴ�.<br>
				<br>
				���¡�� �߰ߵ� �� �ѹ�ó�� �� �� �ֽ��ϴ�.</p></div>
		<!-- ���� -->
		<div class="rangking_main">
		<!-- 123�� -->
		<div class="rangking_1">
			<img src="${pageContext.request.contextPath}/images/rank1.png" style="width: 150px; height: 150px;">
			<h3>1��</h3>
			<c:forEach items="${list}" var="vo1" begin="0" end="0">
				<p>${vo1.name}</p>
				<p>���ڻ�: <font color=red>${vo1.money}</font>��</p>
				<p>���ͷ� : <font color=red>${vo1.profit}</font>%</p>
			</c:forEach>
		</div>
		
		<div class="rangk_top2 rangking_2">
			<img src="${pageContext.request.contextPath}/images/rank2.png" style="width: 150px; height: 150px;">
			<h3>2��</h3>
			<c:forEach items="${list}" var="vo2" begin="1" end="1">
				<p>${vo2.name}</p>
				<p>���ڻ�: <font color=red>${vo2.money}</font>��</p>
				<p>���ͷ� : <font color=red>${vo2.profit}</font>%</p>
			</c:forEach>
		</div>
		
		<div class="rangk_top2 rangking_3">
			<img src="${pageContext.request.contextPath}/images/rank3.png" style="width: 150px; height: 150px;">
			<h3>3��</h3>
			<c:forEach items="${list}" var="vo3" begin="2" end="2">
				<p>${vo3.name}</p>
				<p>���ڻ�: <font color=red>${vo3.money}</font>��</p>
				<p>���ͷ� : <font color=red>${vo3.profit}</font>%</p>
			</c:forEach>
		</div>
		
		<!-- ������20�� -->	
			<table class="rangking_4_20">
				
			  <tr>
			    <th>����</th>
			    <th>�г���</th>
			    <th>���ڻ�</th>
			    <th>���ͷ�</th>
			  </tr>
			   
			  <c:forEach items="${list}" var="vo" begin="3" end="21">
			  <tr>
			    <td>${vo.rno}</td>
			    <td>${vo.name}</td>
			    <td><font color=red>${vo.money}</font>��</td>
			    <td><font color=red>${vo.profit}</font>%</td>
			  </tr>
			  </c:forEach>
			
	
			
			
			
			</table>
			
		
		
		</div> 
	
	
	</section>
	
	
	
	
	<!-- ��ŷ�� -->
	
	
	
	 	<jsp:include page="../footer.jsp" />

</body>
</html>