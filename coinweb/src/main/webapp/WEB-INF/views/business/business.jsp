<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="coinweb.dao.*, coinweb.vo.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/coin.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<title>Coinweb - ����ȭ�� ��������</title>
<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
<script src="https://code.highcharts.com/stock/highstock.js"></script>
<script src="https://code.highcharts.com/stock/modules/drag-panes.js"></script>
<script src="https://code.highcharts.com/stock/modules/exporting.js"></script>
<script src="https://code.highcharts.com/maps/modules/map.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script>
var coin = "BTC";
var avail_won = 0;
var avail_coin = 0;
var last_price = 0;
var cancel_idx = 0;
var total_buy_price = 0;
var total_sell_price = 0;

var sid = '<c:out value="${sid}"/>';

//�ʱ� ȭ�����
$(function() {
	fSetHogaBg();
	GetChart();
	GetMyData();
	GetOrderList();
	GetHistoryList();
	$("#coinname").html(coin+'('+$('.coin_sec').text()+')');                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
	$('.coin_btn').click(function (e) {                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
		$(".coin_btn").removeClass('coin_sec');
		$(this).addClass('coin_sec');
		coin = $(this).data('coin');
		$("#coinname").html(coin+'('+$(this).text()+')');
		$('#buy_price').val("");
		$('#sell_price').val("");
		$('#buy_unit').val("");
		$('#sell_unit').val("");
		GetCoinData();
		GetHoga();
		GetChart();
		GetMyData();
		GetOrderList();
		GetHistoryList();
	});

});

//��Ʈ
function GetChart(){
$.get('proxy.do',{
		csurl:'https://api.bithumb.com/public/candlestick_trview/'+coin+'/10M',
	}, function (res) {
		//
		var data = res.data;
	    // split the data set into ohlc and volume
	
	    var price = [],
	        volume = [],
	        dataLength = data.t.length,
	        i = 0,
	        t = data.t,
	        o = data.o,
	        h = data.h,
	        l = data.l,
	        c = data.c,
	        v = data.v;
	
	    for (i; i < dataLength; i += 1) {

	    	price.push([
	        	
	            Number(t[i]), // the date
	            Number(o[i]), // open
	            Number(h[i]), // high
	            Number(l[i]), // low
	            Number(c[i]) // close
	        ]);
	
	        volume.push([
	        	Number(t[i]), // the date
	        	Number(v[i]) // the volume
	        ]);
	    }
	
	
	    // create the chart
	    Highcharts.stockChart('container', {
	      	chart: {
	            type: 'line',
	            marginRight: 60
	        },
	        rangeSelector: {
	        	buttons: [ 
							{type: 'day',count: 1,text: '1d'},
							{type: 'week',count: 1,text: '1w'},
							{type: 'all',count: 1, text: 'All'}
						],
						selected: 0,
						inputEnabled: true
	        },
	        navigator: {
	            enabled: false
	        },
	        mapNavigation: {
	            enabled: true,
	            enableButtons: false
	        },
	        plotOptions: {
				candlestick: {
					color: 'blue',
					lineColor: 'blue',
					upColor: 'red',
					upLineColor: 'red'
				}
			},
			xAxis: {
	            gridLineWidth: 1,
	        },
	        yAxis: [{
	            labels: {
	            	textAlign: 'left',
	                align: 'right',
	                x: 60,
	                y: 5,
	                format: '{value:.0f}'
	            },
	            height: '70%',
	            lineWidth: 2,
	           
	            resize: {
	                enabled: true
	            },
	            tickLength: 5,
	            tickPosition: "outside",
	            tickWidth: 1,
	            tickColor: "black",
	            showLastLabel: true,            
	        }, {
	            labels: {
	            	textAlign: 'left',
	                align: 'right',
	                x: 60,
	                y: 5,
	                format: '{value:.0f}'
	            },
	            top: '70%',
	            height: '30%',
	            offset: 0,
	            lineWidth: 2,
	            tickLength: 5,
	            tickPosition: "outside",
	            tickWidth: 1,
	            tickColor: "black"
	        }],
	
	        tooltip: {
	            split: true
	        },
	
	        series: [{
	            type: 'candlestick',
	            name: 'Price',
	            data: price
	
	        }, {
	            type: 'column',
	            name: 'Volume',
	            data: volume,
	            yAxis: 1
	
	        }]
	    });
	    Highcharts.setOptions({
	        global: {
	            useUTC: false
	        }
	    });
	});
}

