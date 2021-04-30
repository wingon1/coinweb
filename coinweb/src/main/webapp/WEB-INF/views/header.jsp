<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="coinweb.dao.*, coinweb.vo.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/header.css">


<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/setInterval.js"></script>



<script type="text/javascript">jQuery.noConflict();</script>
<script>
jQuery(document).ready(function(){
	
	jQuery("#btnLogin").click(function(){
		if(jQuery("#signin-email").val()==""){
			alert("���̵� �Է��ϼ���.");
			jQuery("#signin-email").focus();
			return false;
		}else if(jQuery("#signin-password").val()==""){
			alert("�н����带 �Է��ϼ���.");
			jQuery("#signin-password").focus();
			return false;
		}
		
		loginForm.submit();
		
		saveid();
	});
	
	$(function(){
		getid();
	}); //function(){
		  
	function saveid() {
		var expdate = new Date();
		
		// �⺻������ 30�ϵ��� ����ϰ� ��. �ϼ��� �����Ϸ��� * 30���� ���ڸ� �����ϸ� ��
		if($("#remember-me").is(":checked") == true){
			if(getCookie("saveid") != $("#signin-email").val())
				expdate.setTime(expdate.getTime() - 1);
			expdate.setTime(expdate.getTime() + 1000 * 3600 * 24 * 30); // 30��
		}else{
		   expdate.setTime(expdate.getTime() - 1);
		}
	   setCookie("saveid", $("#signin-email").val(), expdate);
	 } //saveid()
	 
	 function setCookie (name, value, expires) {
	    document.cookie = name + "=" + escape (value) +"; path=/; expires=" + expires.toGMTString();
	  } //setCookie(name,value,expires)

	  function getCookie(Name) {
	    var search = Name + "=";
	    if (document.cookie.length > 0) { // ��Ű�� �����Ǿ� �ִٸ�
	      offset = document.cookie.indexOf(search);
	      if (offset != -1) { // ��Ű�� �����ϸ�
	        offset += search.length;
	        // set index of beginning of value
	        end = document.cookie.indexOf(";", offset);
	        // ��Ű ���� ������ ��ġ �ε��� ��ȣ ����
	        if (end == -1)
	          end = document.cookie.length;
	        return unescape(document.cookie.substring(offset, end));
	      }
	    }
	    return "";
	  } //getCookie(Name)

	 function getid() {
	  var saveId = getCookie("saveid");
	  if(saveId != "") {
	   $("#signin-email").val(saveId);
	   $("#remember-me").prop("checked",true);
	  }
	 } //getid()

//���̵� ���� �� 

	
});
</script>

