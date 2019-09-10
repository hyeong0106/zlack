package kh.finalpj.zlack.analysis.model.vo;

public class UserChannel {
	private String memberId;
	private String channelName;
	
	public UserChannel() {
		
	}

	public UserChannel(String memberId, String channelName) {
		this.memberId = memberId;
		this.channelName = channelName;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getChannelName() {
		return channelName;
	}

	public void setChannelName(String channelName) {
		this.channelName = channelName;
	}

	@Override
	public String toString() {
		return "UserChannel [memberId=" + memberId + ", channelName=" + channelName + "]";
	}
	
}
