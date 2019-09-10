package kh.finalpj.zlack.worksapce.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kh.finalpj.zlack.channel.model.vo.Channel;
import kh.finalpj.zlack.chattest.model.vo.chattest;
import kh.finalpj.zlack.member.model.vo.Member;
import kh.finalpj.zlack.memberjointable.model.vo.MemberJointabel;
import kh.finalpj.zlack.worksapce.model.service.WorkspaceService;
import kh.finalpj.zlack.worksapce.model.vo.Attachment;
import kh.finalpj.zlack.worksapce.model.vo.ChatRoom;

@Controller
public class WorkspacsController {
	@Autowired
	WorkspaceService workspaceservcie;
	@RequestMapping("/workspace/createChannel.do")
    public ModelAndView createChannel(@SessionAttribute(value="memberLoggedIn", required=false) Member memberLoggedIn) {
        ModelAndView mv = new ModelAndView();
        workspaceservcie.deletememberJointabel(memberLoggedIn.getMemberId());
        List<Map<String,String>> ChannelList = workspaceservcie.selectChannelListJoinAble(memberLoggedIn.getMemberId());
        List<Map<String,String>> AllChannelList = workspaceservcie.selectAllChannel();
 
        mv.addObject("ChannelList", ChannelList);
        mv.addObject("AllChannelList",AllChannelList);
        mv.setViewName("workspace/plusCH");
        
        return mv;
    }
	
	@RequestMapping("/workspace/UpdateUserChatChanel.do")
	public ModelAndView UpdateUserChatChanel(HttpServletRequest request,
											 @SessionAttribute(value="memberLoggedIn", required=false) Member memberLoggedIn) {
		ModelAndView mv = new ModelAndView();
		workspaceservcie.deletememberJointabel(memberLoggedIn.getMemberId());
		try{
			 String ChannelName = request.getParameter("ChannelName");
		        int ChannelNO = Integer.parseInt(request.getParameter("ChannelNO"));
		        Channel Ch = new Channel();
		        if(ChannelNO!=-100) {
		            Ch.setChatroomNo(ChannelNO);
		            Ch.setMemberId(memberLoggedIn.getMemberId());
		            workspaceservcie.JoinChannel(Ch);
		        }
		        else {
		            Ch.setMemberId(memberLoggedIn.getMemberId());
		            Ch.setChannelName(ChannelName);
		            workspaceservcie.createChannel(ChannelName);
		            int cno = workspaceservcie.selectCno(ChannelName);
		            Ch.setChatroomNo(cno);
		            workspaceservcie.JoinChannel(Ch);
		        }
		        
		        List<Map<String,String>> AllMemoList = workspaceservcie.selectAllMemoList();
			    List<Map<String,String>> MemoList = workspaceservcie.selectMemoList(memberLoggedIn.getMemberId());
		        List<ChatRoom> ChatRoomList =  workspaceservcie.selectChatRoomList(memberLoggedIn.getMemberId());
		        List<Map<String,String>> ChannelList = workspaceservcie.selectChannelList(memberLoggedIn.getMemberId());
		        
		        mv.addObject("AllMemoList",AllMemoList);
			    mv.addObject("MemoList",MemoList);
		        mv.addObject("ChatRoomList",ChatRoomList);
		        mv.addObject("ChannelList",ChannelList);
		        
		        mv.setViewName("workspace/WorkSpaceMain");
		        return mv;
		}catch(NumberFormatException e){
			List<Map<String,String>> AllMemoList = workspaceservcie.selectAllMemoList();
		    List<Map<String,String>> MemoList = workspaceservcie.selectMemoList(memberLoggedIn.getMemberId());
		    List<ChatRoom> ChatRoomList =  workspaceservcie.selectChatRoomList(memberLoggedIn.getMemberId());
			List<Map<String,String>> ChannelList = workspaceservcie.selectChannelList(memberLoggedIn.getMemberId());
			 mv.addObject("AllMemoList",AllMemoList);
		    mv.addObject("MemoList",MemoList);
		    mv.addObject("ChatRoomList",ChatRoomList);
			mv.addObject("ChannelList",ChannelList);
				
			mv.setViewName("workspace/WorkSpaceMain");
			return mv;
			
		}
	}
	
	@RequestMapping("/workspace/create_workspace.do")
	public String create_workspace() {
		
		
		return "/workspace/create_workspace";
	}
	
	@RequestMapping("/workspace/codeSnippet.do")
	public String codeSnippet() {
		
		
		return "/workspace/codeSnippet";
	}
	
