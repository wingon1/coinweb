<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/coin.css">
<title>Coinweb - ����ȭ�� ��������</title>
<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
<script>
var sid = ${sid};
function numberWithCommas(x) {
    return Math.round(x).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
function Floor(n, pos) {
	var digits = Math.pow(10, pos);
	var num = Math.floor(n * digits) / digits;
	return num.toFixed(pos);
}
function fShowData() {
	try {
		GetWalletList();
		GetOrderList();
		GetHistoryList();
	} catch(e){			
    } finally {
        setTimeout("fShowData()", 3000);
    }
}
function GetWalletList(){
	if(sid!=0){
		$.ajax({
			url : '${pageContext.request.contextPath}/wallet_list.do',
			type :'GET',	
			data : 'id='+sid,
			dataType : 'json',
			success : function(data){
					$("#krw").html(numberWithCommas(data[0].available)+"��");
					$("#total").html(numberWithCommas(data[0].tot)+"��");
					$("#tot").html(numberWithCommas(data[0].tot)+"��");
					if(data[0].tot == 30000000)
						$("#profit").html("0.00%");	
					else if(data[0].tot > 30000000)
						$("#profit").html("+"+Floor((data[0].tot/30000000)*100-100,2)+"%").css("color","#43A047");
					else if(data[0].tot < 30000000)
						$("#profit").html(Floor((data[0].tot/30000000)*100-100,2)+"%");
					$('#wallet_table > tbody').empty();
					for(var i=0;i<data.length;i++){
						if(data[i].available>0){
							code = "<tr><td>"+data[i].coin+"</td><td>"+data[i].coin_name+"</td><td>"+(data[i].available).toFixed(4)+"</td><td>"+(data[i].using).toFixed(4);
							$('#wallet_table > tbody:last').append(code);
						}
					}
				}	
			});
	}
}		

function GetOrderList(){
	$.ajax({
		url : '${pageContext.request.contextPath}/order_list.do',
		type :'GET',	
		data : 'id='+sid+'&coin=ALL',
		dataType : 'json',
		success : function(data){
			if(data.length != 0) $("#order_wait").hide();
			else if(data.length == 0) $("#order_wait").show();
			$('#order_table > tbody').empty();
			for(var i=0;i<data.length;i++){
				var type = data[i].type;
				if(type == 'B')	type = "<td style='color:red;'>�ż�</td>"; else type = "<td style='color:blue;'>�ŵ�</td>";
				code = "<tr><td>"+data[i].coin+"</td><td>"+data[i].date+"</td>"+type+"<td>"+numberWithCommas(data[i].price)+"</td><td>"
				+Floor(data[i].amount,4)+"/"+Floor(data[i].amount_c,4)+"</td><td>�����</td></tr>";
				$('#order_table > tbody:last').append(code);
			}
		}
	});
}

function GetHistoryList(){
	$.ajax({
		url : '${pageContext.request.contextPath}/history_list.do',
		type :'GET',	
		data : 'id='+sid+'&coin=ALL',
		dataType : 'json',
		success : function(data){
			if(data.length != 0) $("#history_wait").hide();
			else if(data.length == 0) $("#history_wait").show();
			$('#history_table > tbody').empty();
			var length = 0;
			if(data.length < 100) length = data.length; else length = 100;
			for(var i=0;i<length;i++){
				var type = data[i].type;
				if(type == 'B')	type = "<td style='color:red;'>�ż�</td>"; else type = "<td style='color:blue;'>�ŵ�</td>";
				code = "<tr><td>"+data[i].coin+"</td><td>"+data[i].date+"</td>"+type+"<td>"+numberWithCommas(data[i].price)+"</td><td>"
					+Floor(data[i].amount,4)+"</td><td>�Ϸ�</td></tr>";
				$('#history_table > tbody:last').append(code);
			}
		}
	});
}
</script>
</head>
<body class="business" onload="fShowData()">

	<jsp:include page="../header.jsp" />


<section class="wallet" id="wallet">

<div class="wallet_tablink_btn_box">
<button class="wallet_tablink" onclick="openPage('mywallet', this, '5px solid #0080ff', '#0080ff')" id="defaultOpen">�� ����</button>
<button class="wallet_tablink" onclick="openPage('mybusiness', this, '5px solid #0080ff', '#0080ff' )">�ŷ�����</button>
<button class="wallet_tablink" onclick="openPage('myreturn', this, '5px solid #0080ff', '#0080ff')">���ͷ�</button>
</div>
<div id="mywallet" class="wallet_tabcontent">
<div class="mywallet_box">
  <h1>�� ����</h1>
  <h4>���� ���� ���� �ڻ�</h4>
	  <div class="mywalletcoin btc">
	  <span style="color:#787878; ">�� �ڻ� </span><br>
	  <span style="font-size: 22px;" id="total"></span>
	  </div>
	  <div class="mywalletcoin krw">
	  <span style="color:#787878; ">KRW </span> <br>
	  <span  style="font-size: 22px;" id="krw"></span>
	  </div>
	  <div>
	    <h4>ȭ�� ����</h4>
	    <div>
	     <table class="coinWallet" id="wallet_table">
	     	<thead>
	     		<tr>
	     			<th>����</th>
	     			<th>�̸�</th>
	     			<th>������</th>
	     			<th>�ŷ� �����</th>
	     		</tr>
	     	</thead>
	     	<tbody>
	     	</tbody>
	     </table>
	    
	    </div>
</div>     
</div>
</div>

<div id="mybusiness" class="wallet_tabcontent">
<div class="mywallet_box">
   <h1>�ŷ�����</h1>
  <h4>������� �ŷ�</h4>
     <table class="coinWallet"  id="order_table">
     	<thead>
     		<tr>
     			<th>����</th>
     			<th>�ð�</th>
     			<th>����</th>
     			<th>����</th>
     			<th>�ֹ�����/ü�����</th>
     			<th>����</th>
     		</tr>
     		<tr id="order_wait">
     			<td class="coinWallet_2" colspan="6" colspan="5" style="text-align: center; font-size: 18px;">����ֹ� ������ �����ϴ�.</td>
     		</tr>
     	</thead>
     	<tbody>
     	</tbody>
     </table>

  <h4>ä��� �ŷ�</h4>
      <table class="coinWallet"  id="history_table">
      	<thead>
     		<tr>
     			<th>����</th>
     			<th>�ð�</th>
     			<th>����</th>
     			<th>����</th>
     			<th>�ŷ���</th>
     			<th>����</th>
     		</tr>
     		<tr id="history_wait">
     			<td class="coinWallet_2" colspan="6" colspan="5" style="text-align: center; font-size: 18px;">�ŷ������� �����ϴ�.</td>
     		</tr>
     	</thead>
     	<tbody>
     	</tbody>
     </table>
</div>
</div>


<div id="myreturn" class="wallet_tabcontent">
<div class="mywallet_box">
   <h1>���ͷ�</h1>
  <h4>�ڱ� �� ���� �ڻ�</h4>
  <p>KRW�� ������� ���˴ϴ�.</p>
  
  	<div class="profit waller_box1">
  		<div class="profit1">�ʱ��ڱ�</div><div class="profit2">30,000,000��</div>
  	</div>	
  	<div class="profit waller_box1">	
  		<div class="profit1">�����ڻ�</div><div class="profit2" id="tot"></div>
  	</div>	
  	<div class="profit waller_box2">	
  		<div class="profit1">������ ���ͷ�</div><div class="profit3" id="profit"></div>
  	</div>

</div>  
</div>

</section>
<jsp:include page="../footer.jsp" />

<script>
function openPage(pageName,elmnt,boder,color) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("wallet_tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("wallet_tablink");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].style.border = "";
        tablinks[i].style.color = "";
    }
    document.getElementById(pageName).style.display = "block";
    elmnt.style.borderLeft = boder;
    elmnt.style.color = color;

}
// Get the element with id="defaultOpen" and click on it
document.getElementById("defaultOpen").click();
</script>

	

</body>
</html>