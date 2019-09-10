package kh.finalpj.zlack.worksapce.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalpj.zlack.channel.model.vo.Channel;
import kh.finalpj.zlack.chattest.model.vo.chattest;
import kh.finalpj.zlack.member.model.vo.Member;
import kh.finalpj.zlack.memberjointable.model.vo.MemberJointabel;
import kh.finalpj.zlack.worksapce.model.dao.WorkspaceDAO;
import kh.finalpj.zlack.worksapce.model.vo.Attachment;
import kh.finalpj.zlack.worksapce.model.vo.ChatRoom;

@Service
public class WorkspaceServiceImpl implements WorkspaceService{
	@Autowired
	private WorkspaceDAO workspacedao;

	@Override
	public List<Member> selectListDMList(String memberId) {
		return workspacedao.selectListDMList(memberId);
	}

	@Override
	public List<Member> SelectMemberList(String chatId) {

		return workspacedao.SelectMemberList(chatId);
	}

	@Override
	public void insertDMList(String memberId, String plusMember) {
		workspacedao.insertDMList(memberId,plusMember);
	}

	@Override
	public List<ChatRoom> selectChatRoomList(String memberId) {
		return workspacedao.selectChatRoomList(memberId);
	}

	@Override
	public void deletememberJointabel(String memberId) {
		workspacedao.deletememberJointabel(memberId);
	}

	@Override
	public void insertmemberJointabel(MemberJointabel mjt) {
		workspacedao.insertmemberJointabel(mjt);
	}

	@Override
	public void SeeMessage(MemberJointabel mjt) {
		workspacedao.SeeMessage(mjt);
	}

	@Override
	public List<chattest> selectchatlog(int chatroom) {
		return workspacedao.selectchatlog(chatroom);
	}

	@Override
	public List<Map<String, String>> selectById(String message) {
		return workspacedao.selectById(message);
	}

	@Override
	public void insertChatTest(chattest ct) {
		workspacedao.insertChatTest(ct);
		
	}

	@Override
	public void checkSee(int chatroom) {
		workspacedao.checkSee(chatroom);
	}

	@Override
	public String searchMember(String content) {
		return workspacedao.searchMember(content);
	}

	@Override
	public void insertWorkSpace(String wrokSpcaeName) {
		workspacedao.insertWorkSpace(wrokSpcaeName);	
	}

	@Override
	public List<Map<String, String>> selectPagedchatlog(int cPage, int numPerPage, int chatroom) {
		return workspacedao.selectPagedchatlog(cPage,numPerPage,chatroom);
	}

	@Override
	public List<Map<String, String>> selectChannelList(String memberId) {
		return workspacedao.selectChannelList(memberId);
	}

	@Override
	public List<Map<String, String>> selectChannelListJoinAble(String memberId) {
		return workspacedao.selectChannelListJoinAble(memberId);
	}

	@Override
	public void JoinChannel(Channel ch) {
		workspacedao.JoinChannel(ch);
	}

	@Override
	public String ExistNumber(String channelName) {
		return workspacedao.ExistNumber(channelName);
	}

	@Override
	public void JointoChannel(Channel ch) {
		workspacedao.JointoChannel(ch);		
	}

	@Override
	public void createChannel(String channelName) {
		// TODO Auto-generated method stub
		workspacedao.createChannel(channelName);
	}

	@Override
	public int selectCno(String channelName) {
		// TODO Auto-generated method stub
		return workspacedao.selectCno(channelName);
	}
	@Override
    public int insertFileUpload(HashMap<String, String> param, List<Attachment> attachList) {
        int result = 0;
        int chatRoomNo = 0;
        
        result = workspacedao.insertFileChat(param);
        chatRoomNo = Integer.parseInt(param.get("chatroom"));
        
        if(attachList.size()>0) {
            
            for(Attachment a: attachList) {
                a.setChatRoomNo(chatRoomNo);
                result = workspacedao.insertAttachment(a);
                
        
            }
        }
        return result;
    }

	@Override
	public List<Map<String, String>> selectAllChannel() {
		return workspacedao.selectAllChannel();
	}

	@Override
	public int insertMemo(HashMap<String, String> param) {
		return workspacedao.insertMemo(param);		
		
	}

	@Override
	public List<Map<String, String>> selectAllMemoList() {
		return workspacedao.selectAllMemoList();
	}

	@Override
	public List<Map<String, String>> selectMemoList(String memberId) {
		return workspacedao.selectMemoList(memberId);
	}

	@Override
	public void deleteMemo(String memoNo) {
		workspacedao.deleteMemo(memoNo);	
		
	}

	@Override
	public void updateMemo(HashMap<String, String> param) {
		workspacedao.updateMemo(param);	
		
	}

	@Override
	public String selectOneChannelName(int chatroom) {
		return workspacedao.selectOneChannelName(chatroom);
		
	}

	@Override
	public int deleteMessage(String chatNo) {
		return workspacedao.deleteMessage(chatNo);
	}

	@Override
	public void updateUseChannelAnalysis() {
		workspacedao.updateUseChannelAnalysis();

	}



}
