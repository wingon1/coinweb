package coinweb.vo;

public class BoardReplySubVO {
	int rid;  
	int rrid;
	int likeit,dislikeit;
	String content,rdate;
	
	
	public int getLikeit() {
		return likeit;
	}
	public void setLikeit(int likeit) {
		this.likeit = likeit;
	}
	public int getDislikeit() {
		return dislikeit;
	}
	public void setDislikeit(int dislikeit) {
		this.dislikeit = dislikeit;
	}
	
	
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}

	public int getRrid() {
		return rrid;
	}
	public void setRrid(int rrid) {
		this.rrid = rrid;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	
}