	@RequestMapping("/workspace/find_workspace.do")
	public String find_workspace() {
		return "/workspace/find_workspace";
	}
	
	@RequestMapping("/workspace/WorkSpaceMain.do")
	public String WorkSpaceMain(Model model, 
			  					HttpSession session, 
			  					@SessionAttribute(value="memberLoggedIn", required=false) Member memberLoggedIn){
		
		System.out.println(memberLoggedIn.getMemberId());
		workspaceservcie.deletememberJointabel(memberLoggedIn.getMemberId());
		List<Map<String,String>> AllMemoList = workspaceservcie.selectAllMemoList();
	    List<Map<String,String>> MemoList = workspaceservcie.selectMemoList(memberLoggedIn.getMemberId());
	    
		
	    model.addAttribute("AllMemoList",AllMemoList);
	    model.addAttribute("MemoList",MemoList);
		List<ChatRoom> ChatRoomList =  workspaceservcie.selectChatRoomList(memberLoggedIn.getMemberId());
		List<Map<String,String>> ChannelList = workspaceservcie.selectChannelList(memberLoggedIn.getMemberId());
		
		model.addAttribute("ChannelList",ChannelList);
		model.addAttribute("ChatRoomList",ChatRoomList);
		return "workspace/WorkSpaceMain";
	}
	/////////////////////////////memo///////////////////////////////////
	@RequestMapping("/workspace/AddMemo.do")
	public String AddAllMemo(){
		
		return "/workspace/AddMemoPopup";
	}
	@RequestMapping("/workspace/AddMemoEnd.do")
	public ModelAndView AddAllMemoEnd(HttpServletRequest request,
								ModelAndView mav, 
								HttpSession session, 
								@SessionAttribute(value="memberLoggedIn", required=false) Member memberLoggedIn){
		String memoTitle = request.getParameter("memoTitle");
		String memoContent = request.getParameter("memoContent");
		HashMap<String, String> param = new HashMap<>();
	    param.put("memberId", memberLoggedIn.getMemberId());
		param.put("memoTitle", memoTitle);
	    param.put("memoContent", memoContent);
	    int result = workspaceservcie.insertMemo(param);

		String msg = "";
	    if(result>0)
	    	msg="메모등록!";
	    else
	    	msg="메모등록 실패!";
	    String loc = "/workspace/WorkSpaceMain.do";
	    mav.addObject("msg",msg);
	    mav.addObject("loc",loc);
	    mav.setViewName("common/msg");
	    return mav;

	}
	@RequestMapping("/workspace/DeleteMemo.do")
	public String DeleteMemo(HttpServletRequest request,
							Model model, 
							HttpSession session, 
							@SessionAttribute(value="memberLoggedIn", required=false) Member memberLoggedIn){
		String memoNo = request.getParameter("memoNo");
		
		workspaceservcie.deleteMemo(memoNo);
		
		List<Map<String,String>> AllMemoList = workspaceservcie.selectAllMemoList();
		List<Map<String,String>> MemoList = workspaceservcie.selectMemoList(memberLoggedIn.getMemberId());
		
		List<ChatRoom> ChatRoomList =  workspaceservcie.selectChatRoomList(memberLoggedIn.getMemberId());
		List<Map<String,String>> ChannelList = workspaceservcie.selectChannelList(memberLoggedIn.getMemberId());
		
		model.addAttribute("AllMemoList",AllMemoList);
		model.addAttribute("MemoList",MemoList);
		model.addAttribute("ChannelList",ChannelList);
		model.addAttribute("ChatRoomList",ChatRoomList);
		return "workspace/WorkSpaceMain";
	}
	@RequestMapping("/workspace/UpdateMemo.do")
	public String UpdateMemo(HttpServletRequest request,
							 Model model){
		String memoNo = request.getParameter("memoNo");
		String memoTitle = request.getParameter("memoTitle");
		String memoContent = request.getParameter("memoContent");
		
		model.addAttribute("memoNo",memoNo);
		model.addAttribute("memoTitle",memoTitle);
		model.addAttribute("memoContent",memoContent);
		
		return "/workspace/UpdateMemoPopup";
	}
	@RequestMapping("/workspace/UpdateMemoEnd.do")
	public String UpdateMemoEnd(HttpServletRequest request,
							Model model, 
							HttpSession session, 
							@SessionAttribute(value="memberLoggedIn", required=false) Member memberLoggedIn){
		String memoNo = request.getParameter("memoNo");
		String memoTitle = request.getParameter("memoTitle");
		String memoContent = request.getParameter("memoContent");
		
		HashMap<String, String> param = new HashMap<>();
	    param.put("memoNo", memoNo);
		param.put("memoTitle", memoTitle);
	    param.put("memoContent", memoContent);
	    workspaceservcie.updateMemo(param);
		
		List<Map<String,String>> AllMemoList = workspaceservcie.selectAllMemoList();
		List<Map<String,String>> MemoList = workspaceservcie.selectMemoList(memberLoggedIn.getMemberId());
		
		List<ChatRoom> ChatRoomList =  workspaceservcie.selectChatRoomList(memberLoggedIn.getMemberId());
		List<Map<String,String>> ChannelList = workspaceservcie.selectChannelList(memberLoggedIn.getMemberId());
		
		model.addAttribute("AllMemoList",AllMemoList);
		model.addAttribute("MemoList",MemoList);
		model.addAttribute("ChannelList",ChannelList);
		model.addAttribute("ChatRoomList",ChatRoomList);
		return "workspace/WorkSpaceMain";
	}
	@RequestMapping("/workspace/plusDM.do")
	public String plusDM(Model model,
						 @SessionAttribute(value="memberLoggedIn", required=false) Member memberLoggedIn) {
		
		List<Member> memberList = workspaceservcie.selectListDMList(memberLoggedIn.getMemberId());
		model.addAttribute("memberList",memberList);
		return "workspace/plusDM";
	}
	
