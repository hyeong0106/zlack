package kh.finalpj.zlack.worksapce.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import java.util.StringTokenizer;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import kh.finalpj.zlack.chattest.model.vo.chattest;
import kh.finalpj.zlack.worksapce.model.service.WorkspaceService;


@Component
public class EchoHandler extends TextWebSocketHandler {
	Logger logger = LoggerFactory.getLogger(EchoHandler.class);
	List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();

	@Autowired
	WorkspaceService workspaceservcie;

	// 클라이언트와 연결 이후에 실행되는 메서드
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessionList.add(session);
		logger.info("{} 연결됨", session.getId());
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		//client단 기본 websocket은 
		logger.info("{}로 부터 {} 받음", session.getId(), message.getPayload());
		
		
		String str = message.getPayload();
		System.out.println("EchoHandlerSTR"+str);
		StringTokenizer st = new StringTokenizer(str,"§");
		
		int chatroom = -1;
		chatroom= Integer.parseInt(st.nextToken());
		
		String memberId = st.nextToken();
		String content = st.nextToken();
		String CodeSnippet = "NONE";
		StringBuilder sb = new StringBuilder();
		if(st.hasMoreTokens()) {
			CodeSnippet = st.nextToken();
		}
		chattest ct = new chattest();
		int count = 1;
		
