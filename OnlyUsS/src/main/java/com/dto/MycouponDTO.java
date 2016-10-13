package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("MycouponDTO")
public class MycouponDTO {
	private String couid;
	private String period_f;
	private String period_t;
	private String bisid;
	private String bisname;
	private String dcouid;
	private String use_yn;
	private String userid;
	private String content;
	public MycouponDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MycouponDTO(String couid, String period_f, String period_t, String bisid, String bisname, String dcouid,
			String use_yn, String userid, String content) {
		super();
		this.couid = couid;
		this.period_f = period_f;
		this.period_t = period_t;
		this.bisid = bisid;
		this.bisname = bisname;
		this.dcouid = dcouid;
		this.use_yn = use_yn;
		this.userid = userid;
		this.content = content;
	}
	@Override
	public String toString() {
		return "MycouponDTO [couid=" + couid + ", period_f=" + period_f + ", period_t=" + period_t + ", bisid=" + bisid
				+ ", bisname=" + bisname + ", dcouid=" + dcouid + ", use_yn=" + use_yn + ", userid=" + userid
				+ ", content=" + content + "]";
	}
	public String getCouid() {
		return couid;
	}
	public void setCouid(String couid) {
		this.couid = couid;
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
	public String getBisid() {
		return bisid;
	}
	public void setBisid(String bisid) {
		this.bisid = bisid;
	}
	public String getBisname() {
		return bisname;
	}
	public void setBisname(String bisname) {
		this.bisname = bisname;
	}
	public String getDcouid() {
		return dcouid;
	}
	public void setDcouid(String dcouid) {
		this.dcouid = dcouid;
	}
	public String getUse_yn() {
		return use_yn;
	}
	public void setUse_yn(String use_yn) {
		this.use_yn = use_yn;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	

}
