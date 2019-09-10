package kh.finalpj.zlack.member.model.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import kh.finalpj.zlack.member.model.dao.MemberDAO;
import kh.finalpj.zlack.member.model.vo.AuthCode;
import kh.finalpj.zlack.member.model.vo.Member;

@Service
public class MemberserviceImpl implements Memberservice{
	@Inject
	private MemberDAO memberdao;


	
    @Override
    public Member viewMember(Member vo) {
        return memberdao.viewMember(vo);
    }


	@Override
	public Object loginCount(Member vo) {
		return memberdao.loginCount(vo);
		
	}
	
	@Override
	public Object selectOneMemberId(String memberId) {
		return memberdao.selectOneMemberId(memberId);
	}

	@Override
	public int insertMember(Member member) {
		return memberdao.insertMember(member);
	}


	@Override
	public List<Member> IdCheckEmail(String email) {
		return memberdao.IdCheckEmail(email);
	}
	
	@Override
	public int insertAuthCode(Map<String, String> param) {
		return memberdao.insertAuthCode(param);
	}

	@Override
	public int deleteAuthCode(Map<String, String> param2) {
		return memberdao.deleteAuthCode(param2);
	}


	@Override
	public List<AuthCode> selectCheckCode(Map<String, String> param) {
		return memberdao.selectCheckCode(param);
	}


	@Override
	public Member selectOneMember(String memberId) {
		return memberdao.selectOneMember(memberId);
	}

	@Override
	public List<Map<String, String>> selectworkSpace() {
		return memberdao.selectworkSpace();
	}
	
	@Override
	public List<Member> PwdCheckEmail(Map<String, String> param) {
		return memberdao.PwdCheckEmail(param);
	}


	@Override
	public int updatePassword(Map<String, String> param) {
		return memberdao.updatePassword(param);
	}

	@Override
	public int updateViewAll(Map<String, String> param) {
		return memberdao.updateViewAll(param);
	}

	@Override
	public int updateViewPassword(Map<String, String> param) {
		return memberdao.updateViewPassword(param);
	}

	@Override
	public int updateViewProFile(Map<String, String> param) {
		return memberdao.updateViewProFile(param);
	}

	@Override
	public int updateView(Map<String, String> param) {
		return memberdao.updateView(param);
	}

	@Override
	public List<Member> memberPwdcheck(Map<String, String> param) {
		return memberdao.memberPwdcheck(param);
	}

	@Override
	public int memberDelete(String memberId) {
		return memberdao.memberDelete(memberId);
	}


	@Override
	public List findMember(String content) {
		return memberdao.findMember(content);
	}
}