		if(CodeSnippet.equals("JAVA")) {
			content = "<table><tr><td>"+count+"</td><td>"+content;
			content = content.replaceAll("int", "<span style='color: blue;'>int</span> ");
			content = content.replaceAll("float", "<span style='color: blue;'>float</span> ");
			content = content.replaceAll("void", "<span style='color: blue;'>void</span> ");
			content = content.replaceAll("long", "<span style='color: blue;'>long</span> ");
			content = content.replaceAll("String", "<span style='color: blue;'>String</span> ");
			content = content.replaceAll("char", "<span style='color: blue;'>char</span> ");
			content = content.replaceAll("package", "<span style='color: cyan;'>package</span> ");
			
			content = content.replaceAll("\n", "</td></tr><tr><td>"+count+"</td><td>");
			
			content = content.replaceAll("package", "<span style='color: cyan;'>new</span> ");
			
			
			
			content = content.replaceAll("throws", "<span style='color: purple;'>throws</span> ");
			content = content.replaceAll("public", "<span style='color: purple;'>public</span> ");
			content = content.replaceAll("protect", "<span style='color: purple;'>protect</span> ");
			content = content.replaceAll("private", "<span style='color: purple;'>private</span> ");
			content = content.replaceAll("public", "<span style='color: purple;'>public</span> ");
			content = content.replaceAll("import", "<span style='color: purple;'>import</span> ");
			content = content.replaceAll("interface", "<span style='color: purple;'>interface</span> ");
			content = content.replaceAll("static", "<span style='color: purple;'>static</span> ");
			content = content.replaceAll("new", "<span style='color: purple;'>new</span> ");
			content = content.replaceAll("return", "<span style='color: purple;'>return</span> ");
			content = content.replaceAll("false", "<span style='color: purple;'>false</span> ");
			content = content.replaceAll("if", "<span style='color: purple;'>if</span> ");
			content = content.replaceAll("else", "<span style='color: purple;'>else</span> ");
			content = content.replaceAll("default", "<span style='color: purple;'>default</span> ");
			content = content.replaceAll("class", "<span style='color: purple;'>class</span> ");
			content = content.replaceAll("implements", "<span style='color: purple;'>implements</span> ");
			
			content = content.replaceAll("boolean","<span style='color: green;'>boolean</span> ");
			
			content = content +"</table>";
			int index=content.indexOf("<tr><td>1");
			
			while(index!=-1) {
				content = content.substring(0,content.indexOf("<tr><td>1"))+"<tr><td> "+(count)+content.substring(content.indexOf("<tr><td>1")+9,content.length());
				count++;
				index=content.indexOf("<tr><td>1");
			}
			sb.append(content);
			str=chatroom+"§"+memberId+"§"+content;
		}
		else if(CodeSnippet.equals("SQL")) {
			content = "<table><tr><td>"+count+"</td><td>"+content;
			content = content.replaceAll("\n", "</td></tr><tr><td>"+count+"</td><td>");
			
			content = content.replaceAll("create", "<span style='color: green;'>create</span> ");
			content = content.replaceAll("CREATE", "<span style='color: green;'>CREATE</span> ");
			content = content.replaceAll("REPLACE", "<span style='color: green;'>REPLACE</span> ");
			content = content.replaceAll("replace", "<span style='color: green;'>replace</span> ");
			content = content.replaceAll("WHERE", "<span style='color: green;'>WHERE</span> ");
			content = content.replaceAll("where", "<span style='color: green;'>where</span> ");
			content = content.replaceAll("GRANT", "<span style='color: green;'>GRANT</span> ");
			content = content.replaceAll("grant", "<span style='color: green;'>grant</span> ");
			content = content.replaceAll("ORDER BY", "<span style='color: green;'>ORDER BY</span> ");
			content = content.replaceAll("order by", "<span style='color: green;'>order by</span> ");
			content = content.replaceAll("from", "<span style='color: green;'>from</span> ");
			content = content.replaceAll("FROM", "<span style='color: green;'>FROM</span> ");
			
			content = content.replaceAll("INSERT INTO", "<span style='color: blue;'>INSERT INTO\"</span> ");
			content = content.replaceAll("insert into", "<span style='color: blue;'>insert into</span> ");
			content = content.replaceAll("ALTER", "<span style='color: blue;'>ALTER</span> ");
			content = content.replaceAll("alter", "<span style='color: blue;'>alter</span> ");
			
			content = content.replaceAll("VARCHAR2", "<span style='color: blue;'>VARCHAR2</span> ");
			content = content.replaceAll("varchar2", "<span style='color: blue;'>varchar2</span> ");
			content = content.replaceAll("SELECT", "<span style='color: blue;'>SELECT</span> ");
			content = content.replaceAll("select", "<span style='color: blue;'>select</span> ");
			content = content.replaceAll("NUMBER", "<span style='color: blue;'>NUMBER</span> ");
			content = content.replaceAll("number", "<span style='color: blue;'>number</span> ");
			content = content.replaceAll("UNIQUE", "<span style='color: blue;'>UNIQUE</span> ");
			content = content.replaceAll("unique", "<span style='color: blue;'>unique</span> ");
			content = content.replaceAll("TABLESPACE", "<span style='color: blue;'>TABLESPACE</span> ");
			content = content.replaceAll("tablespace", "<span style='color: blue;'>tablespace</span> ");
			content = content.replaceAll("values", "<span style='color: blue;'>values</span> ");
			content = content.replaceAll("VALUES", "<span style='color: blue;'>VALUES</span> ");
			content = content.replaceAll("DEFAULT", "<span style='color: blue;'>DEFAULT</span> ");
			content = content.replaceAll("default", "<span style='color: blue;'>default</span> ");
			content = content.replaceAll("COLUMN", "<span style='color: blue;'>COLUMN</span> ");
			content = content.replaceAll("column", "<span style='color: blue;'>column</span> ");
			content = content.replaceAll("DATE", "<span style='color: blue;'>DATE</span> ");
			content = content.replaceAll("date", "<span style='color: blue;'>date</span> ");
			content = content.replaceAll("SEQUENCE", "<span style='color: blue;'>SEQUENCE</span> ");
			content = content.replaceAll("sequence", "<span style='color: blue;'>sequence</span> ");
			content = content.replaceAll("commit", "<span style='color: blue;'>commit</span> ");
			content = content.replaceAll("COMMIT", "<span style='color: blue;'>COMMIT</span> ");
			content = content.replaceAll("ROLLBACK", "<span style='color: blue;'>ROLLBACK</span> ");
			content = content.replaceAll("rollback", "<span style='color: blue;'>rollback</span> ");
			content = content.replaceAll("NOCYCLE", "<span style='color: blue;'>NOCYCLE</span> ");
			content = content.replaceAll("nocycle", "<span style='color: blue;'>nocycle</span> ");
			content = content.replaceAll("RESOURCE", "<span style='color: blue;'>RESOURCE</span> ");
			content = content.replaceAll("resource", "<span style='color: blue;'>resource</span> ");
			content = content.replaceAll("PRIMARY", "<span style='color: blue;'>PRIMARY</span> ");
			content = content.replaceAll("primary", "<span style='color: blue;'>primary</span> ");
			content = content.replaceAll("CASCADE", "<span style='color: blue;'>CASCADE</span> ");
			content = content.replaceAll("cascade", "<span style='color: blue;'>cascade</span> ");
			content = content.replaceAll("FOREIGN", "<span style='color: blue;'>FOREIGN</span> ");
			content = content.replaceAll("foreign", "<span style='color: blue;'>foreign</span> ");
			content = content.replaceAll("COMMENT", "<span style='color: blue;'>COMMENT</span> ");
			content = content.replaceAll("comment", "<span style='color: blue;'>comment</span> ");
			content = content.replaceAll("trunc", "<span style='color: blue;'>trunc</span> ");
			content = content.replaceAll("TRUNC", "<span style='color: blue;'>TRUNC</span> ");
			content = content.replaceAll("when", "<span style='color: blue;'>when</span> ");
			content = content.replaceAll("WHEN", "<span style='color: blue;'>WHEN</span> ");
			content = content.replaceAll("group by", "<span style='color: blue;'>group by</span> ");
			content = content.replaceAll("GROUP BY", "<span style='color: blue;'>GROUP BY</span> ");
			content = content.replaceAll("extract", "<span style='color: blue;'>extract</span> ");
			content = content.replaceAll("EXTRACT", "<span style='color: blue;'>EXTRACT</span> ");
			
			
			
			
			
			
			content = content.replaceAll("DROP", "<span style='color: red;'>DROP</span> ");
			content = content.replaceAll("drop", "<span style='color: red;'>drop</span> ");
			content = content.replaceAll("REVOKE", "<span style='color: red;'>REVOKE</span> ");
			content = content.replaceAll("revoke", "<span style='color: red;'>revoke</span> ");
			content = content.replaceAll("DELETE", "<span style='color: red;'>DELETE</span> ");
			content = content.replaceAll("delete", "<span style='color: red;'>delete</span> ");
			
			content = content.replaceAll("TRIGGER", "<span style='color: gray;'>TRIGGER</span> ");
			content = content.replaceAll("triger", "<span style='color: gray;'>triger</span> ");
			
			
			
			content = content +"</table>";
			int index=content.indexOf("<tr><td>1");
			
			while(index!=-1) {
				content = content.substring(0,content.indexOf("<tr><td>1"))+"<tr><td> "+(count)+content.substring(content.indexOf("<tr><td>1")+9,content.length());
				count++;
				index=content.indexOf("<tr><td>1");
			}
			sb.append(content);
			System.out.println("content = "+content);
			str=chatroom+"§"+memberId+"§"+content;
		}
		if(content.length()>=5) {					
			if(content.substring(content.length()-4,content.length()).equals(".com") 
					&& content.substring(content.length()-5, content.length()-4).matches("[0-9|a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힝]*")) {
				if(content.contains("https://")) {					
					content="<a style='color: #4183C4; cursor: pointer;' href='"+content+"' target='_blank'>"+content+"</a>";
				}
				else {
					content="<a style='color: #4183C4; cursor: pointer;' href='https://"+content+"' target='_blank'>"+content+"</a>";
				}
				str=chatroom+"§"+memberId+"§"+content;
			}
		}
		//.kr
		if(content.length()>=4) {
			if(content.substring(content.length()-3,content.length()).equals(".kr") 
					&& content.substring(content.length()-4, content.length()-3).matches("[0-9|a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힝]*")) {
				if(content.contains("https://")) {					
					content="<a style='color: #4183C4; cursor: pointer;' href='"+content+"' target='_blank'>"+content+"</a>";
				}
				else {
					content="<a style='color: #4183C4; cursor: pointer;' href='https://"+content+"' target='_blank'>"+content+"</a>";
				}
				str=chatroom+"§"+memberId+"§"+content;
			}
		}
		//.org
		if(content.length()>=5) {					
			if(content.substring(content.length()-4,content.length()).equals(".org") 
					&& content.substring(content.length()-5, content.length()-4).matches("[0-9|a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힝]*")) {
				if(content.contains("https://")) {					
					content="<a style='color: #4183C4; cursor: pointer;' href='"+content+"' target='_blank'>"+content+"</a>";
				}
				else {
					content="<a style='color: #4183C4; cursor: pointer;' href='https://"+content+"' target='_blank'>"+content+"</a>";
				}
				str=chatroom+"§"+memberId+"§"+content;
			}
		}
		ct.setMemberId(memberId);
		ct.setChatRoomNo(chatroom);
		ct.setContent(content);
		
		//통계추가용
		workspaceservcie.updateUseChannelAnalysis();
		
		for (WebSocketSession sess : sessionList) {
			if(session.getId().equals(sess.getId())) {
				workspaceservcie.insertChatTest(ct);
				workspaceservcie.checkSee(chatroom);
			}
			sess.sendMessage(new TextMessage(str));
		}
	}
	// 클라이언트와 연결을 끊었을 때 실행되는 메소드
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionList.remove(session);
		 
		logger.info("{} 연결 끊김", session.getId());
	}
}