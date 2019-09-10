package kh.finalpj.zlack.chattest.model.vo;


public class chattest {
	private int chatRoomNo;
	private int chatNo;
	private String memberId;
	private String content;
	
	public int getChatRoomNo() {
		return chatRoomNo;
	}
	
	public chattest() {
		// TODO Auto-generated constructor stub
	}

	public chattest(int chatRoomNo, int chatNo, String memberId, String content) {
		this.chatRoomNo = chatRoomNo;
		this.chatNo = chatNo;
		this.memberId = memberId;
		this.content = content;
	}

	@Override
	public String toString() {
		return "chat [chatRoomNo=" + chatRoomNo + ", chatNo=" + chatNo + ", memberId=" + memberId + ", content="
				+ content + "]";
	}
	public void setChatRoomNo(int chatRoomNo) {
		this.chatRoomNo = chatRoomNo;
	}
	public int getChatNo() {
		return chatNo;
	}
	public void setChatNo(int chatNo) {
		this.chatNo = chatNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
}
