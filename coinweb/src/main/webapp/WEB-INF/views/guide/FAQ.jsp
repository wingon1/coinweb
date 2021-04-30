<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/guide.css">
<script src="js/jquery-3.3.1.min.js"></script>
   
   <script>
$(document).ready(function() {
  jQuery(".content").hide();
//content Ŭ������ ���� div�� ǥ��/����(���)
  $(".heading").click(function()
  {
    $(".content").not($(this).next(".content").slideToggle(500)).slideUp();
  });
});
</script>
<title>Coinweb - ����ȭ�� ��������</title>
</head>
<body>
	<jsp:include page="../header.jsp" />


	<div class="header_bak1">
		<center>
			<h1 class="main_text">FAQ</h1>
		</center>
	</div>


	<center>
		<div id="ch">
			<div class="layer1">
				<div class="heading">Q.����Ʈ���̵� �� � �����͸� �����ϳ���?</div>
				<span class="content">
					<p style="color: #F08235">Answer</p>
					<p>���� �ŷ��� ������ ���� �����͸� �ǽð����� �����ϰ� �ֽ��ϴ�.</p>
					<p>�ŷ����� ������ ����, ȣ��, �ֹ����� ���ø鼭 Ʈ���̵� �� �� �ֽ��ϴ�.</p>


				</span>
				<div class="heading">Q. ���ϴ� �ŷ��ҿ��� ���� Ʈ���̵��� �����Ѱ���?</div>
				<span class="content">

					<p style="color: #F08235">Answer</p>

					<p>���� �ŷ����� ���ε鸸 ����Ʈ���̵��� �� �� �ֽ��ϴ�.</p>
				</span>

				<div class="heading">Q. � ������ ������ ����Ʈ���̵��� �� �� �ֳ���?</div>
				<span class="content">
					<p style="color: #F08235">Answer</p>
					<p>��Ʈ����, ��Ʈ���� ĳ��, �̴�����, �̴� Ŭ����, ����, ���, ����Ʈ����,��׷�, ��Ʈĳ��, ����</p>
					<p>�� 10���� ������ ������ ���� Ʈ���̵� �Ͻ� �� �ֽ��ϴ�.</p>
				</span>


				<div class="heading">Q. ���� �ŷ��ҿ��� Ʈ���̵� �ϴ� ��İ� �Ȱ�����?</div>
				<span class="content">
					<p style="color: #F08235">Answer</p>
					<p>��, �ŷ��ҿ��� ���� Ʈ���̵� �ϴ� ��İ� �����ϴ�.</p>
					<p>���� Ʈ���̵��̶� �����Ͻð� ����ó�� ����Ʈ���̵��� �ϽǱ� �����ص帳�ϴ�.</p>
				</span>


				<div class="heading">Q. ���� Ʈ���̵��� ����� ��� Ȯ�� �ϳ���?</div>
				<span class="content">

					<p style="color: #F08235">Answer</p>
					<p>[�ŷ��ϱ�] ȭ�鿡�� �� �ŷ��Һ�, ���κ� ���� ������ ������ �ڻ� ��Ȳ�� Ȯ�� �� �� �ֽ��ϴ�.</p>
					<p>����, ��� �׺���̼��� [�ڻ���Ȳ] ī�װ����� �ŷ��Һ� �ڻ��� ����� �� �ڻ���Ȳ�� �Ѵ��� Ȯ�� �Ͻ� ��
						�ֽ��ϴ�.</p>

				</span>

				<div class="heading">Q. ��ŷ�� ���� ������ �����ΰ���?</div>
				<span class="content">

					<p style="color: #F08235">Answer</p>
					<p>��ŷ���� ������ ������ '���ͷ�'�� �ϰ� �ֽ��ϴ�. �ʱ� ���ں�� ��� ���ͷ��� ���� ���� ȸ���� 1����
						��ũ�˴ϴ�.</p>

				</span>

				<div class="heading">Q. �ʱ� ����Ʈ���̵� ���ڱ��� ��� �ǳ���?</div>
				<span class="content">

					<p style="color: #F08235">Answer</p>
					<p>���� ȸ������ �� 30,000,000(��õ��)���� ���ڱ��� �����ϰ� �ֽ��ϴ�.</p>
					<p>�ش� ���ڱ����� ���� Ʈ���̵��̶�� �������� ������ ���� �� Ʈ���̴��� �Ͻø� �˴ϴ�.</p>

				</span>

				<div class="heading">Q. �������� �̿��ϸ鼭 ���� �� ���ǻ����� ���� �ϰ������ ��� �ϳ���?</div>
				<span class="content">

					<p style="color: #F08235">Answer</p>
					<p>��� �׺���̼� �޴����� [���ǰԽ���]�� �����ϼż� �ϰ���� ������ ������ �ֽø� �˴ϴ�.</p>
					<p>�亯�� ������ ���� �����帳�ϴ�.</p>
					<p>* �����ϱ� �Խ����� ������ �Խù��� ���Դϴ�.</p>

				</span>



			</div>
		</div>
	</center>

	<jsp:include page="../footer.jsp" />
</body>
</html>
