package kh.finalpj.zlack.member.model.vo;

import java.sql.Date;

public class Member {

	private String memberId;
	private String nickName;
	private String password;
	private String email;
	private int ok;
	private Date enrollDate;
	private String image;
	private int loginCount;
	public Member() {
	}
	public Member(String memberId, String nickName, String password, String email, int ok, Date enrollDate,
			String image, int loginCount) {
		this.memberId = memberId;
		this.nickName = nickName;
		this.password = password;
		this.email = email;
		this.ok = ok;
		this.enrollDate = enrollDate;
		this.image = image;
		this.loginCount = loginCount;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getOk() {
		return ok;
	}
	public void setOk(int ok) {
		this.ok = ok;
	}
	public Date getEnrollDate() {
		return enrollDate;
	}
	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getLoginCount() {
		return loginCount;
	}
	public void setLoginCount(int loginCount) {
		this.loginCount = loginCount;
	}
	@Override
	public String toString() {
		return "Member [memberId=" + memberId + ", nickName=" + nickName + ", password=" + password + ", email=" + email
				+ ", ok=" + ok + ", enrollDate=" + enrollDate + ", image=" + image + ", loginCount=" + loginCount + "]";
	}
}