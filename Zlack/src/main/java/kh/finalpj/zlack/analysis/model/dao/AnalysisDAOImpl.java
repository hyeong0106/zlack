package kh.finalpj.zlack.analysis.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalpj.zlack.analysis.model.vo.UseChannelAnalysis;
import kh.finalpj.zlack.analysis.model.vo.UserChannel;
import kh.finalpj.zlack.member.model.vo.Member;

@Repository
public class AnalysisDAOImpl implements AnalysisDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<UseChannelAnalysis> selectUseChannelAnalysis(String memberId) {
		return sqlSession.selectList("analysis.selectUseChannelAnalysis", memberId);
	}

	@Override
	public List<String> selectChannelName(String memberId) {
		return sqlSession.selectList("analysis.selectChannelName", memberId);
		
	}

	@Override
	public List<Member> selectAllMemberJoin() {
		System.out.println("조인");
		return sqlSession.selectList("analysis.selectAllMemberJoin");
	}

	@Override
	public List<Member> selectAllMemberLeave() {
		return sqlSession.selectList("analysis.selectAllMemberLeave");
	}

	
	


}
