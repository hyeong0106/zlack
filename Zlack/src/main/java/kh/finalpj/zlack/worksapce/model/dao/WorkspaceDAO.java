package kh.finalpj.zlack.worksapce.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kh.finalpj.zlack.channel.model.vo.Channel;
import kh.finalpj.zlack.chattest.model.vo.chattest;
import kh.finalpj.zlack.member.model.vo.Member;
import kh.finalpj.zlack.memberjointable.model.vo.MemberJointabel;
import kh.finalpj.zlack.worksapce.model.vo.Attachment;
import kh.finalpj.zlack.worksapce.model.vo.ChatRoom;

public interface WorkspaceDAO {

	List<Member> selectListDMList(String memberId);

	List<Member> SelectMemberList(String chatId);

	void insertDMList(String memberId, String plusMember);

	List<ChatRoom> selectChatRoomList(String memberId);

	void deletememberJointabel(String memberId);

	void insertmemberJointabel(MemberJointabel mjt);

	void SeeMessage(MemberJointabel mjt);

	List<chattest> selectchatlog(int chatroom);

	List<Map<String, String>> selectById(String message);

	void insertChatTest(chattest ct);

	void checkSee(int chatroom);

	String searchMember(String content);

	void insertWorkSpace(String wrokSpcaeName);

	List<Map<String, String>> selectPagedchatlog(int cPage, int numPerPage, int chatroom);

	List<Map<String, String>> selectChannelList(String memberId);

	List<Map<String, String>> selectChannelListJoinAble(String memberId);

	void JoinChannel(Channel ch);

	String ExistNumber(String channelName);

	void JointoChannel(Channel ch);

	void createChannel(String channelName);

	int selectCno(String channelName);

	int insertFileChat(HashMap<String, String> param);

	int insertAttachment(Attachment a);

	List<Map<String, String>> selectAllChannel();

	int insertMemo(HashMap<String, String> param);

	List<Map<String, String>> selectAllMemoList();

	List<Map<String, String>> selectMemoList(String memberId);

	void deleteMemo(String memoNo);

	void updateMemo(HashMap<String, String> param);

	String selectOneChannelName(int chatroom);

	int deleteMessage(String chatNo);

	void updateUseChannelAnalysis();



}
