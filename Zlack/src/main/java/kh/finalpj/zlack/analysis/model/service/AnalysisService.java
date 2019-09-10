package kh.finalpj.zlack.analysis.model.service;

import java.util.List;

import kh.finalpj.zlack.analysis.model.vo.UseChannelAnalysis;
import kh.finalpj.zlack.analysis.model.vo.UserChannel;
import kh.finalpj.zlack.member.model.vo.Member;

public interface AnalysisService {

	List<UseChannelAnalysis> selectUseChannelAnalysis(String memberId);

	List<String> selectChannelName(String memberId);

	List<Member> selectAllMemberJoin();

	List<Member> selectAllMemberLeave();




}