	@RequestMapping("/workspace/UpdateUserChatRoom.do")
	public String UpdateUserChatRoom(HttpSession session,
									 HttpServletRequest request,
									 @SessionAttribute(value="memberLoggedIn", required=false) Member memberLoggedIn) {
		String memberId = Optional.ofNullable(memberLoggedIn).map(Member::getMemberId)
				 .orElseThrow(IllegalStateException::new);
		String plusMember =request.getParameter("plusMember");
		
		workspaceservcie.insertDMList(memberId,plusMember);
		workspaceservcie.deletememberJointabel(memberLoggedIn.getMemberId());
		List<Member> memberList = workspaceservcie.selectListDMList(memberLoggedIn.getMemberId());
		List<ChatRoom> ChatRoomList =  workspaceservcie.selectChatRoomList(memberLoggedIn.getMemberId());
		List<Map<String,String>> ChannelList = workspaceservcie.selectChannelList(memberLoggedIn.getMemberId());
		List<Map<String,String>> AllMemoList = workspaceservcie.selectAllMemoList();
		List<Map<String,String>> MemoList = workspaceservcie.selectMemoList(memberLoggedIn.getMemberId());
		
		
		request.setAttribute("AllMemoList",AllMemoList);
		request.setAttribute("MemoList",MemoList);
		request.setAttribute("memberList",memberList);
		request.setAttribute("ChannelList",ChannelList);
		request.setAttribute("ChatRoomList",ChatRoomList);
		
		return "workspace/WorkSpaceMain";
	} 
	
	@RequestMapping("/workspace/userchat.do")
	   public String userchat(HttpServletRequest request,
	                        Model model,
	                        @SessionAttribute(value="memberLoggedIn", required=false) Member memberLoggedIn){

	       try {
	       int chatroom = Integer.parseInt(request.getParameter("chatroom"));
	       String Type = request.getParameter("type");
	       String DirectTitle = null;
	       MemberJointabel mjt = new MemberJointabel(chatroom,memberLoggedIn.getMemberId());
	       workspaceservcie.deletememberJointabel(memberLoggedIn.getMemberId());
	       workspaceservcie.insertmemberJointabel(mjt);
	       workspaceservcie.SeeMessage(mjt);
	       
	       model.addAttribute("chatroom",chatroom);
	       List<ChatRoom> ChatRoomList =  workspaceservcie.selectChatRoomList(memberLoggedIn.getMemberId());
	       if(Type == null) {	    	   
	    	   for(int i=0;i<ChatRoomList.size();i++) {
	    		   if(ChatRoomList.get(i).getChatRoomNo()==chatroom) {
	    			   DirectTitle = ChatRoomList.get(i).getMemberId();
	    		   }
	    	   }
	       }
	       else {
	    	   DirectTitle = workspaceservcie.selectOneChannelName(chatroom);
	       }
	       model.addAttribute("ChatRoomList",ChatRoomList);
	       List<chattest> chatList = workspaceservcie.selectchatlog(chatroom);
	       List<Map<String,String>> ChannelList = workspaceservcie.selectChannelList(memberLoggedIn.getMemberId());
	       
	       model.addAttribute("ChannelList",ChannelList);
	       model.addAttribute("chatList",chatList);
	       model.addAttribute("DirectTitle",DirectTitle);
	       return "workspace/userchat";
	       }catch(NumberFormatException e){
	           return "workspace/WorkSpaceMain";
	       }finally {
               List<Member> memberList = workspaceservcie.selectListDMList(memberLoggedIn.getMemberId());
               request.setAttribute("memberList",memberList);
               List<ChatRoom> ChatRoomList =  workspaceservcie.selectChatRoomList(memberLoggedIn.getMemberId());
               request.setAttribute("ChatRoomList",ChatRoomList);
               List<Map<String,String>> ChannelList = workspaceservcie.selectChannelList(memberLoggedIn.getMemberId());
               request.setAttribute("ChannelList",ChannelList);
               List<Map<String,String>> AllMemoList = workspaceservcie.selectAllMemoList();
       		   List<Map<String,String>> MemoList = workspaceservcie.selectMemoList(memberLoggedIn.getMemberId());
       		   request.setAttribute("AllMemoList",AllMemoList);
       		   request.setAttribute("MemoList",MemoList);
       }


	   }
	