<script>
jQuery(document).ready(function(){
	

	jQuery("#btnJoin").click(function(){
		if(jQuery("#signup-email").val()==""){
			alert("�̸����� �Է��ϼ���.");
			jQuery("#signup-email").focus();
			return false;
		}else if(jQuery("#signup-username").val()==""){
				alert("�г����� �Է��ϼ���");
				jQuery("#signup-username").focus();
				return false;
			}else if(jQuery("#pass").val()==""){
			alert("��й�ȣ�� �Է��ϼ���.");
			jQuery("#pass").focus();
			return false;	
			
			}else if(jQuery("#cpass").val()==""){
				alert("��й�ȣ�� ���Է� �ϼ���.");
				jQuery("#cpass").focus();
				return false;
		}else if(jQuery("#agree").is(":checked") == false){
			alert("�̿��� �� �������� ���Ǹ� üũ�ϼ���.");
			jQuery("#agree").focus();
			return false;
		}
		
		//��������
		joinForm.submit();
		
		//��й�ȣ&��й�ȣ Ȯ�� üũ
	});
	jQuery("#cpass").focusout(function(){
		// 1.�н����� �Է����� ����ִ��� Ȯ��  ������� ���� ���¿����� ��
		// 2. 1���� ����� ��й�ȣ Ȯ������ ������� ���� ���¿����� �񱳸� ���� 
		var minimum = 8;
		var pass = jQuery("#pass").val().length;
		
		
		
		if(jQuery("#pass").val()=="" ){
			alert("�н����带 �Է��ϼ���")
			jQuery("#pass").focus;
			return false;
			
		}else if(pass <minimum){
			alert("�н����带 8�ڸ� �̻� �Է��ϼ���")
			jQuery("#pass").focus;
			jQuery("#pass").val("");
			jQuery("#cpass").val("");
			return false;
		
			
		
		}else{
			if(jQuery("#cpass").val()!=""){
			
			
				//��й�ȣ & ��й�ȣ Ȯ�� üũ
				if(jQuery("#pass").val()== jQuery("#cpass").val()){
				jQuery("#msg").css("font-size","12pt").css("color","blue").css("display","block");
				jQuery("#msg").text("��й�ȣ�� �����մϴ�").css("padding","3px 0px 0px 0px");
				return false;
			}else{
				jQuery("#msg").css("font-size","12pt").css("color","red").css("display","block").css("padding","3px 0px 0px 0px");
				jQuery("#msg").text("��й�ȣ�� �ٸ��ϴ�. �ٽ� �Է����ּ���");
				jQuery("#pass").val("").focus();
				jQuery("#cpass").val("");
					return false;
		    }
				
		 }
			
	  }
		
			
	
});
	//���̵� �ߺ�üũ �� �̸��� ��ȿ���˻� 
	jQuery("#signup-email").focusout(function(){
		//alert("���̵� �ߺ�");
		var email = jQuery("#signup-email").val();
		var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		//alert(id);
		
		jQuery.ajax({
			url : '${pageContext.request.contextPath}/id_check.do',
			type :'POST',
			data : 'email='+email, 
			dataType : "json",
			success : function(data){
				if(data.length != 0){	
					//alert("����"+data);
					
					if(jQuery("#signup-email").val()==""){
						jQuery("#id_msg").css("display","block").css("font-size","12pt")
							.css("color","red").css("padding","3px 0px 0px 0px");
						jQuery("#id_msg").text("�̸����� �Է��ϼ���.");
						jQuery("#signup-email").focus();
					}else if(exptext.test(email)==false){
						jQuery("#id_msg").css("display","block").css("font-size","12pt")
							.css("color","red").css("padding","3px 0px 0px 0px");
						jQuery("#id_msg").text("�̸��� ������ �ùٸ��� �ʽ��ϴ�.");
						//jQuery("#signup-email").focus();
						jQuery("#signup-email").val("");
					}else if(data == 1){
						jQuery("#id_msg").css("display","block").css("font-size","12pt")
						.css("color","red").css("padding","3px 0px 0px 0px");
						jQuery("#id_msg").text("�ߺ��� �̸����Դϴ�.");
						//jQuery("#signup-email").focus();		
						jQuery("#signup-email").val("");
					}else{
						jQuery("#id_msg").css("display","block").css("font-size","12pt")
							.css("color","blue").css("padding","3px 0px 0px 0px");
						jQuery("#id_msg").text("��밡���� �̸��� �Դϴ�.");
						jQuery("#signup-username").focus();
						
					}
			
				}
			}
		});			
	});	//end of id_check	
	
	jQuery("#signup-username").focusout(function(){
		//alert("�г��� �ߺ� üũ");
		var name = jQuery("#signup-username").val();
		//alert(name);
		
		$.ajax({
			url : '${pageContext.request.contextPath}/name_check.do',
			type :'GET',
			data : 'name='+name,
			dataType : "json",
			contentType : 'application/x-www-form-urlencoded;charset=utf-8',
			success : function(data){
				if(data.length != 0){	
					//alert("����"+data);
					//alert(name);
	
					 if(data == 1){
						 jQuery("#name_msg").css("display","block").css("font-size","12pt")
						.css("color","red").css("padding","3px 0px 0px 0px");
						 jQuery("#name_msg").text("�ߺ��� �г����Դϴ�.");
						 jQuery("#signup-username").val("").focus();
		
					
						
					}else{
					
						if(jQuery("#signup-username").val()==""){
							jQuery("#name_msg").css("display","block").css("font-size","12pt")
							.css("color","red").css("padding","3px 0px 0px 0px");
							jQuery("#name_msg").text("�г����� �Է��ϼ���.");
							//$("#signup-username").val("").focus();
						}else{
							jQuery("#name_msg").css("display","block").css("font-size","12pt")
							.css("color","blue").css("padding","3px 0px 0px 0px");
							jQuery("#name_msg").text("��밡���� �г��� �Դϴ�.");
							//jQuery("#pass").focus();
						}
						return false;
					}
			
				}
			}
		});			
	});	//end of id_check	
	
	/*��й�ȣ �ڸ��� ��ȿ���˻� */
	
  /*  jQuery("#pass").focusout(function(){
		var minimum = 8;
		var pass = jQuery("#pass").val().length;
	
		if(pass < minimum){
			jQuery("#msg")	.css("color","red").css("padding","3px 0px 0px 0px");
			jQuery("#msg").text("8�� �̻� �Է� �ϼ���.");
			jQuery("#pass").focus();
			
		return false;
			
		}else{
			jQuery("#msg")	.css("color","red").css("padding","3px 0px 0px 0px");
			jQuery("#msg").text("");
			jQuery("#cpass").focus();
		}

		return false;
	});*/
	
});  
</script>



