package kh.finalpj.zlack.member.model.vo;
import java.sql.Date;
public class AuthCode {
	private String email;
	private String code;
	private Date sendDate;
	
	public AuthCode() {
		super();
	}
	
	public AuthCode(String email, String code, Date sendDate) {
		super();
		this.email = email;
		this.code = code;
		this.sendDate = sendDate;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public Date getSendDate() {
		return sendDate;
	}
	public void setSendDate(Date sendDate) {
		this.sendDate = sendDate;
	}

	@Override
	public String toString() {
		return "AuthCode [email=" + email + ", code=" + code + ", sendDate=" + sendDate + "]";
	}
}