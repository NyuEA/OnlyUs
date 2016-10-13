package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("DownCouponDTO")
public class DownCouponDTO {
	private String dcouid;
	private String couid;
	private String use_yn;
	private String userid;
	public DownCouponDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DownCouponDTO(String dcouid, String couid, String use_yn, String userid) {
		super();
		this.dcouid = dcouid;
		this.couid = couid;
		this.use_yn = use_yn;
		this.userid = userid;
	}
	@Override
	public String toString() {
		return "downCouponDTO [dcouid=" + dcouid + ", couid=" + couid + ", use_yn=" + use_yn + ", userid=" + userid
				+ "]";
	}
	public String getDcouid() {
		return dcouid;
	}
	public void setDcouid(String dcouid) {
		this.dcouid = dcouid;
	}
	public String getCouid() {
		return couid;
	}
	public void setCouid(String couid) {
		this.couid = couid;
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
	
	

	
	
}
