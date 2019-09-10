package kh.finalpj.zlack.analysis.model.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalpj.zlack.analysis.model.dao.AnalysisDAO;
import kh.finalpj.zlack.analysis.model.vo.UseChannelAnalysis;
import kh.finalpj.zlack.analysis.model.vo.UserChannel;
import kh.finalpj.zlack.member.model.vo.Member;

@Service
public class AnalysisServiceImpl implements AnalysisService {
	
	Logger logger = LoggerFactory.getLogger(AnalysisServiceImpl.class);
	
	@Autowired
	AnalysisDAO analysisDao;

	@Override
	public List<UseChannelAnalysis> selectUseChannelAnalysis(String memberId) {
		return analysisDao.selectUseChannelAnalysis(memberId);
	}

	@Override
	public List<String> selectChannelName(String memberId) {
		return analysisDao.selectChannelName(memberId);
	}

	@Override
	public List<Member> selectAllMemberJoin() {
		return analysisDao.selectAllMemberJoin();
	}

	@Override
	public List<Member> selectAllMemberLeave() {
		// TODO Auto-generated method stub
		return analysisDao.selectAllMemberLeave();
	}



}
