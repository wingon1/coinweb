package com.ezen.controller;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import java.math.*;
import java.nio.charset.StandardCharsets;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.mybatis.spring.SqlSessionTemplate;

import coinweb.dao.OrderDAO;
import coinweb.dao.WalletDAO;

import static org.json.simple.JSONValue.parse;


public class Ordering extends Thread {

	@Resource
	SqlSessionTemplate sqlSession;

	public Ordering(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	public void run(HttpServletRequest request) {
		OrderDAO dao = sqlSession.getMapper(OrderDAO.class);
		WalletDAO w_dao = sqlSession.getMapper(WalletDAO.class);

		URL url;
		InputStreamReader isr = null;

		try {
			url = new URL("https://api.bithumb.com/public/orderbook/ALL");
			isr = new InputStreamReader(url.openConnection().getInputStream(), StandardCharsets.UTF_8);
		} catch (IOException e) {
			e.printStackTrace();
		}

		JSONObject object = (JSONObject) parse(isr);
		if(object != null){
			JSONObject data = (JSONObject) object.get("data");
	
			String[] list = { "KRW","BTC","BCH","ETC","ETH","XRP","EOS","LTC" };
			for (String coin : list) {
				URL url2 = null;
				try {
					url2 = new URL(request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/order_all_list.do?coin=" + coin);
				} catch (MalformedURLException e) {
					e.printStackTrace();
				}
				InputStreamReader isr2 = null;
				try {
					isr2 = new InputStreamReader(url2.openConnection().getInputStream(), "UTF-8");
					//System.out.println(isr2);
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
	
				JSONArray orders = (JSONArray) parse(isr2);
	
				JSONObject COIN = (JSONObject) data.get(coin);
	
				if(COIN != null)
				{
					JSONArray bids = (JSONArray) COIN.get("bids");
					JSONArray asks = (JSONArray) COIN.get("asks");	
				
				
				
					BigDecimal price = new BigDecimal("0");
					for (int j = 0; j < orders.size(); j++) {
						JSONObject obj = (JSONObject) orders.get(j);
						BigDecimal dif_amount;
						BigDecimal dif_price = BigDecimal(axp(obj.get("price"),obj.get("amount"))).subtract(BigDecimal(obj.get("price_c")));
						if (obj.get("type").equals("S")) {
							dif_amount = BigFloat(BigFloat(obj.get("amount")).subtract(BigFloat(obj.get("amount_c"))));
							for (int i = 0; i < bids.size(); i++) {
								JSONObject bid = (JSONObject) bids.get(i);
								obj = (JSONObject) orders.get(j);
								if(parseFloat(bid.get("price")) >= parseFloat(obj.get("price")) && dif_amount.floatValue()<BigFloat(bid.get("quantity")).floatValue() && dif_amount.floatValue()>0){
									System.out.println(dif_amount+", "+BigFloat(bid.get("quantity")));
									String axp = axp(bid.get("price"),dif_amount).toString();
									dao.getOrdering(obj.get("idx").toString(), axp,dif_amount.toString());
									w_dao.getOrderingUpdate(obj.get("id").toString(), obj.get("coin").toString(), axp, dif_amount.toString(), obj.get("type").toString());
									w_dao.getOrderingUpdate2(obj.get("id").toString(), obj.get("coin").toString(), axp, dif_amount.toString(), obj.get("type").toString());
									dao.getOrderCancel(obj.get("idx").toString());
									dao.getHistoryInsert(obj.get("id").toString(), obj.get("coin").toString(), "S", bid.get("price").toString(), dif_amount.toString());
									System.out.println("bid_end "+bid.get("price")+", "+axp+", "+bid.get("quantity"));
									break;
								}else if (parseFloat(bid.get("price")) >= parseFloat(obj.get("price")) && dif_amount.floatValue()>0) {
									System.out.println(dif_amount+", "+BigFloat(bid.get("quantity")));
									String axp = axp(bid.get("price"),bid.get("quantity")).toString();
									dao.getOrdering(obj.get("idx").toString(), axp, BigFloat(bid.get("quantity")).toString());
									w_dao.getOrderingUpdate(obj.get("id").toString(), obj.get("coin").toString(), axp, BigFloat(bid.get("quantity")).toString(), obj.get("type").toString());
									w_dao.getOrderingUpdate2(obj.get("id").toString(), obj.get("coin").toString(), axp, BigFloat(bid.get("quantity")).toString(), obj.get("type").toString());
									dao.getHistoryInsert(obj.get("id").toString(), obj.get("coin").toString(), "S", bid.get("price").toString(), BigFloat(bid.get("quantity")).toString());
									dif_amount = dif_amount.subtract(BigFloat(bid.get("quantity")));
									if(BigFloat(dif_amount) == BigFloat(bid.get("quantity"))) dao.getOrderCancel(obj.get("idx").toString());
									System.out.println("bid_ing "+bid.get("price")+", "+axp+", "+bid.get("quantity"));
								}
							}
						} else if (obj.get("type").equals("B")) {
							dif_amount = BigFloat(BigFloat(obj.get("amount")).subtract(BigFloat(obj.get("amount_c"))));
							for (int i = 0; i < asks.size(); i++) {
								JSONObject ask = (JSONObject) asks.get(i);
								obj = (JSONObject) orders.get(j);
								if(parseFloat(ask.get("price")) <= parseFloat(obj.get("price")) && dif_amount.floatValue()<BigFloat(ask.get("quantity")).floatValue() && dif_amount.floatValue()>0){
									System.out.println(dif_amount+", "+BigFloat(ask.get("quantity")));
									String axp = axp(ask.get("price"),dif_amount).toString();
									dao.getOrdering(obj.get("idx").toString(), axp,dif_amount.toString());
									w_dao.getOrderingUpdate(obj.get("id").toString(), obj.get("coin").toString(), axp, dif_amount.toString(), obj.get("type").toString());
									w_dao.getOrderingUpdate2(obj.get("id").toString(), obj.get("coin").toString(), axp, dif_amount.toString(), obj.get("type").toString());
									dao.getOrderCancel(obj.get("idx").toString());
									dao.getHistoryInsert(obj.get("id").toString(), obj.get("coin").toString(), "B", ask.get("price").toString(), dif_amount.toString());
									System.out.println("ask_end");
									price = price.add(BigDecimal(axp));
									System.out.println(dif_price+", "+price);
									dif_price = dif_price.subtract(price);
									System.out.println(dif_price);
									if(dif_price.floatValue()>0) {
										w_dao.getOrderingUpdate(obj.get("id").toString(), obj.get("coin").toString(), dif_price.toString(), (BigFloat(dif_price).divide(BigFloat(ask.get("price")),4,BigDecimal.ROUND_FLOOR)).toString(), obj.get("type").toString());
										w_dao.getOrderingUpdate2(obj.get("id").toString(), obj.get("coin").toString(), dif_price.toString(), (BigFloat(dif_price).divide(BigFloat(ask.get("price")),4,BigDecimal.ROUND_FLOOR)).toString(), obj.get("type").toString());
										dao.getHistoryInsert(obj.get("id").toString(), obj.get("coin").toString(), "B", ask.get("price").toString(), (BigFloat(dif_price).divide(BigFloat(ask.get("price")),4,BigDecimal.ROUND_FLOOR)).toString());
									}
									break;
								}else if (parseFloat(ask.get("price")) <= parseFloat(obj.get("price")) && dif_amount.floatValue()>0) {
									System.out.println(dif_amount+", "+BigFloat(ask.get("quantity")).toString());
									String axp = axp(ask.get("price"),ask.get("quantity")).toString();
									dao.getOrdering(obj.get("idx").toString(), axp, BigFloat(ask.get("quantity")).toString());
									w_dao.getOrderingUpdate(obj.get("id").toString(), obj.get("coin").toString(), axp, BigFloat(ask.get("quantity")).toString(), obj.get("type").toString());
									w_dao.getOrderingUpdate2(obj.get("id").toString(), obj.get("coin").toString(), axp, BigFloat(ask.get("quantity")).toString(), obj.get("type").toString());
									dao.getHistoryInsert(obj.get("id").toString(), obj.get("coin").toString(), "B", ask.get("price").toString(), BigFloat(ask.get("quantity")).toString());
									dif_amount = dif_amount.subtract(BigFloat(ask.get("quantity")));
									price = price.add(BigDecimal(axp));
									if(BigFloat(dif_amount) == BigFloat(ask.get("quantity"))) dao.getOrderCancel(obj.get("idx").toString());
									System.out.println("ask_ing "+ask.get("price")+", "+axp+", "+ask.get("quantity"));
								}
							}
						}
					}
				}
			}
		}
	}

	public static float parseFloat(Object obj) {
		float result = 0;
		BigDecimal value = new BigDecimal(obj.toString());;
		result = value.floatValue();

		return result;
	}
	
	public static BigDecimal BigDecimal(Object obj) {
		BigDecimal result = new BigDecimal(obj.toString());
		
		return result;
	}
	
	public static BigDecimal axp(Object price, Object amount){
		BigDecimal result = BigDecimal(price).multiply(BigFloat(amount));
		
		return result;
	}
	
	public static BigDecimal BigFloat(Object obj) {
		BigDecimal result = BigDecimal(obj.toString()).setScale(4, BigDecimal.ROUND_FLOOR);
		
		return result;
	}
}
