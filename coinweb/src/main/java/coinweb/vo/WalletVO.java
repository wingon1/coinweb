package coinweb.vo;

public class WalletVO {
	int id; 
	float using_balance, tot_balance, available_balance, coin_avail, coin_using, coin_tot;
	String coin, coin_name, state;
	
	public float getAvailable_balance() {
		return available_balance;
	}
	public void setAvailable_balance(float available_balance) {
		this.available_balance = available_balance;
	}
	public float getCoin_avail() {
		return coin_avail;
	}
	public void setCoin_avail(float coin_avail) {
		this.coin_avail = coin_avail;
	}
	public float getCoin_using() {
		return coin_using;
	}
	public void setCoin_using(float coin_using) {
		this.coin_using = coin_using;
	}
	public float getCoin_tot() {
		return coin_tot;
	}
	public void setCoin_tot(float coin_tot) {
		this.coin_tot = coin_tot;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public float getTot_balance() {
		return tot_balance;
	}
	public void setTot_balance(float tot_balnace) {
		this.tot_balance = tot_balnace;
	}
	public float getUsing_balance() {
		return using_balance;
	}
	public void setUsing_balance(float using_balance) {
		this.using_balance = using_balance;
	}
	public String getCoin() {
		return coin;
	}
	public void setCoin(String coin) {
		this.coin = coin;
	}
	public String getCoin_name() {
		return coin_name;
	}
	public void setCoin_name(String coin_name) {
		this.coin_name = coin_name;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
	
}
