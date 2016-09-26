package com.dto;

public class BisUserDTO {
	private String bisid;
	private String passwd;
	private String bisname;
	private String post1;
	private String post2;
	private String addr1;
	private String addr2;
	private String phone1;
	private String phone2;
	private String phone3;
	private String approval;
	public String getApproval() {
		return approval;
	}
	public void setApproval(String approval) {
		this.approval = approval;
	}
	public BisUserDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "bisUserDTO [bisid=" + bisid + ", passwd=" + passwd + ", bisname=" + bisname + ", post1=" + post1
				+ ", post2=" + post2 + ", addr1=" + addr1 + ", addr2=" + addr2 + ", phone1=" + phone1 + ", phone2="
				+ phone2 + ", phone3=" + phone3 + "]";
	}
	public BisUserDTO(String bisid, String passwd, String bisname, String post1, String post2, String addr1,
			String addr2, String phone1, String phone2, String phone3) {
		super();
		this.bisid = bisid;
		this.passwd = passwd;
		this.bisname = bisname;
		this.post1 = post1;
		this.post2 = post2;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.phone1 = phone1;
		this.phone2 = phone2;
		this.phone3 = phone3;
	}
	public String getBisid() {
		return bisid;
	}
	public void setBisid(String bisid) {
		this.bisid = bisid;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getBisname() {
		return bisname;
	}
	public void setBisname(String bisname) {
		this.bisname = bisname;
	}
	public String getPost1() {
		return post1;
	}
	public void setPost1(String post1) {
		this.post1 = post1;
	}
	public String getPost2() {
		return post2;
	}
	public void setPost2(String post2) {
		this.post2 = post2;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getPhone1() {
		return phone1;
	}
	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}
	public String getPhone2() {
		return phone2;
	}
	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}
	public String getPhone3() {
		return phone3;
	}
	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}
	
}
