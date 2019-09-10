package kh.finalpj.zlack.member.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kh.finalpj.zlack.member.model.service.Memberservice;
import kh.finalpj.zlack.member.model.vo.AuthCode;
import kh.finalpj.zlack.member.model.vo.Member;

@RestController
public class EmailSendController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private JavaMailSender mailsender;
	
	@Autowired
	Memberservice memberservice;
	
	@RequestMapping(value="/member/emailSendCode",method = RequestMethod.GET,produces = "application/json")
	public int emailSendCode(@RequestParam String email,HttpServletResponse response){

		logger.info("인증 이메일 : "+email);		
		String authCode = RandomAuthCode();
		
		String setfrom = "zlackmanager@gmail.com"; //보내는 사라 이메일 
		String tomail = email; // 받는 사람 이메일
		String title = "Zlack 인증코드입니다."; // 제목
  		String content = "<div style='text-align: left; width: 1024px;'>" 
  				+"<div style='width: 700px;margin-left: 5%;'>" 
  				+"<div><img src='https://res.cloudinary.com/dxzisjk6f/image/upload/v1562331553/emailCodePage1_ugd826.png' style='vertical-align: bottom;'></div>" 
  				+"<div><img src='https://res.cloudinary.com/dxzisjk6f/image/upload/v1562331552/emailCodePage2_bbywzr.png' style='vertical-align: middle;float: left;'>" 
  				+"<span style='font-size: 34px; font-weight: bold;vertical-align: middle;' >인증번호 : "+authCode+"</span>" 
  				+"<img src='https://res.cloudinary.com/dxzisjk6f/image/upload/v1562331552/emailCodePage3_xrjgt1.png' style='vertical-align: middle;float: right;margin-right: 1px;'></div>" 
  				+"<div style='vertical-align: bottom;'>" 
  				+"<img src='https://res.cloudinary.com/dxzisjk6f/image/upload/v1562331553/emailCodePage4_lnqh4i.png'>" 
  				+"</div></div></div>";
		
		Map<String, String> param = new HashMap<String, String>();
		Date day = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");// String으로 저장
		String today = sdf.format(day);
		param.put("email", email);
		param.put("today", today);
		memberservice.deleteAuthCode(param);	
		
		logger.info("오늘날짜 : "+today);
		int result = 0;
		try {
			
			MimeMessage message = mailsender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(setfrom); //보내는 사람
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능
			messageHelper.setText("html",content); // 메일 내용

			mailsender.send(message);
			Map<String, String> param2 = new HashMap<String, String>();
			
			param2.put("email", email);
			param2.put("authCode", authCode);
			
			result = memberservice.insertAuthCode(param2);
			
			if(result>0)logger.info("메일발송 성공!");
			else logger.info("메일발송 실패!");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
				
		logger.info("인증 코드 : "+authCode);
		
		return result;
	}
	
	@RequestMapping(value="/member/checkEmailCode",method=RequestMethod.GET,produces = "application/json")
	public int checkEmailCode(@RequestParam String authCode,@RequestParam String email) {
		
		logger.info("authCode: "+authCode);
		logger.info("email : "+email);
		
		Map<String, String> param = new HashMap<String, String>();
		param.put("authCode", authCode);
		param.put("email", email);
		
		List<AuthCode> list = memberservice.selectCheckCode(param);
		logger.info("코드수 : "+list.size());
		
		return list.size();
	}
	
	@RequestMapping(value="/member/IdCheckEmail",method = RequestMethod.GET,produces = "application/json")
	public int IdSendCode(@RequestParam String email){
		
		logger.info("인증 이메일 : "+email);		
		List<Member> list = new ArrayList<Member>();
		list = memberservice.IdCheckEmail(email);
		
		logger.info("조회 아이디수 : "+list.size());		
		
		return list.size();
	}
	
	@RequestMapping(value="/member/SendCode",method = RequestMethod.GET,produces = "application/json")
	public int findSendCode(@RequestParam String email) {

		logger.info("Id찾기인증 이메일 : "+email);		
		
		/*오늘이전에 발급된 인증코드 또는 인증받는 이메일과 같은 정보들을 지운다.*/
		Map<String, String> param = new HashMap<String, String>();
		Date day = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");// String으로 저장
		String today = sdf.format(day);
		param.put("email", email);
		param.put("today", today);
		memberservice.deleteAuthCode(param);
		
		/*인증코드를 발급하고 테이블에 저장한다.*/
		String authCode = RandomAuthCode();
		Map<String, String> param2 = new HashMap<String, String>();
		
		param2.put("email", email);
		param2.put("authCode", authCode);
		
		int result = memberservice.insertAuthCode(param2);
  		String setfrom = "zlackmanager@gmail.com"; //보내는 사람 이메일 
  		String tomail = email; // 받는 사람 이메일
  		String title = "Zlack 인증코드입니다."; // 제목
  		String content = "<div style='text-align: left; width: 1024px;'>" 
  				+"<div style='width: 700px;margin-left: 5%;'>" 
  				+"<div><img src='https://res.cloudinary.com/dxzisjk6f/image/upload/v1562331553/emailCodePage1_ugd826.png' style='vertical-align: bottom;'></div>" 
  				+"<div><img src='https://res.cloudinary.com/dxzisjk6f/image/upload/v1562331552/emailCodePage2_bbywzr.png' style='vertical-align: middle;float: left;'>" 
  				+"<span style='font-size: 34px; font-weight: bold;vertical-align: middle;' >인증번호 : "+authCode+"</span>" 
  				+"<img src='https://res.cloudinary.com/dxzisjk6f/image/upload/v1562331552/emailCodePage3_xrjgt1.png' style='vertical-align: middle;float: right;margin-right: 1px;'></div>" 
  				+"<div style='vertical-align: bottom;'>" 
  				+"<img src='https://res.cloudinary.com/dxzisjk6f/image/upload/v1562331553/emailCodePage4_lnqh4i.png'>" 
  				+"</div></div></div>";
  		try {
			/*인증코드 이메일 전송*/
			MimeMessage message = mailsender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(setfrom); //보내는 사람
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능
			messageHelper.setText("html",content); // 메일 내용

			mailsender.send(message);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
  		
  		logger.info("Id찾기 인증 코드 : "+authCode);
		
		return result;
	}
	
	@RequestMapping(value="/member/IdCheckCode",method = RequestMethod.GET,produces = "application/json")
	public Map<String, Object> IdCheckCode(@RequestParam String email,@RequestParam String authCode){
	
		List<Member> list = new ArrayList<Member>();
		
		Map<String, Object> sendMap = new HashMap<String, Object>();
		
		Map<String, String> param = new HashMap<String, String>();
		param.put("authCode", authCode);
		param.put("email", email);
		
		List<AuthCode> codeList = memberservice.selectCheckCode(param);
		logger.info("코드 리스트 : "+codeList.size());
		if(codeList.size()==1) {
			list = memberservice.IdCheckEmail(email);			
		}
		else {
			list = null;
		}
		sendMap.put("list", list);
		logger.info("인증 이메일 : "+email);
		logger.info("인증할 코드 : "+authCode);
		logger.info("아이디 리스트 : "+list);		
		
		return sendMap;
	}
	
	@RequestMapping(value="/member/PwdCheckEmail",method = RequestMethod.GET,produces = "application/json")
	public int PwdCheckEmail(@RequestParam String email , @RequestParam String memberId){
		
		logger.info("인증 이메일 : "+email);		
		logger.info("인증 아이디 : "+memberId);		
		List<Member> list = new ArrayList<Member>();
		Map<String , String> param = new HashMap<String, String>();
		param.put("email", email);
		param.put("memberId", memberId);
		list = memberservice.PwdCheckEmail(param);
		
		logger.info("조회 아이디수 : "+list.size());		
		
		return list.size();
	}
	
	@RequestMapping(value="/member/checkPwdCode",method= RequestMethod.GET,produces = "application/json")
	public int checkPwdCode(@RequestParam String email,@RequestParam String authCode){
		Map<String, String> param = new HashMap<String, String>();
		param.put("authCode", authCode);
		param.put("email", email);
		List<AuthCode> codeList = memberservice.selectCheckCode(param);
		logger.info("코드 리스트 : "+codeList.size());
		
		return codeList.size();
	}
	
	public String RandomAuthCode() {
		String authCode = "";
		int n;
		for(int i=0; i<6;i++) {
			n = (int)(Math.random()*10);
			authCode+=n;
		}
		return authCode;
	}
}