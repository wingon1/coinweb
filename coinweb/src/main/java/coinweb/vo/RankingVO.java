package coinweb.vo;

public class RankingVO {
	int  id, rno;
	String name,money;
	float rankProfit;
	long profit;



	public long getProfit() {
		return profit;
	}
	public void setProfit(long profit) {
		float setProfit = 0;
		if(profit != 30000000) setProfit = (float) ((profit/30000000.0)*100-100);
		this.rankProfit = setProfit;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getMoney() {
		return money;
	}
	public void setMoney(String money) {
		this.money = money;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public float getRankProfit() {
		return rankProfit;
	}
	public void setRankProfit(float rankProfit) {
		this.rankProfit = rankProfit;
	}

}
