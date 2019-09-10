package kh.finalpj.zlack.analysis.model.vo;

public class UseChannelAnalysis {
	private String memberId;
	private String analysisMonth;
	private String channelName;
	private int amountChatting;
	
	public UseChannelAnalysis() {
		
	}

	public UseChannelAnalysis(String memberId, String analysisMonth, String channelName, int amountChatting) {
		super();
		this.memberId = memberId;
		this.analysisMonth = analysisMonth;
		this.channelName = channelName;
		this.amountChatting = amountChatting;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getAnalysisMonth() {
		return analysisMonth;
	}

	public void setAnalysisMonth(String analysisMonth) {
		this.analysisMonth = analysisMonth;
	}

	public String getChannelName() {
		return channelName;
	}

	public void setChannelName(String channelName) {
		this.channelName = channelName;
	}

	public int getAmountChatting() {
		return amountChatting;
	}

	public void setAmountChatting(int amountChatting) {
		this.amountChatting = amountChatting;
	}

	@Override
	public String toString() {
		return "UseChannelAnalysis [memberId=" + memberId + ", analysisMonth=" + analysisMonth + ", channelName="
				+ channelName + ", amountChatting=" + amountChatting + "]";
	}
	

}
