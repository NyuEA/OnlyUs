package com.dto;

public class CouponDTO {
	private String couid;
	private String amount;
	private String period_f;
	private String period_t;
	private char show_yn;
	private int clickcount;
	private String bisid;
	public CouponDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CouponDTO(String couid, String amount, String period_f, String period_t, char show_yn, int clickcount,
			String bisid) {
		super();
		this.couid = couid;
		this.amount = amount;
		this.period_f = period_f;
		this.period_t = period_t;
		this.show_yn = show_yn;
		this.clickcount = clickcount;
		this.bisid = bisid;
	}
	public String getCouid() {
		return couid;
	}
	public void setCouid(String couid) {
		this.couid = couid;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getPeriod_f() {
		return period_f;
	}
	public void setPeriod_f(String period_f) {
		this.period_f = period_f;
	}
	public String getPeriod_t() {
		return period_t;
	}
	public void setPeriod_t(String period_t) {
		this.period_t = period_t;
	}
	public char getShow_yn() {
		return show_yn;
	}
	public void setShow_yn(char show_yn) {
		this.show_yn = show_yn;
	}
	public int getClickcount() {
		return clickcount;
	}
	public void setClickcount(int clickcount) {
		this.clickcount = clickcount;
	}
	public String getBisid() {
		return bisid;
	}
	public void setBisid(String bisid) {
		this.bisid = bisid;
	}
	@Override
	public String toString() {
		return "couponDTO [couid=" + couid + ", amount=" + amount + ", period_f=" + period_f + ", period_t=" + period_t
				+ ", show_yn=" + show_yn + ", clickcount=" + clickcount + ", bisid=" + bisid + "]";
	}
	
	
	
}