	@RequestMapping(value = "/message/sendMessageAjax", method = RequestMethod.GET)
	public void sendMessageAjax(Model model,
								HttpServletRequest request, 
								HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/csv; charset=UTF-8");
		
		String message = request.getParameter("message");
		
		List<Map<String, String>> nameList = null;
		String csv = "";
		
		if((message.substring(0, 1).equals("@")) && !message.trim().isEmpty()) {
			nameList = workspaceservcie.selectById(message);
	
			if(!nameList.isEmpty()){
				for(int i=0; i< nameList.size(); i++){
					if(i!=0) csv += ",";
					csv +=  nameList.get(i).get("MEMBERID");
				}
			}
		}
		
		
		response.setContentType("text/csv; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.append(csv);
	}
	
	@RequestMapping("/workspace/moveDM")
	public String moveDM(HttpServletRequest request,
						 Model model,
						 @SessionAttribute(value="memberLoggedIn", required=false) Member memberLoggedIn){
	
		List<ChatRoom> FindChatRoom =  workspaceservcie.selectChatRoomList(memberLoggedIn.getMemberId());
		String memberId = request.getParameter("memberId").substring(1);
		int chatroom = 0;
		String DirectTitle = null;
		
		//기존방찾기
		for(int i=0;i<FindChatRoom.size();i++) {
			if(FindChatRoom.get(i).getMemberId().equals(memberId)) {
				chatroom = FindChatRoom.get(i).getChatRoomNo();			
			}		
		}
		//방생성
		if(chatroom == 0) {
			List<Member> memberList = workspaceservcie.selectListDMList(memberLoggedIn.getMemberId());
			request.setAttribute("memberList",memberList);
			workspaceservcie.insertDMList(memberLoggedIn.getMemberId(),memberId);
			FindChatRoom =  workspaceservcie.selectChatRoomList(memberLoggedIn.getMemberId());
		}
		//생성된 chatroomno찾기
		for(int i=0;i<FindChatRoom.size();i++) {
			if(FindChatRoom.get(i).getMemberId().equals(memberId)) {
				chatroom = FindChatRoom.get(i).getChatRoomNo();			
			}		
		}
		
		MemberJointabel mjt = new MemberJointabel(chatroom,memberLoggedIn.getMemberId());
		workspaceservcie.deletememberJointabel(memberLoggedIn.getMemberId());
		workspaceservcie.insertmemberJointabel(mjt);
		workspaceservcie.SeeMessage(mjt);
		
		List<ChatRoom> ChatRoomList =  workspaceservcie.selectChatRoomList(memberLoggedIn.getMemberId());
		//여기서
		List<chattest> chatList = workspaceservcie.selectchatlog(chatroom);
		model.addAttribute("chatroom",chatroom);
		model.addAttribute("ChatRoomList",ChatRoomList);
		model.addAttribute("chatList",chatList);
		model.addAttribute("DirectTitle",memberId);
		
		return "workspace/userchat";
	
	}
		
	@RequestMapping("/workspace/InsertWorkSpace.do")
	public ModelAndView InsertWorkSpace(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		String WrokSpcaeName = request.getParameter("WrokSpcaeName");
		workspaceservcie.insertWorkSpace(WrokSpcaeName);	
		mv.setViewName("redirect:/");
		return mv;
	}
	

	@RequestMapping(value = "/workspace/pagedMessageAjax", method = RequestMethod.POST)
	public void pagedMessageAjax(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
								@SessionAttribute(value="memberLoggedIn", required=false) Member memberLoggedIn,
								Model model,
								HttpServletRequest request, 
								HttpServletResponse response) throws Exception{

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/csv; charset=UTF-8");
		
		int numPerPage = 20;
		int chatroom = Integer.parseInt(request.getParameter("chatroom"));

		
		List<Map<String, String>> chatList = null;
		String csv = "";
		

		chatList = workspaceservcie.selectPagedchatlog(cPage,numPerPage,chatroom);
			if(!chatList.isEmpty()){
				for(int i=0; i< chatList.size(); i++){
					if(i!=0) csv += ",";
					csv +=  chatList.get(i).get("MEMBERID")+" : "+chatList.get(i).get("CONTENT");
				}
			}
		
		response.setContentType("text/csv; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.append(csv);
		
		}
		
	@RequestMapping("/workspace/FileUploadEnd.do")
    public ModelAndView insertBoard(MultipartFile upFile,
                                    HttpServletRequest request,
                                    ModelAndView mav,
                                    String chatroom,
                                    String memberId) {
       //1. 파일업로드
       String saveDirectory = request.getSession().getServletContext().getRealPath("/resources/upload/file");
       List<Attachment> attachList = new ArrayList<>();
           if(!upFile.isEmpty()) {
               String originalFileName = upFile.getOriginalFilename();
               System.out.println("dddd"+originalFileName);
               String ext = originalFileName.substring(originalFileName.lastIndexOf(".")+1);
               SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
               int rndNum = (int)(Math.random()*1000);
               String renamedFileName = sdf.format(new Date())+"_"+rndNum+"."+ext;
               System.out.println(saveDirectory+"DASDG");
               System.out.println(originalFileName);
               //서버 지정위치에 파일보관
               try {
                   //메모리에 물고있는 파일객체를 여기다가 저장하겠다
                   upFile.transferTo(new File(saveDirectory+"/"+originalFileName));
               } catch (IllegalStateException e) {
                   e.printStackTrace();
               } catch (IOException e) {
                   e.printStackTrace();
               }
               //vo객체에 담기
               Attachment attach = new Attachment();
               attach.setOriginalFileName(originalFileName);
               attach.setRenamedFileName(renamedFileName);
               //list에 vo담기
               attachList.add(attach);
           }
       HashMap<String, String> param = new HashMap<>();
       param.put("chatroom", chatroom);
       param.put("memberId", memberId);
       param.put("content", saveDirectory+"\\"+(upFile.getOriginalFilename()));
       int result = workspaceservcie.insertFileUpload(param, attachList);
       //logger.debug(msg);
       //2. 업무로직: db에 게시물 등록
       String msg = "";
       if(result>0)
           msg="파일업로드 완료!";
       else
           msg="파일업로드 실패!";
       String loc = "/workspace/userchat.do?chatroom="+chatroom;
       mav.addObject("msg",msg);
       mav.addObject("loc",loc);
       mav.setViewName("common/msg");
       return mav;
    
    }
    
    @RequestMapping("/workspace/fileDownload.do")
    @ResponseBody
    public byte[] fileDownload(@RequestParam String oName,
                               HttpServletRequest request,
                               HttpServletResponse response) throws IOException {
        
        //저장된 파일 디렉토리
        String saveDirectory = request.getSession().getServletContext()//applicationContext객체
                                    .getRealPath("/resources/upload/file");
        File savedFile = new File(saveDirectory+"/"+oName);
        
        response.setHeader("Content-Type", "application/octet-stream); charset=utf-8");
        response.setHeader("Content-Disposition", "attachment;fileName="+new String(oName.getBytes("UTF-8"), "ISO-8859-1")+"");
        response.setHeader("Content-Length", Long.toString(savedFile.length()));
        System.out.println(oName+"나나나나");
        
        
        return Files.readAllBytes(savedFile.toPath());
    }

    @RequestMapping("/workspace/deleteMessage.do")
	public ModelAndView deleteMessage(HttpServletRequest request, ModelAndView mav, String chatNo, String chatroom) {
		
		int result = workspaceservcie.deleteMessage(chatNo);

		String msg = "";
		if (result > 0)
			msg = "메세지 삭제 완료!";
		else
			msg = "메세지 삭제 실패!";
		String loc = "/workspace/userchat.do?chatroom=" + chatroom;
		mav.addObject("msg", msg);
		mav.addObject("loc", loc);
		mav.setViewName("common/msg");
		return mav;
	}
	
}
	
