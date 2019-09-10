package kh.finalpj.zlack.channel.model.vo;

public class Channel {
	private String memberId;
	private String ChannelName;
	private int ChatroomNo;
	public Channel() {
	}
	public Channel(String memberId, String channelName, int chatroomNo) {
		this.memberId = memberId;
		ChannelName = channelName;
		ChatroomNo = chatroomNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getChannelName() {
		return ChannelName;
	}
	public void setChannelName(String channelName) {
		ChannelName = channelName;
	}
	public int getChatroomNo() {
		return ChatroomNo;
	}
	public void setChatroomNo(int chatroomNo) {
		ChatroomNo = chatroomNo;
	}
}
