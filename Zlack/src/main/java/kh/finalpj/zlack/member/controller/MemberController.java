package kh.finalpj.zlack.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kh.finalpj.zlack.member.model.service.Memberservice;
import kh.finalpj.zlack.member.model.vo.Member;

@SessionAttributes(value={"memberLoggedIn"})
@Controller
public class MemberController {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired
	Memberservice memberservice;
	@Autowired
	BCryptPasswordEncoder bcryptPasswordEncoder;	
	
	@RequestMapping("/member/Loginpage.do")
	public String Loginpage(String type, HttpServletRequest request) {
		
		request.setAttribute("type", type);
		return "member/loginpage";
	}
	
	@RequestMapping(value="/member/memberLogin.do", method=RequestMethod.POST)
	public ModelAndView memberLogin(ModelAndView mav, @RequestParam String memberId, @RequestParam String password){

		List<Map<String,String>> WorkSpaceList = memberservice.selectworkSpace();

		//1.업무로직
		Member m = memberservice.selectOneMember(memberId);
		System.out.println("로긍인"+m);
		//3.view단 처리
		String msg = "";
		String loc = "/member/memberinfo.do";
		if(m == null){
			msg = "존재하지 않는 아이디입니다.";
			loc="/member/Loginpage.do";
		}
		else{
			if(m.getPassword().equals(password))
			{
				msg = "로그인 성공!";
				mav.addObject("memberLoggedIn", m);
				
				System.out.println(m.toString());
			}
			else{
				msg = "비밀번호가 틀렸습니다.";
				loc="/member/Loginpage.do";
			}
		}
		
		//기존 request객체 속성으로 저장했던 것들을 mav에 key/value로 저장함.
		mav.addObject("loc",loc);
		mav.addObject("msg",msg);
		//view단 지정
		mav.addObject("WorkSpaceList",WorkSpaceList);
		System.out.println(WorkSpaceList);
		mav.setViewName("common/msg");
			
		
		
		
		return mav;
	}
	
	@RequestMapping("/member/MemberEnrollPage")
	public String MemberEnrollPage() {
		return "member/memberEnroll";
	}
	@RequestMapping("/member/logout.do")
    public ModelAndView logout(SessionStatus sessionStatus,HttpSession session){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("redirect:/");
        session.invalidate();
        
        if(!sessionStatus.isComplete())
			sessionStatus.setComplete();
        return mav;
    }

	
	@RequestMapping("/member/memberinfo.do")
	public ModelAndView login_start(@SessionAttribute(value="memberLoggedIn", required=false) Member memberLoggedIn) {
		 ModelAndView mv = new ModelAndView();
		 List<Map<String,String>> WorkSpaceList = memberservice.selectworkSpace();
		 mv.setViewName("member/memberinfo");
		 mv.addObject("WorkSpaceList", WorkSpaceList);
		 return mv;
	}
	

	@RequestMapping("/member/findMember.do")
    public String findMember(String type ,HttpServletRequest request) {
         
        if(type==null) {
            type="아이디찾기";
        }
        request.setAttribute("type", type);
        return "member/findMember";
    }
	
	@RequestMapping("/member/checkId.do")
	@ResponseBody
	public Map<String, Object> checkId(@RequestParam String memberId){
		
		logger.debug("아이디 중복체크!");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		boolean isUsable 
		= memberservice.selectOneMemberId(memberId)==null?true:false;
		map.put("isUsable", isUsable);
		
		return map;
	}
	
	@RequestMapping("/member/memberEnrollEnd.do")
	public String memberEnrollEnd(Member member, Model model) {
		
		logger.info("회원등록 처리 요청!");
		//0.비밀번호 암호화 처리(random salt값을 이용해서 해싱처리됨)
		/*String password = member.getPassword();
		String encodedPassword = bcryptPasswordEncoder.encode(password);
		System.out.println("암호화전: "+password);
		System.out.println("암호화후: "+encodedPassword);
		
		member.setPassword(encodedPassword);*/
		//1.업무로직
		int result = memberservice.insertMember(member);
		
		//2.view단 처리
		
		model.addAttribute("loc", "/");
		model.addAttribute("msg", result>0?"회원가입성공!":"회원가입실패!");
		
		return "common/msg";
	}
	
	@RequestMapping("/member/PwdUpdate")
	public ModelAndView PwdUpdate(@RequestParam String updateId,@RequestParam String password1, ModelAndView mav) {
		
		//0.비밀번호 암호화 처리(random salt값을 이용해서 해싱처리됨)
		/*String password = bcryptPasswordEncoder.encode(password1);
		logger.info("변경아이디 : "+updateId);
		logger.info("비번 : "+password1);
		
		member.setPassword(encodedPassword);*/
		Map<String, String> param = new HashMap<String, String>();
		param.put("memberId", updateId);
		param.put("password", password1);
		
		int result = memberservice.updatePassword(param);
		
		String msg = result>0?"비밀번호를 변경했습니다.":"비밀번호 변경에 실패했습니다.";
		String loc = "/member/Loginpage.do";
		
		mav.addObject("msg", msg);
		mav.addObject("loc", loc);
		mav.setViewName("common/msg");
		
		return mav;
	}
	
