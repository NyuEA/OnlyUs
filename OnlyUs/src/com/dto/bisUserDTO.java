package com.dto;

public class bisUserDTO {
	private String userid;
	private String passwd;
	private String nickname;
	private String birthday;
	private String preferbis;
	public bisUserDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public bisUserDTO(String userid, String passwd, String nickname, String birthday, String preferbis) {
		super();
		this.userid = userid;
		this.passwd = passwd;
		this.nickname = nickname;
		this.birthday = birthday;
		this.preferbis = preferbis;
	}
	@Override
	public String toString() {
		return "bisUserDTO [userid=" + userid + ", passwd=" + passwd + ", nickname=" + nickname + ", birthday="
				+ birthday + ", preferbis=" + preferbis + "]";
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
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getPreferbis() {
		return preferbis;
	}
	public void setPreferbis(String preferbis) {
		this.preferbis = preferbis;
	}

	
	
}