function numberWithCommas(x) {
    return Math.round(x).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
function Floor(n, pos) {
	var digits = Math.pow(10, pos);
	var num = Math.floor(n * digits) / digits;
	return num.toFixed(pos);
}
/*���ι�ư*/

var now_price = 0;
 function GetCoinData(){
	$.get('https://api.bithumb.com/public/ticker/'+coin, function(data) {
		console.log(data)
		var opening_price = data['data']['opening_price'];
		var closing_price = data['data']['closing_price'];
		var bithumb_krw = parseInt(closing_price);
		var cpYesterday = closing_price - opening_price
		var percent = (cpYesterday / opening_price) * 100.0;
		now_price = data['data']['closing_price'];
		$('.max_price').html(numberWithCommas(data['data']['max_price']));
		$('.min_price').html(numberWithCommas(data['data']['min_price']));
		$('.buy_price').html(numberWithCommas(data['data']['buy_price']));
		$('.sell_price').html(numberWithCommas(data['data']['closing_price']));
		$('.volume').html(numberWithCommas(parseInt(data['data']['volume_1day']))+coin);
		$('.now_price').html(numberWithCommas(data['data']['closing_price']));
		$('.opening_price').html(numberWithCommas(opening_price));
		if(percent > 0){
			$('.percent').html('(+'+Floor(percent,2)+'%)').css("color","#43A047").css("font-size","9pt");
			$('.cpYesterday').html('+'+numberWithCommas(cpYesterday)).css("color","#43A047").css("font-size","9pt");
		}else if(percent<0){
			$('.percent').html('('+Floor(percent,2)+'%)').css("color","#E53935").css("font-size","9pt");
			$('.cpYesterday').html(numberWithCommas(cpYesterday)).css("color","#E53935").css("font-size","9pt");
		}else{
			$('.percent').html('('+Floor(percent,2)+'%)').css("font-size","9pt");
			$('.cpYesterday').html(numberWithCommas(cpYesterday)).css("color","#43A047").css("font-size","9pt");
		}
		setLastPrice();
	});
}
var asks = [];
var bids = [];

//ȣ��
function GetHoga(){
	$.get('proxy.do',{
		csurl:'https://api.bithumb.com/public/orderbook/'+coin+'_KRW',
	}, function (data) {
		asks = data['data']['asks'];
		bids = data['data']['bids'];
		for(i=0;i<10;i++){
			$('#ask_quantity'+i).html(data['data']['asks'][i]['quantity']);
			$('#ask_price'+i).html(numberWithCommas(data['data']['asks'][i]['price']));
			$('#bid_quantity'+i).html(data['data']['bids'][i]['quantity']);
			$('#bid_price'+i).html(numberWithCommas(data['data']['bids'][i]['price']));
		}
		fSetHogaBg();
		setTimeout(	"fResetHogaBg()", 10000);
	});
}
//�ŷ�����
function GetTransactions(){
	$.get('https://api.bithumb.com/public/transaction_history/'+coin, function(data) {
		for(var i=0;i<10;i++){$('#trans_price'+i).html(numberWithCommas(data['data'][i]['price']));}
		for(var i=0;i<10;i++){$('#trans_total'+i).html(data['data'][i]['units_traded']);}
	});
}

function fShowData() {
	try {
		GetCoinData();
		GetHoga();
		GetTransactions();
		GetMyData();
		GetOrderList();
		GetHistoryList();
	} catch(e){			
    } finally {
        setTimeout("fShowData()", 3000);
    }
}
function setLastPrice() {
 	if($('#buy_price').val()*1.0 <= 0) $('#buy_price').val(now_price);
 	if($('#sell_price').val()*1.0 <= 0) $('#sell_price').val(now_price);
 	fCalcData();
 }
function ask_priceSet(i){
	price = asks[i]['price'];
	$('#buy_price').val(price);
 	$('#sell_price').val(price);
 	fCalcData();
}
function bid_priceSet(i){
	price = bids[i]['price'];
	$('#buy_price').val(price);
 	$('#sell_price').val(price);
 	fCalcData();
}
function fSetHogaBg() {
	$(".asks").css("background-color", "#CFEAFF");
	$(".bids").css("background-color", "#FFE8EF");
}
function fResetHogaBg() {
	$(".asks").css("background-color", "#FFFFFF");
	$(".bids").css("background-color", "#FFFFFF");
}

function setHogaPrice(prc) {
	$('#buy_price').val(prc);
	$('#sell_price').val(prc);
	fCalcData();
}
function fCalcData() {
	// �ݾ�-���� ����ϱ�
	// �ż� ������ ���
	// 1. �ִ� ���Ű��� ���μ�
	if($('#buy_price').val() > 0) {
		var max_buy_coin = avail_won / $('#buy_price').val();
		$('#max_buy_coin').text(Math.floor(max_buy_coin * 10000)/10000);
	}
	// 2. �� �ż��ݾ� ����ϱ�
	if($('#buy_unit').val() > 0) {
		if( $('#buy_unit').val() * 1.0 > $('#max_buy_coin').text() * 1.0 ) {
			$('#buy_unit').val($('#max_buy_coin').text());
		}
		// �� �ż��ݾ� ����ϱ�
		total_buy_price = $('#buy_price').val() * $('#buy_unit').val();
	}else{
		total_buy_price = 0;
	}
	$('#total_buy_price').html(numberWithCommas(total_buy_price) + " <span>��</span>");
	$('#total_buy_coin').html(($('#buy_unit').val() * 1.0) + " <span>" + coin + "</span>");

	// �ŵ� ������ ���
	// 1. �ִ� �ŵ����� �ݾ�
	if($('#sell_price').val() > 0) {
		var max_sell_price = avail_coin * $('#sell_price').val();
		$('#max_sell_price').text(numberWithCommas(max_sell_price));
	}
	// 2. �� �ŵ��ݾ� ����ϱ�
	if($('#sell_unit').val() > 0) {
		if( avail_coin < $('#sell_unit').val() * 1.0 ) {
			$('#sell_unit').val(avail_coin);
		}
		// �� �ŵ��ݾ� ����ϱ�
		total_sell_price = $('#sell_price').val() * $('#sell_unit').val();
	}else{
		total_sell_price = 0;
	}
	$('#total_sell_price').html(numberWithCommas(total_sell_price) + " <span>��</span>");
	$('#total_sell_coin').html(($('#sell_unit').val()*1.0) + " <span>" + coin + "</span>");


}

function GetMyData(){
	if(sid!=0){
		$.ajax({
			url : '${pageContext.request.contextPath}/wallet_result.do',
			type :'GET',	
			data : 'id='+sid+'&coin='+coin,
			dataType : 'json',
			success : function(data){
					$("#avail_using_won").html(numberWithCommas(data.available-data.using)+"��");
					$("#avail_coin").html((data.coin_avail-data.coin_using).toFixed(4)+coin);
					$("#avail_won").html(numberWithCommas(data.available)+"��");
					$("#coin_tot").html((data.coin_tot).toFixed(4)+coin);
					$("#avile_using").html((data.coin_avail-data.coin_using).toFixed(4)+coin+" / "+(data.coin_using).toFixed(4)+coin);
					$("#won_tot").html(numberWithCommas(data.tot)+"��");
					avail_won = data.available-data.using;
					avail_coin = data.coin_avail-data.coin_using;
				}	
			});
	}
}		

//�ֹ�����
function GetOrderList(){
	$.ajax({
		url : '${pageContext.request.contextPath}/order_list.do',
		type :'GET',	
		data : 'id='+sid+'&coin='+coin,
		dataType : 'json',
		success : function(data){
			if(data.length != 0) $("#order_wait").hide();
			else if(data.length == 0) $("#order_wait").show();
			$('#order_table > tbody').empty();
			for(var i=0;i<data.length;i++){
				var type = data[i].type;
				if(type == 'B')	type = "<td style='color:red;'>�ż�</td>"; else type = "<td style='color:blue;'>�ŵ�</td>";
				code = "<tr>"+type+"<td>"+data[i].date+"</td><td>"+numberWithCommas(data[i].price)+"</td><td>"
					+ Floor(data[i].amount,4)+"/"+Floor(data[i].amount_c,4)+"</td><td>"+numberWithCommas(data[i].price_c)+"</td><td><a style='cursor:pointer;' data-toggle='modal' data-target='#order_cancel_Modal' data-idx="+data[i].idx+" data-type="+data[i].type+">���</a></td></tr>";
				$('#order_table > tbody:last').append(code);
			}
		}
	});
}
//�ŷ�����
function GetHistoryList(){
	$.ajax({
		url : '${pageContext.request.contextPath}/history_list.do',
		type :'GET',	
		data : 'id='+sid+'&coin='+coin,
		dataType : 'json',
		success : function(data){
			if(data.length != 0) $("#history_wait").hide();
			else if(data.length == 0) $("#history_wait").show();
			$('#history_table > tbody').empty();
			var length = 0;
			if(data.length < 5) lenght = data.length; else length = 5;
			for(var i=0;i<length;i++){
				var type = data[i].type;
				if(type == 'B')	type = "<td style='color:red;'>�ż�</td>"; else type = "<td style='color:blue;'>�ŵ�</td>";
				code = "<tr><td>"+data[i].date+"</td>"+type+"<td>"+numberWithCommas(data[i].price)+"</td><td>"
					+Floor(data[i].amount,4)+"</td><td>"+numberWithCommas(data[i].price_c)+"</td><td>�Ϸ�</td></tr>";
				$('#history_table > tbody:last').append(code);
			}
		}
	});
}

$(function(){

	// �ż�-�ŵ� �� ��ư
	$('ul.nav-tabs a').click(function (e) {
		e.preventDefault();
		$(this).tab('show');
	});

	// �ۼ�Ʈ ��ư Ŭ����
	$('.btn_buy_percent').click(function (e) {
		if($('#buy_price').val() > 0) {
			var pct_buy_coin = ((avail_won * ($(this).data('pct'))) / 100) / $('#buy_price').val();
			$('#buy_unit').val(Floor(pct_buy_coin,4));
			fCalcData();
		}
	});
	$('.btn_sell_percent').click(function (e) {
		if(avail_coin > 0) {
			var pct_sell_coin = (avail_coin * $(this).data('pct') / 100);
			$('#sell_unit').val(Floor(pct_sell_coin,4));
			fCalcData();
		}
	});
	
	// �����ϱ�
	$('#btn_buy').click(function () {
		if(total_buy_price > 0 && avail_won>=total_buy_price) {
			$('#modal_buy_price').text(numberWithCommas(total_buy_price));
			$('#order_buy_Modal').modal('show');
		}
	});
	
	$('#btn_order_buy').click(function() {
			$('#order_buy_Modal').modal('hide');
			
			var buy_price = $('#buy_price').val();
			var buy_unit = $('#buy_unit').val();
			$.ajax({
				url : '${pageContext.request.contextPath}/order.do',
				type : 'GET',
				data : 'id='+sid+'&coin='+coin+'&price='+buy_price+'&amount='+buy_unit+'&type=B',
				dataType: 'json',
				success:function(data){
					if(data.length != 0){
						GetMyData();
						GetOrderList();
						GetHistoryList();
						$('#buy_unit').val(0);
						fCalcData();
					}
				}
			});
	});

	// �Ǹ��ϱ�
	$('#btn_sell').click(function (e) {
		if($('#sell_unit').val() * 1.0 > 0 && avail_coin >= $('#sell_unit').val() * 1.0 ) {
			$('#modal_sell_unit').text($('#sell_unit').val());
			$('#order_sell_Modal').modal('show');
		}
	});
	$('#btn_order_sell').click(function() {
		$('#order_sell_Modal').modal('hide');
			$.ajax({
				type:"GET",
				url:"${pageContext.request.contextPath}/order.do",
				data:"id="+sid+"&coin="+coin+"&price="+$('#sell_price').val()+"&amount="+$('#sell_unit').val()+"&type=S",
				dataType: 'json',
				success:function(data){
					if(data.length != 0){
						GetOrderList();
						GetHistoryList();
						GetMyData();
						$('#sell_unit').val(0);
						fCalcData();
					}
				}
			});
	});
	
	// �ֹ� ��� ���̾�α� �㶧 �� ����
	$('#order_cancel_Modal').on('show.bs.modal', function (event){
		cancel_idx = $(event.relatedTarget).data('idx');
		type = $(event.relatedTarget).data('type');
	});

	$('#btn_order_cancel').click(function() {
		$('#order_cancel_Modal').modal('hide');
		$.ajax({
			type:'POST',
			url:'${pageContext.request.contextPath}/order_cancel.do',
			data:'id='+sid+'&coin='+coin+'&idx='+cancel_idx+'&type='+type,
			success:function(data){
					GetOrderList();
					GetHistoryList();
					GetMyData();
			},
			error:function(e){
				// alert(e.responseText);
			}
		});
	});
});
</script>
</head>
<body class="business" onload="fShowData()">

	<jsp:include page="../header.jsp" />
<div class="business_tab">
  <button class="business_tablinks coin_btn coin_sec" data-coin="BTC"><img src="images/btc.png">��Ʈ����</button>
  <button class="business_tablinks coin_btn" data-coin="BCH"><img src="images/bch.png">��Ʈ���� ĳ��</button>
  <button class="business_tablinks coin_btn" data-coin="ETH"><img src="images/eth.png">�̴�����</button>
  <button class="business_tablinks coin_btn" data-coin="ETC"><img src="images/etc.png">�̴� Ŭ����</button>
  <button class="business_tablinks coin_btn " data-coin="XRP"><img src="images/ripple.png">����</button>
  <button class="business_tablinks coin_btn" data-coin="LTC"><img src="images/litecoin.png">����Ʈ����</button>
  <button class="business_tablinks coin_btn" data-coin="QTUM"><img src="images/qtum.png">����</button>
</div>
 
<!-- ��Ʈ���� -->
<div id="business_BTC" class="business_tabcontent">

	<!-- ��Ʈ���� ��� -->
	<section id="trade_section_1">	
	 	<div class="business_cash_header">
	 		<h4 id=coinname></h4>
	 		<table class="business_table1">
	 			<tr class="td">
	 				<td>���� ���簡 / 24�ð� �� ���</td>
	 				<td>�ְ�</td>
	 				<td>������</td>
	 				<td>�ŵ�ȣ��</td>
	 				<td>�ż�ȣ��</td>
	 				<td>�ŷ���</td>
	 			</tr>
	 			<tr>
	 				<td>
	 					<span class=now_price></span>
	 					<span class=cpYesterday></span>
	 					<span class=percent></span>
	 				</td>
	 				<td class=max_price></td>
	 				<td class=min_price></td>
	 				<td class=sell_price></td>
	 				<td class=buy_price></td>
	 				<td class=volume></td>
	 			</tr>
	 		</table>
	 		</div>
	</section> 		
	 		
	 		<!-- ��Ʈ �׷��� -->
	<section id="trade_section_2">
	 			<div class="business_cash_section">
	 				<!-- �׷��� & �ŵ� �ż� -->
	 				<div class="coin_graph">
	 					<!-- �׷��� -->
	 					<div id="container" style="height: 350px; min-width: 310px"></div>
	 				
		 				<!-- �ż� �ŵ� -->
		 				<div class="tab_wrapper" >
                            <div class="tab_box col-md-12">
                                <ul class="nav nav-tabs nav-justified">
                                  <li id="first-tab" class="sell_tab active col-xs-6"><a href="#first">�ż�</a></li>
                                  <li id="second-tab" class="buy_tab col-xs-6"><a href="#second">�ŵ�</a></li>
                                </ul>
                            </div>
                            <div class="tab-content">
                                <div class="col-xs-12 tab-pane fade active in" id="first" aria-labelledby="first-tab" style="padding:0px;">
                                    <form class="sell_tab_form" action="index.html" method="post">
                                        <div class="total_cash">
                                            <p class="total_cahs_title">��밡��</p>
                                            <p class="total_cahs_price" id="avail_using_won" onChange="fCalcData()">0��</p>
                                        </div>
                                        <div class="form-group form_sell_price">
                                            <label class="col-sm-2 col-xs-10 control-label sell_price_label">�ֹ�����</label>
                                            <div class="col-sm-7 col-xs-10">
                                                <input type="number" class="form-control order_price" id="buy_price" value="0" onkeyup="fCalcData()" onblur="fCalcData()" onChange="fCalcData()">
                                            </div>
                                            <div class="col-sm-3 col-xs-12 sell_price_text">
                                                <p>�ִ� ���� ���� ���� <span id="max_buy_coin">0.0000</span></p>
                                            </div>
                                        </div>
                                        <div class="form-group form_sell_amount">
                                            <label for="sell_input1" class="col-sm-2 col-xs-12 control-label sell_amount_label">�ֹ�����</label>
                                            <div class="col-sm-7 col-xs-12">
                                                <input type="text" class="form-control order_amount" id="buy_unit" placeholder="�ż�����" onkeyup="fCalcData()" onblur="fCalcData()">
                                            </div>
                                            <div class="col-sm-3 col-xs-12 amount_btns">
                                                <button class="btn btn-xs btn-default btn_buy_percent" data-pct="30" type="button">
                                                    30%
                                                </button>
                                                <button class="btn btn-xs btn-default btn_buy_percent" data-pct="50" type="button">
                                                    50%
                                                </button>
                                                <button class="btn btn-xs btn-default max_btn btn_buy_percent" data-pct="100" type="button">
                                                    �ִ�
                                                </button>
                                                <!-- <input class="btn btn-default" type="button" value="�ִ�"> -->
                                            </div>
                                        </div>
                                        <div class="order_cash">
                                            <p class="order_cahs_title">�ż��ݾ�</p>
                                            <p class="order_cahs_price" id="total_buy_price">0 <span>��</span></p>
                                        </div>
                                        <div class="order_total_amount">
                                            <p class="order_total_amount_title">�� �ż���</p>
                                            <p class="order_total_amount_price" id="total_buy_coin">0 <span>BTC</span></p>
                                        </div>
                                        <div class="order_sell_btn_box">
                                            <button type="button" class="btn btn-lg btn-danger" id="btn_buy">�ż��ϱ�</button>
                                        </div>
                                    </form>
                                </div>

                                <div class="col-xs-12 tab-pane fade" id="second" aria-labelledby="second-tab" style="padding:0px;">
                                    <form class="buy_tab_form" action="index.html" method="post">
                                        <div class="total_cash">
                                            <p class="total_cahs_title">��밡��</p>
                                            <p class="total_cahs_price" id="avail_coin">0.0000</p>
                                        </div>
                                        <div class="form-group form_sell_price">
                                            <label id="sell_balance" class="col-sm-2 control-label sell_price_label">�ֹ�����</label>
                                            <div class="col-sm-7">
												<input type="number" class="form-control order_price" id="sell_price" value="0" onkeyup="fCalcData()">
                                            </div>
                                            <div class="col-sm-3 buy_price_text">
                                                <p>�ִ� �Ǹ� ���� �ݾ� <span id="max_sell_price">0</span>��</p>
                                            </div>
                                        </div>
                                        <div class="form-group form_sell_amount">
                                            <label for="sell_input1" class="col-sm-2 control-label sell_amount_label">�ֹ�����</label>
                                            <div class="col-sm-7">
                                                <input type="text" class="form-control order_amount" id="sell_unit" placeholder="�ŵ�����" onkeyup="fCalcData()">
                                            </div>
                                            <div class="col-sm-3 amount_btns">
                                                <button class="btn btn-xs btn-default btn_sell_percent" data-pct="30" type="button">
                                                    30%
                                                </button>
                                                <button class="btn btn-xs btn-default btn_sell_percent" data-pct="50" type="button">
                                                    50%
                                                </button>
                                                <button class="btn btn-xs btn-default max_btn btn_sell_percent" data-pct="100" type="button">
                                                    �ִ�
                                                </button>
                                            </div>
                                        </div>
                                        <div class="order_cash">
                                            <p class="order_cahs_title">�ŵ��ݾ�</p>
                                            <p class="buy_cahs_price" id="total_sell_price">0 <span>��</span></p>
                                        </div>
                                        <div class="order_total_amount">
                                            <p class="order_total_amount_title">�� �ŵ���</p>
                                            <p class="buy_total_amount_price" id="total_sell_coin">0 <span>BTC</span></p>
                                        </div>
                                        <div class="order_buy_btn_box">
                                            <button type="button" class="btn btn-lg btn-primary" id="btn_sell">�ŵ��ϱ�</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
	 				</div>
	 				<!-- ��Ʈ (�ŵ�,�ż� ����)-->
	 				<div class="chart_table">
	 					
	 					<table class="table1" border="1" style="border-color: #fe3e3e3;">
	 						
	 						<tr>
	 							<td style="color: blue;">�ŵ��ֹ�</td>
	 							<td style="color: blue;">�ŵ��ܷ�</td>
	 							<td>����</td>
	 							<td style="color: red;">�ż��ܷ�</td>
	 							<td style="color: red;">�ż��ֹ�</td>
	 						</tr>
	 						<tr class="asks">
	 							<td></td>
	 							<td id="ask_quantity9"></td>
	 							<td style="font-weight:700; cursor:pointer;" class="ask_price" id="ask_price9" onclick="ask_priceSet(9)"></td>
	 							<td style="background-color: #FFFFFF" colspan="2" rowspan="10">
	 								<table class="sub table2">
	 									<tr> 
	 										<td>���簡</td>
	 										<td class=now_price></td>
	 									</tr>
	 									<tr> 
	 										<td>���ϰ�</td>
	 										<td class=opening_price></td>
	 									</tr>
	 									<tr> 
	 										<td>���ϴ��</td>
	 										<td>
	 										<span class=cpYesterday></span>
	 										<span class=percent></span>
	 										</td>
	 									</tr>
	 									<tr> 
	 										<td>��</td>
	 										<td class=max_price></td>
	 									</tr>
	 									<tr> 
	 										<td>����</td>
	 										<td class=min_price></td>
	 									</tr>
	 									<tr> 
	 										<td>�ŷ���</td>
	 										<td class=volume></td>
	 									</tr>
	 								</table>
	 							</td>
	 			
	 						</tr>
	 						<tr class="asks">
	 							<td></td>
	 							<td id="ask_quantity8"></td>
	 							<td style="font-weight:700; cursor:pointer;" class="ask_price" id="ask_price8" onclick="ask_priceSet(8)"></td>
	 							
	 							
	 						</tr>
	 						<tr class="asks">
	 							<td></td>
	 							<td id="ask_quantity7"></td>
	 							<td style="font-weight:700; cursor:pointer;" class="ask_price"  id="ask_price7"  onclick="ask_priceSet(7)"></td>
	 							
	 							
	 						</tr>
	 						<tr class="asks">
	 							<td></td>
	 							<td id="ask_quantity6"></td>
	 							<td style="font-weight:700; cursor:pointer;" class="ask_price"  id="ask_price6" onclick="ask_priceSet(6)"></td>
	 							
	 						</tr>
	 						<tr class="asks">
	 							<td></td>
	 							<td id="ask_quantity5"></td>
	 							<td style="font-weight:700; cursor:pointer;" class="ask_price"  id="ask_price5"  onclick="ask_priceSet(5)"></td>
	 						
	 						</tr>
	 						<tr class="asks">
	 							<td></td>
	 							<td id="ask_quantity4"></td>
	 							<td style="font-weight:700; cursor:pointer;" class="ask_price"  id="ask_price4"  onclick="ask_priceSet(4)"></td>
	 						
	 						</tr>
	 						<tr class="asks">
	 							<td></td>
	 							<td id="ask_quantity3"></td>
	 							<td style="font-weight:700; cursor:pointer;" class="ask_price"  id="ask_price3"  onclick="ask_priceSet(3)"></td>
	 						
	 						</tr>
	 						<tr class="asks">
	 							<td></td>
	 							<td id="ask_quantity2"></td>
	 							<td style="font-weight:700; cursor:pointer;" class="ask_price"  id="ask_price2" onclick="ask_priceSet(2)"></td>
	 							
	 						</tr>
	 						<tr class="asks">
	 							<td></td>
	 							<td id="ask_quantity1"></td>
	 							<td style="font-weight:700; cursor:pointer;" class="ask_price"  id="ask_price1"  onclick="ask_priceSet(1)"></td>
	 							
	 						</tr>
	 						<tr class="asks">
	 							<td></td>
	 							<td id="ask_quantity0"></td>
	 							<td style="font-weight:700; cursor:pointer;" class="ask_price" id="ask_price0" onclick="ask_priceSet(0)"></td>
	 						</tr>
	 					
	 						<tr class="bids">
	 							<td  style="background-color: #FFFFFF" colspan="2" rowspan="10">
	 								<table class="sub2 table2">
	 									<tr> 
	 										<td>ü�ᰡ</td>
	 										<td>�ŷ���</td>
	 									</tr>
	 									<tr> 
	 										<td id="trans_price0"></td>
	 										<td id="trans_total0"></td>
	 									</tr>
	 									<tr> 
	 										<td id="trans_price1"></td>
	 										<td id="trans_total1"></td>
	 									</tr>
	 									<tr> 
	 										<td id="trans_price2"></td>
	 										<td id="trans_total2"></td>
	 									</tr>
	 									<tr> 
	 										<td id="trans_price3"></td>
	 										<td id="trans_total3"></td>
	 									</tr>
	 									<tr> 
	 										<td id="trans_price4"></td>
	 										<td id="trans_total4"></td>
	 									</tr>
	 									<tr> 
	 										<td id="trans_price5"></td>
	 										<td id="trans_total5"></td>
	 									</tr>
	 									<tr> 
	 										<td id="trans_price6"></td>
	 										<td id="trans_total6"></td>
	 									</tr>
	 									<tr> 
	 										<td id="trans_price7"></td>
	 										<td id="trans_total7"></td>
	 									</tr>
	 									<tr> 
	 										<td id="trans_price8"></td>
	 										<td id="trans_total8"></td>
	 									</tr>
	 									<tr> 
	 										<td id="trans_price9"></td>
	 										<td id="trans_total9"></td>
	 									</tr>
	 								</table>
	 							</td>
	 							<td style="font-weight:700; cursor:pointer;" class="bid_price" id="bid_price0"  onclick="bid_priceSet(0)"></td>
	 							<td id="bid_quantity0"></td>
	 							<td></td>
	 						</tr>
	 						<tr class="bids">
	 							<td style="font-weight:700; cursor:pointer;" class="bid_price" id="bid_price1"  onclick="bid_priceSet(1)"></td>
	 							<td id="bid_quantity1"></td>
	 							<td></td>
	 						</tr>
	 						<tr class="bids">
	 							
	 							<td style="font-weight:700; cursor:pointer;" class="bid_price" id="bid_price2"  onclick="bid_priceSet(2)"></td>
	 							<td id="bid_quantity2"></td>
	 							<td></td>
	 						</tr>
	 						<tr class="bids">
	 							
	 							<td style="font-weight:700; cursor:pointer;" class="bid_price" id="bid_price3"  onclick="bid_priceSet(3)"></td>
	 							<td id="bid_quantity3"></td>
	 							<td></td>
	 						</tr>
	 						<tr class="bids">
	 							
	 							<td style="font-weight:700; cursor:pointer;" class="bid_price" id="bid_price4"  onclick="bid_priceSet(4)"></td>
	 							<td id="bid_quantity4"></td>
	 							<td></td>
	 						</tr>
	 						<tr class="bids">
	 							
	 							<td style="font-weight:700; cursor:pointer;" class="bid_price" id="bid_price5"  onclick="bid_priceSet(5)"></td>
	 							<td id="bid_quantity5"></td>
	 							<td></td>
	 						</tr>
	 						<tr class="bids">
	 							
	 							<td style="font-weight:700; cursor:pointer;" class="bid_price" id="bid_price6"  onclick="bid_priceSet(6)"></td>
	 							<td id="bid_quantity6"></td>
	 							<td></td>
	 						</tr>
	 						<tr class="bids">
	 							
	 							<td style="font-weight:700; cursor:pointer;" class="bid_price" id="bid_price7"  onclick="bid_priceSet(7)"></td>
	 							<td id="bid_quantity7"></td>
	 							<td></td>
	 						</tr>
	 						<tr class="bids">
	 							
	 							<td style="font-weight:700; cursor:pointer;" class="bid_price" id="bid_price8"  onclick="bid_priceSet(8)"></td>
	 							<td id="bid_quantity8"></td>
	 							<td></td>
	 						</tr>
	 						<tr class="bids">
	 							
	 							<td style="font-weight:700; cursor:pointer;" class="bid_price" id="bid_price9"  onclick="bid_priceSet(9)"></td>
	 							<td id="bid_quantity9"></td>
	 							<td></td>
						</table>
	 				</div>	
	 			</div>
	 				<!-- �ŵ��ż��ϱ� -->
	 		
							
		 					

	 			
	</section>
	
	 		
	 		
	 		
	 		
	<section id="trade_section_3">			
	 		<!-- ����ֹ� ���� -->
	 		<div class="container">
	 			<!-- ����ֹ����� -->
	 			<div class="standby_order_box">
		 			<div class="standby_order_title">����ֹ�����</div>
			 			<table class="standby_order_table" id="order_table">
			 			<thead>
				 			<tr class="td" style="border-bottom: 2px solid #e3e3e3; color:#919191; ">
				 				<td>�з�</td>
				 				<td>�ð�</td>
				 				<td>��������</td>
				 				<td>�ֹ�����/ü�����</td>
				 				<td>ü��ݾ�</td>
				 				<td>���</td>
				 			</tr>
				 			<tr id="order_wait">
				 				<td colspan="6" rowspan="1" style="text-align: center;">����ֹ� ������ �����ϴ�.</td>
				 			</tr>
			 			</thead>
			 		<!-- <tr  style="border-bottom: 1px solid #e3e3e3;">
			 				<td>�з�</td>
			 				<td>�ð�</td>
			 				<td>��������</td>
			 				<td>�ֹ�����/ü�����</td>
			 				<td>ü��ݾ�</td>
			 				<td>���</td>
			 			</tr> -->
			 			<tbody>
			 			</tbody>
			 			</table>
	 			</div>
	 			
	 			<!-- ���� �ڻ���Ȳ -->
	 			<div class="my_account_box">
		 			<div class="my_account_title">${name}���� �ڻ���Ȳ</div>
			 			<table class="my_account_table" style="text-align:right;">
			 			<tr class="td" style="color:#919191;">
			 				<td>��ȭ</td>
			 				<td>����</td>
			 				<td>�ŷ����� / �ŷ���</td>
			 				<td>�ڻ�(��ȭ)</td>
			 			</tr>
			 			<tr>
			 				<td id="avail_won">0 ��</td>
			 				<td id="coin_tot">0.0000</td>
			 				<td id="avile_using">0.0000 / 0.0000 </td>
			 				<td id="won_tot">0 ��</td>
			 			</tr>
			 			</table>
			 			
	 			</div>
	 		</div>
	 		<c:if test="${empty sid}">
	 		<div style="width: 100%; height:122px; margin-top:-122px; margin-bottom:30px; position: relative; text-align: center;  
	 			background-color: rgba(77, 77, 77, 0.8); color: white; padding-top: 40px;"> 
	 			<span style=" padding: 20px; position: relative; margin-top:150px; font-size: 30px;" >�α����� �ʿ��մϴ�.</span></div>
	 		</c:if>
	</section> 			
	
	<section id="trade_section_4">
	 		<!-- �ŷ�����  -->	
	 		<div class="container">
	 			<div class="order_history_title">�ŷ�����<span>(�ֱ� 5�Ǹ� �������ϴ�.)</span></div>
	 				<table class="order_history_table"  id="history_table">
	 					<thead>
				 			<tr class="td" style="border-bottom: 2px solid #e3e3e3; color:#919191; ">
				 				<td>�ŷ�����</td>
				 				<td>����</td>
				 				<td>ü�ᰡ�� KRW</td>
				 				<td>ü�����</td>
				 				<td>ü��ݾ� KRW</td>
				 				<td>����</td>
				 			</tr>
				 			<tr id="history_wait">
			 					<td colspan="6" rowspan="1" style="text-align: center;">�ŷ������� �����ϴ�.</td>
			 				</tr>
			 			</thead>
			 		<!-- <tr style="border-bottom: 1px solid #e3e3e3;">
			 				<td>�ŷ�����</td>
			 				<td>����</td>
			 				<td>ü�ᰡ�� KRW</td>
			 				<td>ü�����</td>
			 				<td>ü��ݾ� KRW</td>
			 				<td>����</td>
			 			</tr> -->
			 			<tbody>
			 			
			 			</tbody>
			 		</table>
	 		</div>
	 		<c:if test="${empty sid}">
	 		<div style="width: 100%; height:122px; margin-top:-142px; margin-bottom:30px; position: relative; text-align: center;  
	 			background-color: rgba(77, 77, 77, 0.8); color: white; padding-top: 40px;"> 
	 			<span style=" padding: 20px; position: relative; margin-top:150px; font-size: 30px;" >�α����� �ʿ��մϴ�.</span></div>
	 		</c:if>
	</section> 	 			
  <div class="business_chsh_section">
  </div>
</div>

<!-- ��� �ż� -->
	<div id="order_buy_Modal" class="modal fade cointap_modal">
	      <div class="modal-dialog">
	        <!-- Modal content-->
	        <div class="modal-content">
	          <div class="modal-header">
	            <button type="button" class="close" data-dismiss="modal">��</button>
	            <h4 class="modal-title">�ż� �ֹ�</h4>
	          </div>
	          <div class="modal-body">
	            <p><span id="modal_buy_price">0</span> ���� �ż� �Ͻðڽ��ϱ�?</p>
	          </div>
	          <div class="modal-footer">
	            <button type="button" class="btn-sm btn-primary1" id="btn_order_buy">Ȯ��</button>
	            <button type="button" class="btn-sm btn-danger1" data-dismiss="modal">�ݱ�</button>
	          </div>
	        </div>
	      </div>
	    </div>
<!-- ��� �ŵ� -->	    
	    <div id="order_sell_Modal" class="modal fade cointap_modal">
	      <div class="modal-dialog">
	        <!-- Modal content-->
	        <div class="modal-content">
	          <div class="modal-header">
	            <button type="button" class="close" data-dismiss="modal">��</button>
	            <h4 class="modal-title">�ŵ� �ֹ�</h4>
	          </div>
	          <div class="modal-body">
	            <p><span id="modal_sell_unit">0</span> ������ �ŵ� �Ͻðڽ��ϱ�?</p>
	          </div>
	          <div class="modal-footer">
	            <button type="button" class="btn-sm btn-primary1" id="btn_order_sell">Ȯ��</button>
	            <button type="button" class="btn-sm btn-danger1" data-dismiss="modal">�ݱ�</button>
	          </div>
	        </div>
	      </div>
	    </div>

<!-- ��� ��� -->
		<div id="order_cancel_Modal" class="modal fade cointap_modal" aria-hidden="true" style="display: none;">
	      <div class="modal-dialog">
	        <!-- Modal content-->
	        <div class="modal-content">
	          <div class="modal-header">
	            <button type="button" class="close" data-dismiss="modal">��</button>
	            <h4 class="modal-title">����ֹ� ���</h4>
	          </div>
	          <div class="modal-body">
	            <p>�ش� �ֹ��� ��� �Ͻðڽ��ϱ�?</p>
	          </div>
	          <div class="modal-footer">
	            <button type="button" class="btn-sm btn-primary1" id="btn_order_cancel">Ȯ��</button>
	            <button type="button" class="btn-sm btn-danger1" data-dismiss="modal">�ݱ�</button>
	          </div>
	        </div>
	      </div>
	    </div>


	
<!-- ��Ʈ����  ��-->


  	<jsp:include page="../footer.jsp" />


</body>
</html>