package kh.finalpj.zlack.member.model.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import kh.finalpj.zlack.member.model.vo.AuthCode;
import kh.finalpj.zlack.member.model.vo.Member;

public interface Memberservice {
	
	
    public Member viewMember(Member vo);

	public Object loginCount(Member vo);
	
	Object selectOneMemberId(String memberId);

	int insertMember(Member member);

	public List<Member> IdCheckEmail(String email);
	
	 public int insertAuthCode(Map<String, String> param);
	 
	 public int deleteAuthCode(Map<String, String> param2);
	 
	 public List<AuthCode> selectCheckCode(Map<String, String> param);

	 public Member selectOneMember(String memberId);

	public List<Map<String, String>> selectworkSpace();
	
	public List<Member> PwdCheckEmail(Map<String, String> param);

	public int updatePassword(Map<String, String> param);
	
	public int updateViewAll(Map<String, String> param);
	
	public int updateViewPassword(Map<String, String> param);
	
	public int updateViewProFile(Map<String, String> param);
	
	public int updateView(Map<String, String> param);
	
	public List<Member> memberPwdcheck(Map<String, String> param);
	
	public int memberDelete(String memberId);

	public List findMember(String content);

}
