package com.dto;

public class Top10DTO {
	private int clickcount;
	private String bisname;
	private String content;
	private String period_f;
	private String period_t;
	private String couid;
	public int getClickcount() {
		return clickcount;
	}
	public void setClickcount(int clickcount) {
		this.clickcount = clickcount;
	}
	public String getBisname() {
		return bisname;
	}
	public void setBisname(String bisname) {
		this.bisname = bisname;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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
	public String getCouid() {
		return couid;
	}
	public void setCouid(String couid) {
		this.couid = couid;
	}
	public Top10DTO(int clickcount, String bisname, String content, String period_f, String period_t, String couid) {
		super();
		this.clickcount = clickcount;
		this.bisname = bisname;
		this.content = content;
		this.period_f = period_f;
		this.period_t = period_t;
		this.couid = couid;
	}
	public Top10DTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Top10DTO [clickcount=" + clickcount + ", bisname=" + bisname + ", content=" + content + ", period_f="
				+ period_f + ", period_t=" + period_t + ", couid=" + couid + "]";
	}
	
	
	
	
}