<script>                              
jQuery(document).ready(function(){



	var result = 0;

	jQuery("#pcbtn").click(function(){
		if(jQuery("#upass").val()==""){
			alert("���� ��й�ȣ�� �Է��ϼ���")
			return false;

		}else if(jQuery("#npass").val()==""){
			alert("����й�ȣ�� �Է��ϼ���.");

			return false;

			}else if(jQuery("#ncpass").val()==""){
				alert("��й�ȣ�� ���Է� �ϼ���.");

				return false;

			}

		if(result==1)

			passUpdate.submit();

		else{

			alert("���� ��й�ȣ�� �ٽ� �Է����ּ���");

			return false;

		}

	}); //end


	 jQuery("#upass").focusout(function(){
		 var email = jQuery("#uid").val();
		 var pass = jQuery("#upass").val();
		// alert(email+","+pass);

		 jQuery.ajax({

			 url : '${pageContext.request.contextPath}/password_check.do',
			 type :'GET',
			 data : 'email='+email+'&pass='+pass,
			 dateType : "json",
			 success: function(data){
				 //alert(data);

					if(data != 1){
						jQuery("#upw_msg").css("display","block").css("font-size","12pt")
						.css("color","red").css("padding","3px 0px 0px 0px");
					jQuery("#upw_msg").text("����ġ!");
					jQuery("#upass").val("");
					

					
					return false; 

					

					}else if (data == 1){

						jQuery("#upw_msg").css("display","block").css("font-size","12pt")
						.css("color","blue").css("padding","3px 0px 0px 0px");
					jQuery("#upw_msg").text("��ġ!");
					result = 1;
					return result; 

					}		

			

				 }

		

		

  		});

	});

   

	 jQuery("#ncpass").focusout(function(){
			// 1.�н����� �Է����� ����ִ��� Ȯ��  ������� ���� ���¿����� ��
			// 2. 1���� ����� ��й�ȣ Ȯ������ ������� ���� ���¿����� �񱳸� ���� 
			
				var minimum = 8;
			var pass = jQuery("#npass").val().length;
			
			
			if(jQuery("#npass").val()=="" ){
				alert("�н����带 �Է��ϼ���")

				return false;

			}else if (pass <minimum){
				alert("�н����带 8�ڸ� �̻� �Է����ּ���.")
				jQuery("#ncpass").val("");
				jQuery("#npass").val("");
				return false;
			
			}else{

				if(jQuery("#ncpass").val()!=""){

					//��й�ȣ & ��й�ȣ Ȯ�� üũ

					if(jQuery("#npass").val()== jQuery("#ncpass").val()){
					jQuery("#nupw_msg").css("font-size","12pt").css("color","blue").css("display","block");
					jQuery("#nupw_msg").text("��й�ȣ�� �����մϴ�.").css("padding","3px 0px 0px 0px");

					return false;

				}else{

					jQuery("#nupw_msg").css("font-size","12pt").css("color","red").css("display","block").css("padding","3px 0px 0px 0px");
					jQuery("#nupw_msg").text("��й�ȣ�� �ٸ��ϴ�. �ٽ� �Է����ּ���");
					jQuery("#pass").val("").focus();

					jQuery("#ncpass").val("");

						return false;

			    }
			 }
		  }
	});

	 

	 /*��й�ȣ �ڸ��� ��ȿ���˻� */
	/*	jQuery("#npass").focusout(function(){

			var minimum = 8;
			var pass = jQuery("#npass").val().length;

		
			if(pass < minimum){
				jQuery("#nupw_msg")	.css("color","red").css("padding","3px 0px 0px 0px");
				jQuery("#nupw_msg").text("8�� �̻� �Է� �ϼ���.");
				jQuery("#npass").focus();
				return false;

			}else{

				jQuery("#nupw_msg")	.css("color","red").css("padding","3px 0px 0px 0px");
				jQuery("#nupw_msg").text("");
				jQuery("#ncpass").focus();
				return false;

			}

		});*/

	

});

