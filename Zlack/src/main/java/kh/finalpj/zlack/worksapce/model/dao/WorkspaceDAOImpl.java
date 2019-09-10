package kh.finalpj.zlack.worksapce.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalpj.zlack.channel.model.vo.Channel;
import kh.finalpj.zlack.chattest.model.vo.chattest;
import kh.finalpj.zlack.member.model.vo.Member;
import kh.finalpj.zlack.memberjointable.model.vo.MemberJointabel;
import kh.finalpj.zlack.worksapce.model.vo.Attachment;
import kh.finalpj.zlack.worksapce.model.vo.ChatRoom;

@Repository
public class WorkspaceDAOImpl implements WorkspaceDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<Member> selectListDMList(String memberId) {
		return sqlSession.selectList("workspace.SelectDMMemberList",memberId);
	}

	@Override
	public List<Member> SelectMemberList(String chatId) {
		return sqlSession.selectList("workspace.SelectMemberList",chatId);
	}

	@Override
	public void insertDMList(String memberId, String plusMember) {
		sqlSession.insert("workspace.InsertDMMemberList", memberId);
		System.out.println(memberId);
		sqlSession.insert("workspace.InsertDMMemberList2", plusMember);
		System.out.println(plusMember);
	}

	@Override
	public List<ChatRoom> selectChatRoomList(String memberId) {
		return sqlSession.selectList("workspace.selectChatRoomList",memberId);
	}
	
	@Override
	public void deletememberJointabel(String memberId) {
		sqlSession.delete("workspace.deletememberJointabel",memberId);
	}

	@Override
	public void insertmemberJointabel(MemberJointabel mjt) {
		sqlSession.insert("workspace.insertmemberJointabel",mjt);
		
	}

	@Override
	public void SeeMessage(MemberJointabel mjt) {
		sqlSession.update("workspace.SeeMessage", mjt);
	}


	@Override
	public List<chattest> selectchatlog(int chatroom) {
		return sqlSession.selectList("workspace.selectchatlog",chatroom);
		
	}

	@Override
	public List<Map<String, String>> selectById(String message) {
		return sqlSession.selectList("workspace.selectById",message);
	}

	@Override
	public void insertChatTest(chattest ct) {
		sqlSession.insert("workspace.insertChatTest", ct);
	}

	@Override
	public void checkSee(int chatroom) {
		sqlSession.update("workspace.checkSee",chatroom);		
	}

	@Override
	public String searchMember(String content) {
		return sqlSession.selectOne("workspace.searchMember",content);
	}

	@Override
	public void insertWorkSpace(String wrokSpcaeName) {
		sqlSession.insert("workspace.InsertwrokSpcaeName",wrokSpcaeName);
	}

	@Override
	public List<Map<String, String>> selectPagedchatlog(int cPage, int numPerPage, int chatroom) {
		RowBounds rowBounds = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("workspace.selectPagedchatlog",chatroom,rowBounds);
	}

	@Override
	public List<Map<String, String>> selectChannelList(String memberId) {
		return sqlSession.selectList("workspace.selectChannelList", memberId);
	}

	@Override
	public List<Map<String, String>> selectChannelListJoinAble(String memberId) {
		return sqlSession.selectList("workspace.selectChannelListJoinAble", memberId);
	}

	@Override
	public void JoinChannel(Channel ch) {
		sqlSession.insert("workspace.JoinChannel",ch);		
	}

	@Override
	public String ExistNumber(String channelName) {
		return sqlSession.selectOne("workspace.ExistNumber",channelName);
	}

	@Override
	public void JointoChannel(Channel ch) {
		sqlSession.insert("workspace.JointoChannel",ch);
	}

	@Override
	public void createChannel(String channelName) {
		sqlSession.insert("workspace.createChannel",channelName);
	}

	@Override
	public int selectCno(String channelName) {
		return sqlSession.selectOne("workspace.selectCno",channelName);
	}
	@Override
    public int insertFileChat(HashMap<String, String> param) {
        return sqlSession.insert("workspace.insertFileChat", param);
    }
    @Override
    public int insertAttachment(Attachment a) {
        return sqlSession.insert("workspace.insertAttachment", a);
    }

	@Override
	public List<Map<String, String>> selectAllChannel() {
		return sqlSession.selectList("workspace.selectAllChannel");
	}

	@Override
	public int insertMemo(HashMap<String, String> param) {
		return sqlSession.insert("workspace.insertMemo",param);
		
	}

	@Override
	public List<Map<String, String>> selectAllMemoList() {
		return sqlSession.selectList("workspace.selectAllMemoList");
	}

	@Override
	public List<Map<String, String>> selectMemoList(String memberId) {
		return sqlSession.selectList("workspace.selectMemoList",memberId);
	}

	@Override
	public void deleteMemo(String memoNo) {
		sqlSession.delete("workspace.deleteMemo",memoNo);
		
	}

	@Override
	public void updateMemo(HashMap<String, String> param) {
		sqlSession.update("workspace.updateMemo",param);
		
	}

	@Override
	public String selectOneChannelName(int chatroom) {
		return sqlSession.selectOne("workspace.selectOneChannelName", chatroom);
	}

	@Override
	public int deleteMessage(String chatNo) {
		return sqlSession.delete("workspace.deleteMessage", chatNo);
	}

	@Override
	public void updateUseChannelAnalysis() {
		sqlSession.update("workspace.updateUseChannelAnalysis");
		
	}


}
