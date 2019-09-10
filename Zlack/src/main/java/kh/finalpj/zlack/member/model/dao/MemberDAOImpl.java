package kh.finalpj.zlack.member.model.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalpj.zlack.member.model.vo.AuthCode;
import kh.finalpj.zlack.member.model.vo.Member;

@Repository
public class MemberDAOImpl implements MemberDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;

    @Override
    public Member viewMember(Member vo) {
        return sqlSession.selectOne("member.viewMember", vo);
    }

	@Override
	public Object loginCount(Member vo) {
		return sqlSession.selectOne("member.loginCount",vo);
	}
	
	@Override
	public Object selectOneMemberId(String memberId) {
		return sqlSession.selectOne("member.selectOneMemberId", memberId);
	}

	@Override
	public int insertMember(Member member) {
		return sqlSession.insert("member.insertMember", member);
	}

	@Override
	public List<Member> IdCheckEmail(String email) {
		return sqlSession.selectList("member.IdCheckEmail", email);
	}
	
	@Override
	public int insertAuthCode(Map<String, String> param) {
		return sqlSession.insert("member.insertAuthCode", param);
	}

	@Override
	public int deleteAuthCode(Map<String, String> param2) {
		return sqlSession.delete("member.DeleteCode", param2);
	}

	@Override
	public List<AuthCode> selectCheckCode(Map<String, String> param) {
		return sqlSession.selectList("member.selectCheckCode", param);
	}

	@Override
	public List<Member> PwdCheckEmail(Map<String, String> param) {
		return sqlSession.selectList("member.PwdCheckEmail", param);
	}

	@Override
	public int updatePassword(Map<String, String> param) {
		return sqlSession.update("member.updatePassword", param);
	}
	
	@Override
	public Member selectOneMember(String memberId) {
		return sqlSession.selectOne("member.selectOneMember",memberId);
	}

	@Override
	public List<Map<String, String>> selectworkSpace() {
		return sqlSession.selectList("member.selectworkSpace");
	}
	
	@Override
	public int updateViewAll(Map<String, String> param) {
		return sqlSession.update("member.updateViewAll", param);
	}

	@Override
	public int updateViewPassword(Map<String, String> param) {
		return sqlSession.update("member.updateViewPassword", param);
	}

	@Override
	public int updateViewProFile(Map<String, String> param) {
		return sqlSession.update("member.updateViewProFile", param);
	}

	@Override
	public int updateView(Map<String, String> param) {
		return sqlSession.update("member.updateView", param);
	}

	@Override
	public List<Member> memberPwdcheck(Map<String, String> param) {
		return sqlSession.selectList("member.memberPwdcheck", param);
	}

	@Override
	public int memberDelete(String memberId) {
		return sqlSession.delete("member.memberDelete", memberId);
	}

	@Override
	public List findMember(String content) {
		return sqlSession.selectList("member.findMember", content);
	}

}