</script>
<body>
	<header>
		<!-- Navigation -->
		<c:choose>
			<c:when test="${sid == null}">
				<div class="topnav shadow" id="navbar">
					<div class="nav">
						<a class="activea" href="${pageContext.request.contextPath}/index.do"><span>Coinweb</span></a>
						<div class="topnav-right">
							<div class="cd-main-nav__list js-signin-modal-trigger">
								<a class="cd" href="${pageContext.request.contextPath}/business.do">�ŷ��ϱ�</a>
								<!-- inser more links here -->
								<a class="cd-main-nav__item cd-main-nav__item--signin" href="#0"
									data-signin="login">�α���</a> <a
									class="cd-main-nav__item cd-main-nav__item--signup" href="#0"
									data-signin="signup">ȸ������</a>
								<div class="dropdown">
									<button class="dropbtn" href="#contact">
										Ŀ�´�Ƽ<i class="fa fa-caret-down"></i>
									</button>
									<div class="dropdown-content">
										<a href="${pageContext.request.contextPath}/rangking.do">��ŷ</a> <a
											href="${pageContext.request.contextPath}/freeboard.do">�����Խ���</a>
										<!--   <a href="#">���μҽ�</a>-->
									</div>
								</div>
								<div class="dropdown">
									<button class="dropbtn" href="#contact">
										������<i class="fa fa-caret-down"></i>
									</button>
									<div class="dropdown-content">
										<a href="${pageContext.request.contextPath}/guide.do">�̿밡�̵�</a> <a
											href="${pageContext.request.contextPath}/FAQ.do">FAQ</a> <a
											href="${pageContext.request.contextPath}/bbs.do">�����ϱ�</a>


									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:when>
			<c:when test="${sid != null}">
				<div class="topnav shadow" id="navbar">
					<div class="nav">

						<a class="activea" href="${pageContext.request.contextPath}/index.do"><span>Coinweb</span></a>

						<div class="topnav-right">
							<div class="cd-main-nav__list js-signin-modal-trigger">

								<a class="cd" href="${pageContext.request.contextPath}/business.do">�ŷ��ϱ�</a>

								<!-- inser more links here -->
								<div class="dropdown">
									<button class="dropbtn" href="#contact" id="nname">${name}<i
											class="fa fa-caret-down"></i>
									</button>

									<div class="dropdown-content">
										<a href="${pageContext.request.contextPath}/wallet.do">�� ����</a> <a
											onclick="document.getElementById('id02').style.display='block'"
											style="width: auto; cursor: pointer;">��й�ȣ����</a>
									</div>
								</div>
								<a class="cd-main-nav__item cd-main-nav__item--signin"
									href="${pageContext.request.contextPath}/logout.do">�α׾ƿ�</a>
								<div class="dropdown">
									<button class="dropbtn" href="#contact">
										Ŀ�´�Ƽ<i class="fa fa-caret-down"></i>
									</button>
									<div class="dropdown-content">
										<a href="${pageContext.request.contextPath}/rangking.do">��ŷ</a> <a
											href="${pageContext.request.contextPath}/freeboard.do">�����Խ���</a>
										<!--   <a href="#">���μҽ�</a>-->
									</div>
								</div>
								<div class="dropdown">
									<button class="dropbtn" href="#contact">
										������<i class="fa fa-caret-down"></i>
									</button>
									<div class="dropdown-content">
										<a href="${pageContext.request.contextPath}/guide.do">�̿밡�̵�</a> <a
											href="${pageContext.request.contextPath}/FAQ.do">FAQ</a> <a
											href="${pageContext.request.contextPath}/bbs.do">�����ϱ�</a>


									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:when>
		</c:choose>
		<div class="cd-signin-modal js-signin-modal">
			<!-- this is the entire modal form, including the background -->
			<div class="cd-signin-modal__container">
				<!-- this is the container wrapper -->
				<ul
					class="cd-signin-modal__switcher js-signin-modal-switcher js-signin-modal-trigger">
					<li><a href="#0" data-signin="login" data-type="login" id="ll"
						class="fa fa-share" style="font-size: 22px">&nbsp;�α���</a></li>
					<li><a href="#0" data-signin="signup" data-type="signup"
						id="jj" class="fa fa-user-plus" style="font-size: 22px">&nbsp;ȸ������</a></li>
				</ul>

				<div class="cd-signin-modal__block js-signin-modal-block"
					data-type="login">
					<!-- log in form -->
					<form name="loginForm"
						action="${pageContext.request.contextPath}/login.do" method="post"
						class="cd-signin-modal__form">
						<p class="cd-signin-modal__fieldset">


							<label
								class="cd-signin-modal__label cd-signin-modal__label--email cd-signin-modal__label--image-replace"
								for="signin-email">E-mail</label> <input
								class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding cd-signin-modal__input--has-border"
								name="email" id="signin-email" placeholder="E-mail">

						</p>

						<p class="cd-signin-modal__fieldset">
							<label
								class="cd-signin-modal__label cd-signin-modal__label--password cd-signin-modal__label--image-replace"
								for="signin-password">Password</label> <input
								class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding cd-signin-modal__input--has-border"
								name="pass" id="signin-password" type="password"
								placeholder="Password">

						</p>

						<p class="cd-signin-modal__fieldset">
							<input type="checkbox" id="remember-me"
								class="cd-signin-modal__input " name="chkuser_id">
							<label for="remember-me">����</label>
						</p>

						<p class="cd-signin-modal__fieldset">
							<button
								class="cd-signin-modal__input cd-signin-modal__input--full-width"
								id="btnLogin" type="submit">�α���</button>
						</p>
					</form>


				</div>
				<!-- cd-signin-modal__block -->

				<div class="cd-signin-modal__block js-signin-modal-block"
					data-type="signup">
					<!-- sign up form -->
					<form name="joinForm"
						action="${pageContext.request.contextPath}/join.do" method="post"
						class="cd-signin-modal__form">

						<p class="cd-signin-modal__fieldset">
							<label
								class="cd-signin-modal__label cd-signin-modal__label--email cd-signin-modal__label--image-replace"
								for="signup-email">E-mail</label> <input
								class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding cd-signin-modal__input--has-border"
								id="signup-email" name="email" type="email" placeholder="�̸��� �Է�">
							<span id="id_msg"></span>
						</p>


						<p class="cd-signin-modal__fieldset">
							<label
								class="cd-signin-modal__label cd-signin-modal__label--username cd-signin-modal__label--image-replace"
								for="signup-username">Username</label> <input
								class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding cd-signin-modal__input--has-border"
								id="signup-username" name="name" type="text"
								placeholder="�г��� �Է�"> <span id="name_msg"></span>
						</p>



						<p class="cd-signin-modal__fieldset">
							<label
								class="cd-signin-modal__label cd-signin-modal__label--password cd-signin-modal__label--image-replace"
								for="signup-password">Password</label> <input
								class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding cd-signin-modal__input--has-border"
								id="pass" name="pass" type="password" placeholder="��й�ȣ 8�� �̻��Է�">
							<span id="msg"></span>
						</p>
						<p class="cd-signin-modal__fieldset">
							<label
								class="cd-signin-modal__label cd-signin-modal__label--password cd-signin-modal__label--image-replace"
								for="signup-password">Password</label> <input
								class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding cd-signin-modal__input--has-border"
								id="cpass" type="password" placeholder="��й�ȣ ���Է�">

						</p>

						<p class="cd-signin-modal__fieldset">
							<input type="checkbox" id="agree" name="agree"
								class="cd-signin-modal__input "> <label
								for="accept-terms">�̿��� �� �������� ����</a></label>
						</p>

						<p class="cd-signin-modal__fieldset">
							<button
								class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding"
								id="btnJoin" type="submit">ȸ������</button>
						</p>

					</form>
				</div>
				<!-- cd-signin-modal__block -->



			</div>
			<!-- cd-signin-modal__container -->
		</div>
		<!-- cd-signin-modal -->
		<!-- password change modal -->

		<div id="id02" class="modal">
			<form class="modal-content animate" name="passUpdate"
				action="${pageContext.request.contextPath}/password_update_c.do"
				method="post">
				<div class="imgcontainer">
					<span
						onclick="document.getElementById('id02').style.display='none'"
						class="close" title="Close Modal">&times;</span>


				</div>

				<p>
				<h1 id="pc">&ensp;&ensp;&ensp;&ensp; ��й�ȣ ����</h1>
				<div class="ps_container">


					<input type="text" value="${email} " id="uid" disabled> <input
						type="hidden" name="email" value="${email}" /> <input
						type="password" placeholder="���� ��й�ȣ" id="upass"> <span
						id="upw_msg"></span> <input type="password" name="pass"
						placeholder="�� ��й�ȣ" id="npass"> <span id="nupw_msg"></span>
					<input type="password" placeholder="�� ��й�ȣ ���Է�" id="ncpass">
					<p id="p1">�̸��� ������ ���Ͻô� ��� 1:1 �����ϱ⸦ �̿��� �ּ���.</p>
					<button type="submit" id="pcbtn">�����ϱ�</button>
				</div>
			</form>
		</div>
		<!-- Navigation �� -->

	</header>
</body>
<script src="${pageContext.request.contextPath}/js/main.js"></script>
<script src="${pageContext.request.contextPath}/js/test2.js"></script>

</html>
