<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/coin.css">
<script src="js/jquery-3.3.1.min.js"></script>
<script>
function bithumb (){
	$.get('https://api.bithumb.com/public/ticker/ALL', function(data) {
		var bithumb_array = ['BTC','BCH','ETC','ETH','XRP','EOS','LTC'];
		for (var key in bithumb_array){
			var bithumb_now = bithumb_array[key];
			var opening_price = data['data'][bithumb_now]['opening_price'];
			var closing_price = data['data'][bithumb_now]['closing_price'];
			var bithumb_krw = parseInt(closing_price);
			var cpYesterday = closing_price - opening_price
			var percent = (cpYesterday / opening_price) * 100.0;
			$('#'+bithumb_now).html(bithumb_krw.toLocaleString()+'KRW');
			if(percent > 0)
				$('#p_'+bithumb_now).html('('+percent.toFixed(2)+'%)').css("color","#43A047");
			else if(percent<0)
				$('#p_'+bithumb_now).html('('+percent.toFixed(2)+'%)').css("color","#E53935");
			else
				$('#p_'+bithumb_now).html('('+percent.toFixed(2)+'%)');
		}
	});
}
function proc() {
	try {
		bithumb();
	} catch(e){			
    } finally {
       // setTimeout("proc()", 3000);
    }
}
</script>
<script type="text/javascript" language="JavaScript">
var mobileKeyWords = new Array('iPhone', 'iPod', 'BlackBerry', 'Android', 'Windows CE', 'Windows CE;', 'LG', 'MOT', 'SAMSUNG', 'SonyEricsson', 'Mobile', 'Symbian', 'Opera Mobi', 'Opera Mini', 'IEmobile');
for (var word in mobileKeyWords){
	if (navigator.userAgent.match(mobileKeyWords[word]) != null){
	    alert("해당 사이트는 모바일을 지원하지 않습니다.")
		<%--window.location.href = "${pageContext.request.contextPath}/m/index.do";--%>
		 break;
	}
}
</script>
<title>Coinweb - 가상화폐 모의투자</title>
</head>
<body onload="proc()">

	<jsp:include page="header.jsp" />

 <!-- 메인 이미지.. 수정예정 -->
 <section class="PolyBackground" >
	<div class="img">
	<div class="PolyBackground_text">
		<h1>도전! 암호화폐 모의거래!<br> 다른 사람들과 수익률을 경쟁해보세요.</h1><br>
		<h3>실제 거래소의 실시간 데이터에 기반하여 <br>모의 거래를 해보세요!</h3>
		<a href="${pageContext.request.contextPath}/business.do"><button class="index_btn">모의거래 시작하기</button></a><br><br>
		<h6>*크롬에 최적화 되어있습니다.</h6>
		</div>
</div>
</section>

   <!-- 메인 이미지.. 끝-->
<!-- 박스 -->
<div class="coinBox">
<h3>현재 총 7개의 가상화폐를 지원합니다.</h3><br>
<a href="${pageContext.request.contextPath}/business.do"><div class="box shadow1">
<img src="${pageContext.request.contextPath}/images/btc.png"><br>
<span class="coin">Bitcoin</span><br><br>
 <div class="content33">
    <p>현재시세 <span id="p_BTC"></span></p>
    <h5 id="BTC"></h5>
  </div>
</div></a>
<a href="${pageContext.request.contextPath}/business.do">
<div class="box shadow1">
<img src="${pageContext.request.contextPath}/images/bch.png"><br>
<span class="coin">Bitcoin Cash</span><br><br>
 <div class="content33">
    <p>현재시세 <span id="p_BCH"></span></p>
    <h5 id="BCH"></h5>
  </div>
</div></a>
<a href="${pageContext.request.contextPath}/business.do">
<div class="box shadow1">
<img src="${pageContext.request.contextPath}/images/eth.png"><br>
<span class="coin">Ethereum</span><br><br>
 <div class="content33">
    <p>현재시세 <span id="p_ETH"></span></p>
    <h5 id="ETH"></h5>
  </div>
</div></a>
<a href="${pageContext.request.contextPath}/business.do">
<div class="box shadow1">
<img src="${pageContext.request.contextPath}/images/etc.png"><br>
<span class="coin">Ethereum Classic</span><br><br>
 <div class="content33">
    <p>현재시세 <span id="p_ETC"></span></p>
    <h5 id="ETC"></h5>
  </div>
</div></a>
<a href="${pageContext.request.contextPath}/business.do">
<div class="box shadow1">
<img src="${pageContext.request.contextPath}/images/litecoin.png"><br>
<span class="coin">Litecoin</span><br><br>
 <div class="content33">
    <p>현재시세 <span id="p_LTC"></span></p>
    <h5 id="LTC"></h5>
  </div>
</div></a>
<a href="${pageContext.request.contextPath}/business.do">
<div class="box shadow1">
<img src="${pageContext.request.contextPath}/images/ripple.png"><br>
<span class="coin">Ripple</span><br><br>
 <div class="content33">
    <p>현재시세 <span id="p_XRP"></span></p>
    <h5 id="XRP"></h5>
  </div>
</div></a>
<a href="${pageContext.request.contextPath}/business.do">
<div class="box shadow1">
<img src="${pageContext.request.contextPath}/images/eos.png"><br>
<span class="coin">Eos</span><br><br>
 <div class="content33">
    <p>현재시세 <span id="p_EOS"></span></p>
    <h5 id="EOS"></h5>
  </div>
</div></a>
<a href="${pageContext.request.contextPath}/business.do"><button class="boxbtn shadow2">거래소 보기</button></a>
</div>




 

 
      <!-- 코인웹정식출시 -->
   
  
		<section class="content-style">		
	
			<form class="mycgv">
				 <a href="#"><span class="span1">
				 <img src="${pageContext.request.contextPath}/images/iconmonstr-smartphone-16-240 (1).png">
				 <br><h2>코인 앱 출시</h2><b>지금 바로 설치하세요</b></span></a>
				<a href="${pageContext.request.contextPath}/rangking.do"><span class="span2">
				<img src="${pageContext.request.contextPath}/images/iconmonstr-award-24-120.png">
				<h2>랭킹 시스템</h2> <b>다른사람들과 경쟁해보세요</b></span></a>
			</form>
		</section>		

   

       <!-- 코인웹정식출시  끝-->
 


  <footer>
  	<jsp:include page="footer.jsp" />
  	</footer>
	</body>

</html>