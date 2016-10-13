package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("GenUserDTO")
public class GenUserDTO {
	private String userid;
	private String passwd;
	private String nickname;
	private String phone;
	public GenUserDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public GenUserDTO(String userid, String passwd, String nickname, String phone) {
		super();
		this.userid = userid;
		this.passwd = passwd;
		this.nickname = nickname;
		this.phone = phone;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	@Override
	public String toString() {
		return "genUserDTO [userid=" + userid + ", passwd=" + passwd + ", nickname=" + nickname + ", phone=" + phone
				+ "]";
	}
	
	
}