	@RequestMapping("/member/memberView.do")
	public String memberView(String type,HttpServletRequest request,
			@SessionAttribute(value="memberLoggedIn", required=false) Member memberLoggedIn) {
		
		if(type==null) {
			type="사용자정보";
		}
		
		Member member = memberservice.selectOneMember(memberLoggedIn.getMemberId());
		
		request.setAttribute("memberLoggedIn", member);
		request.setAttribute("type", type);
		
		return "member/memberView";
	}
	
	@RequestMapping("/member/UpdateMemberView.do")
	public String UpdateMemberView(String type,HttpServletRequest request,
			@SessionAttribute(value="memberLoggedIn", required=false) Member memberLoggedIn) {
		
		if(type==null) {
			type="사용자정보";
		}
		
		Member member = memberservice.selectOneMember(memberLoggedIn.getMemberId());
		
		request.setAttribute("member", member);
		request.setAttribute("type", type);
		
		return "member/UpdateMemberView";
	}
	
	@RequestMapping("/member/memberUpdateEnd.do")
    public ModelAndView memberUpdateEnd(String memberId,String nickName, String email
            , MultipartFile proFile,HttpServletRequest request, ModelAndView mav) {
        String password = request.getParameter("password");
        //DB에서 UPDATE
        Map<String, String> param = new HashMap<String, String>();
        param.put("memberId", memberId);
        param.put("nickName", nickName);
        param.put("email", email);
        
        String FileName = proFile.getOriginalFilename();
        
        String saveDirectory = request.getSession().getServletContext().getRealPath("/resources/upload/profile");
        String newFileName = "";
        if(FileName != "") {
            String ext = FileName.substring(FileName.lastIndexOf(".")+1);
            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
            int rndNum = (int)(Math.random()*1000);
            
            newFileName = sdf.format(new Date())+"_"+rndNum+"."+ext;
            
            try {
                proFile.transferTo(new File(saveDirectory+"/"+FileName));
            } catch (IllegalStateException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
            param.put("proFile", FileName);
        }
        int result = 0;
        if(password.length()>0) {
//          String Encodepassword = bcryptPasswordEncoder.encode(password);
//          logger.info("암호화 비번 : "+Encodepassword);
            param.put("password", password);
            if(FileName != "") {
                //둘다 있을때 패스워드, 파일
                result = memberservice.updateViewAll(param);
                
            }else{
                //패스워드만 있을때
                result = memberservice.updateViewPassword(param);
            }
        }
        else {
            if(FileName != "") {
                //파일만 있을때
                result = memberservice.updateViewProFile(param);
            }else{
                //둘다없을때
                result = memberservice.updateView(param);
            }
        }
        String msg = result>0?"수정을 완료했습니다.":"수정을 실패했습니다.";
        
        Member memberLoggedIn = memberservice.selectOneMember(memberId);
        
        mav.addObject("memberLoggedIn", memberLoggedIn);
        mav.addObject("loc", "/member/memberView.do");
        mav.addObject("msg", msg);
        
        mav.setViewName("common/msg");
        
        return mav;
    }
	
	@RequestMapping(value="/member/memberPwdcheck.do", method=RequestMethod.GET,produces = "application/json")
	@ResponseBody
	public int memberPwdcheck(@RequestParam String memberId,@RequestParam String password){
		
		Map<String, String> param = new HashMap<String, String>();
		param.put("memberId", memberId);
		param.put("password", password);
		List<Member> list = memberservice.memberPwdcheck(param);
		logger.info(list+"허호호호홓홓");
		
		return list.size();
	}
	@RequestMapping("/member/memberDelete.do")
	public ModelAndView memberDelete(String memberId,ModelAndView mav, SessionStatus sessionStatus,HttpSession session) {

	      
	        
		int result = memberservice.memberDelete(memberId);
		String msg = "";
		String loc = "/";
		if(result>0) {
			msg = "회원탈퇴가 완료되었습니다.";
			  session.invalidate();
		        
		        if(!sessionStatus.isComplete())
					sessionStatus.setComplete();
			
		}else {
			msg = "회원탈퇴에 실패했습니다.";
			loc = "/member/memberView.do";
		}
		
		mav.addObject("loc", loc);
		mav.addObject("msg", msg); 
		
		mav.setViewName("common/msg");
		
		return mav;
	}
	@RequestMapping("/member/findMember")
	@ResponseBody
	public List<Member> findMember(@RequestParam String content) {
		
		System.out.println("ajaxTest"+content);
		List<Member> list = new ArrayList();
		
		list = memberservice.findMember(content);
		
		System.out.println("findAjax"+list);
		
		return list;
	}
	
}
