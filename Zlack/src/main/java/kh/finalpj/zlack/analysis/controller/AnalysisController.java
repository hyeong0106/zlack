package kh.finalpj.zlack.analysis.controller;

import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.finalpj.zlack.analysis.model.service.AnalysisService;
import kh.finalpj.zlack.analysis.model.vo.UseChannelAnalysis;
import kh.finalpj.zlack.member.model.vo.Member;

@Controller
@RequestMapping("/analysis")
public class AnalysisController {
		
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	AnalysisService analysisService;
	
	@RequestMapping("/analysisForm.do")
	public void boardFrom(HttpServletRequest request) {
			//목록값 받아오기
			String type = request.getParameter("type");
			
			//세션에서 현재로그인한 멤버아이디값 가져오기
			String memberId = "aaa";
			
			//채널에 쓸 그래프 데이터
				List<UseChannelAnalysis> UseChannelAnalysisList = analysisService.selectUseChannelAnalysis(memberId);
				List<String> UserChannelList = analysisService.selectChannelName(memberId);
				//현재 달 구하기
				Calendar calendar = new GregorianCalendar(Locale.KOREA);
				int todayMonth = calendar.get(Calendar.MONTH) + 1;
				request.setAttribute("UseChannelAnalysisList", UseChannelAnalysisList);
				request.setAttribute("UserChannelList", UserChannelList);
				request.setAttribute("todayMonth", todayMonth);
			//채널 끝	
			//전체 가입자수 통계
				List<Member> memberJoinList = analysisService.selectAllMemberJoin();
				List<Member> memberLeaveList = analysisService.selectAllMemberLeave();
				request.setAttribute("memberJoinList", memberJoinList);
				request.setAttribute("memberLeaveList", memberLeaveList);
				
			
			
			
			
			
			//목록 넘기기
			request.setAttribute("type", type);
		
	}
	
	
}
