package com.dto;

public class genUserDTO {
	private String bisid;
	private String passwd;
	private String bisname;
	private int post1;
	private int post2;
	private String addr1;
	private String addr2;
	private int phone1;
	private int phone2;
	private int phone3;
	public genUserDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public genUserDTO(String bisid, String passwd, String bisname, int post1, int post2, String addr1, String addr2,
			int phone1, int phone2, int phone3) {
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
	@Override
	public String toString() {
		return "genUserDTO [bisid=" + bisid + ", passwd=" + passwd + ", bisname=" + bisname + ", post1=" + post1
				+ ", post2=" + post2 + ", addr1=" + addr1 + ", addr2=" + addr2 + ", phone1=" + phone1 + ", phone2="
				+ phone2 + ", phone3=" + phone3 + "]";
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
	public int getPost1() {
		return post1;
	}
	public void setPost1(int post1) {
		this.post1 = post1;
	}
	public int getPost2() {
		return post2;
	}
	public void setPost2(int post2) {
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
	public int getPhone1() {
		return phone1;
	}
	public void setPhone1(int phone1) {
		this.phone1 = phone1;
	}
	public int getPhone2() {
		return phone2;
	}
	public void setPhone2(int phone2) {
		this.phone2 = phone2;
	}
	public int getPhone3() {
		return phone3;
	}
	public void setPhone3(int phone3) {
		this.phone3 = phone3;
	}
	
	
}
