package kh.finalpj.zlack.memberjointable.model.vo;

public class MemberJointabel {
	private int chatroomno;
	private String memberId;
	
	
	public MemberJointabel(int chatroomno, String memberId) {
		this.chatroomno = chatroomno;
		this.memberId = memberId;
	}
	public MemberJointabel() {
	}
	
	public int getChatroomno() {
		return chatroomno;
	}
	public void setChatroomno(int chatroomno) {
		this.chatroomno = chatroomno;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	
}
