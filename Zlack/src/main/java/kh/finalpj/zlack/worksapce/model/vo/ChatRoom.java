package kh.finalpj.zlack.worksapce.model.vo;

public class ChatRoom {
	int chatRoomNo;
	String memberId;
	int noRead;
	
	public ChatRoom() {}
	public ChatRoom(int chatRoomNo, String memberId, int noRead) {
		this.chatRoomNo = chatRoomNo;
		this.memberId = memberId;
		this.noRead = noRead;
	}
	public int getChatRoomNo() {
		return chatRoomNo;
	}
	public void setChatRoomNo(int chatRoomNo) {
		this.chatRoomNo = chatRoomNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getNoRead() {
		return noRead;
	}
	public void setNoRead(int noRead) {
		this.noRead = noRead;
	}
	@Override
	public String toString() {
		return "ChatRoom [chatRoomNo=" + chatRoomNo + ", memberId=" + memberId + ", noRead=" + noRead + "]";
	}
	
	
	
}
