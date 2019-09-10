<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.3.0/sockjs.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
 <link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
<script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.js"></script>
<!-- 시맨틱 UI -->
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.css"/>
 <!----------------------------------------------->  
 
 <!--------------------JQuery--------------------------->
<style>
   body{	
   			font-family: 'Jua', sans-serif;
            margin: 0;
            color: white;
            font-size: 18px;
        }
        #client-ui{
            display: flex;
        }
        #leftDiv{
            width: 220px;
            background: #226aa7;
            height: 916px;
        }
        #workspaceName{
         	width: 220px;
        	background-color:#3584c7;
            height:66px;
        	text-align: center;
        }
        #workspaceName span{
           font-size: 13px;
    	   line-height: 1.375;
    	   color: #f0ff00;
    	   font-weight: 900;
    	   margin-left: 57px;
    	   position: absolute;
    	   top: 42px;
    	   left: 37px;
    	   cursor: pointer;
        }
         #workspaceName span *{
         color: white;
         font-size: 15px;
        }
        #workspaceName span i:hover{
         color: black;
        }
        ul>li{
            list-style: none;
            margin-left:-30px;
            color: #f0ff00;
        }
        #client_header{
            height: 70px;
        }
        #client_header h2{
            color: black;
            margin: 0;
            padding-left: 20px;
            padding-top: 10px;
        }
        #messageInputDiv{
            margin-left: 20px;
            margin-top: 10px;
        }
        #id-welcome{
        	font-family: 'Jua', sans-serif;
    		font-size: 13px;
    		position:relative;
    		bottom: 58px;
    		left: 28px;
    		
        }
         #workspaceName button{
            all: unset;
            margin-left: 7px;
          }
          
           #workspaceName button:hover{
           color: purple;
          }
         #workspaceName img{
         width: 55px;
    	 
         }
         #directMessages button{
         margin-left: -6px;
         width: 40px;
    	 height: 24px;
    	 background: transparent
    	 }
    	 #directMessages p{
    	 color: #f0ff00;
    	 display: inline;
    	 margin-left:10px;
    	 }
        #ch-list{
        color:white;
        margin-left:5px;
        }
        #ch-list:hover{
        color:#3596e8;
        }
        #circle{
        width:12px;
        margin-left:15px;
        }
        .DMList{
        padding-left: 30px;
        padding-top: 3px;
        }
        #userinfoDiv{
            position: absolute;
            width: 200px;
            height: 105px;
            top: 60px;
            left: 180px;
            background-color: white;
            border-radius: 5px;
            text-align: center;
            display: none;
            border: 1px solid gray;
            z-index: 2;
        }
        #userinfoDiv #oneDiv{
             width:100%;
             height: 33%;
             border-radius: 5px;
        }
        #userinfoDiv img{
            width: 20%;
            height: 100%;
            float: left;
        }
        #userinfoDiv label{
            font-size: 17px;
            font-weight: bold;
            float: right;
            text-align: center;
            width: 80%;
            height: 100%;
            color: black;
            padding: 0px;
            margin: 0px;
            padding-top:4px;
        }
         #userinfoDiv label:hover{
            background: purple;
            color: white;
         }
        #userinfoDiv #twoDiv{
             width:100%;
             height: 33%;
        }
           #userinfoDiv #threeDiv{
        width:100%;
        height: 33%;
        }
        #messageDiv *{
		 	color: black;
		}
		#plusBtn{
			all: unset;
			width: 60px;
			height: 60px;
			text-align: center;
			margin-left: 20px;
			border: 1px solid gray;
			font-size: 30px;
			font-weight: bold;
			border-radius: 5px;
			color: black;
		}
		 #memoDiv{
            height: 846px;
            width: 704px;
            margin-left: 20px;
         	overflow: auto;
         	word-wrap: break-word;
         	margin-top: 10px;
        }
        #messageInputDiv{
            margin-left: 20px;
            margin-top: 10px;
        }
		/* @멤버불러오기 */
        ul#autocomplete{
			min-width: 171px; 
			border: 1px solid gray;
			display: none;
			padding: 0;
			margin: 0;
			
		}
		ul#autocomplete li{
			padding: 0 10px;
			list-style: none;
			cursor: pointer;
		}
		ul#autocomplete li.sel{
			background: lightseagreen;
			color: white;
		}
		#channels p{
    	 color: #f0ff00;
    	 display: inline;
    	 margin-left:10px;
    	 }
    	 #channels button{
         margin-left: -6px;
         width: 40px;
    	 height: 24px;
    	 background: transparent
    	 }
    	 #channels a{
        padding-left: 30px;
        padding-top: 3px;
        color:white;
        margin-left:5px;
        }
        #channels a:hover{
        color:#3596e8;
        }
        #AllMemo{
        	text-align: left;
        }
        #personMemo{
        	text-align: left;
        }
        #AllTitle{
        	height: 65px;
        	color: black;
        	padding-top: 10px;
        }
        #AllTitle p{
        	font-size: 25px;
			font-weight: bold;
			text-align: center;
		    display: inline-block;
        }
        #personTitle{
        	height: 65px;
        	color: black;
        	padding-top: 10px;
        }
        #personTitle p{
        	font-size: 25px;
			font-weight: bold;
			text-align: center;
		    display: inline-block;
        }
        .demo-card-square.mdl-card {
		    width: 220px;
    		height: 230px;
		    display: inline-block;
	        overflow: auto;
	        background-color: #3584c73d;
		}
        .demo-card-square.mdl-card.admin {
		    background-color: #c74e353d;
		}
		.mdl-card__supporting-text{
        	line-height: 28px;
        }
        .mdl-button--fab.mdl-button--colored{
	    	background: rgb(63,81,181);
	    	margin-bottom: 7px;
		}
		.mdl-card__title-text{
			word-break:break-all;
		}
		 
        #userinfoDiv1{
            position: absolute;
            width: 200px;
            height: 75px;
            top: 60px;
            left: 180px;
            background-color: white;
            border-radius: 5px;
            text-align: center;
            display: none;
            border: 1px solid gray;
            z-index:2;
        }
        #userinfoDiv1 #oneDiv{
             width:100%;
             height: 50%;
             border-radius: 5px;
        }
        #userinfoDiv1 img{
            width: 20%;
            height: 100%;
            float: left;
        }
        #userinfoDiv1 label{
            font-size: 17px;
            font-weight: bold;
            float: right;
            text-align: center;
            width: 80%;
            height: 100%;
            color: black;
            padding: 0px;
            margin: 0px;
            padding-top:4px;
        }
         #userinfoDiv1 label:hover{
            background: purple;
            color: white;
         }
           #userinfoDiv1 #threeDiv{
        width:100%;
        height: 50%;
        }
        .mdl-card__title-text{
        	font-family: 'Jua', sans-serif;
        }
        .mdl-button.mdl-button--colored{
        	font-family: 'Jua', sans-serif;
        }
    </style>
<body>
    <div id="client-ui">
       <div id="leftDiv">
            <div id="workspaceName">
            <img class="ui medium circular image" src="${pageContext.request.contextPath }/resources/upload/profile/${memberLoggedIn.getImage()}">
            <h2 id="id-welcome">${memberLoggedIn.memberId}님 환영합니다</h2>
            <span onclick="homeClick();">kh M반<button class="ui button" onclick="myinfoBtn();"><i id="plusicon" class="ellipsis vertical icon"></i></button></span>
            
            </div>
            <div id="channels">
            	<p>Channels</p>
            	<button onclick="Create_Channel();" class="ui button"><i class="plus circle icon"></i></button><br />
            	<c:forEach items="${ChannelList}" var="m">
 					<a href="${pageContext.request.contextPath}/workspace/userchat.do?chatroom=${m.CHATROOMNO }&type=CH">${m.CHANNELNAME }</a> <br />
				</c:forEach>
                    
            </div>
            
            <div id="directMessages">
           		<p>Direct Messages</p>
                    <button onclick="plusDM();" class="ui button"><i class="plus circle icon"></i></button>
                    <c:forEach items="${ChatRoomList}" var="m">
					   <div class="DMList">#<a id="ch-list"href="${pageContext.request.contextPath}/workspace/userchat.do?chatroom=${m.getChatRoomNo() }">${m.getMemberId() }</a> </div>
				    </c:forEach>
            </div>
            
           <c:if test="${memberLoggedIn.memberId != 'admin'}">
	       <div id="userinfoDiv1">
	           <div id="oneDiv">
	           <img src="${pageContext.request.contextPath}/resources/images/내정보보기.png" alt="내정보보기이미지" />
	           <label onclick="goMyinfo();">내정보보기</label>
	           </div>
	           <div id="threeDiv">
	           <img src="${pageContext.request.contextPath}/resources/images/logout.png" alt="로그아웃" />
	           <label onclick="logout();">로그아웃</label>
	           </div>
	       </div>
	       </c:if>
	         <c:if test="${memberLoggedIn.memberId == 'admin'}">
	       <div id="userinfoDiv">
	           <div id="oneDiv">
	           <img src="${pageContext.request.contextPath}/resources/images/내정보보기.png" alt="내정보보기이미지" />
	           <label onclick="goMyinfo();">내정보보기</label>
	           </div>
	           <div id="twoDiv">
	           <img src="${pageContext.request.contextPath}/resources/images/통계.png" alt="통계이미지" />
	           <label onclick="goAnalysis();">통계</label>
	           </div>
	           <div id="threeDiv">
	           <img src="${pageContext.request.contextPath}/resources/images/logout.png" alt="로그아웃" />
	           <label onclick="logout();">로그아웃</label>
	           </div>
	       </div>
	       </c:if>
       </div>
       <div id="rightDiv">
            <div id="memoDiv">
            	<div id="AllMemo">
            		<div id="AllTitle">
            			<p>전체공지</p>
            			<label id="memoTitle" hidden></label>
   						<label id="memoContent" hidden></label>
            			<c:if test="${memberLoggedIn.memberId=='admin'}">
	            			<button type="submit" class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab mdl-button--colored" id="addBtn" onclick="AddMemo();">
								<i class="material-icons">add</i>
							</button>
						</c:if>
					</div>
					<c:forEach items="${AllMemoList}" var="m">
					  	 <!--  -->
		            	<div class="demo-card-square mdl-card mdl-shadow--2dp admin">
						  <div class="mdl-card__title mdl-card--expand">
						    <h2 class="mdl-card__title-text">${m.MEMOTITLE }</h2>
						  </div>
						  <div class="mdl-card__supporting-text">
						    ${m.MEMOCONTENT }
						  </div>
						  <c:if test="${memberLoggedIn.memberId=='admin'}">
							  <div class="mdl-card__actions mdl-card--border">
							    <button class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" onclick="DeleteMemo(${m.MEMONO });">
							      	삭제
							    </button>
							    <button class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" onclick="UpdateMemo(${m.MEMONO },'${m.MEMOTITLE }','${m.MEMOCONTENT }');">
							      	수정
							    </button>
							  </div>
						  </c:if>
						</div>
				    </c:forEach>
				</div><!--end allmemo  -->
				<c:if test="${memberLoggedIn.memberId!='admin'}">
					<div id="personMemo">
						<div id="personTitle">
							<p>개인메모</p>
							<button type="submit" class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab mdl-button--colored" id="addBtn" onclick="AddMemo();">
								<i class="material-icons">add</i>
							</button>
						</div>
						<c:forEach items="${MemoList}" var="m">
						  	 <!--  -->
			            	<div class="demo-card-square mdl-card mdl-shadow--2dp">
							  <div class="mdl-card__title mdl-card--expand">
							    <h2 class="mdl-card__title-text">${m.MEMOTITLE }</h2>
							  </div>
							  <div class="mdl-card__supporting-text">
							    ${m.MEMOCONTENT }
							  </div>
							  <div class="mdl-card__actions mdl-card--border">
							    <button class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" onclick="DeleteMemo(${m.MEMONO });">
							      	삭제
							    </button>
							    <button class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" onclick="UpdateMemo(${m.MEMONO },'${m.MEMOTITLE }','${m.MEMOCONTENT }');">
							      	수정
							    </button>
							  </div>
							</div>
					    </c:forEach>
					</div><!--end personMemo  -->
				</c:if>
            </div><!--end memoDiv  -->
          
       </div>
    </div>
</body>
</html>
<script type="text/javascript">
     history.replaceState({}, null, location.pathname);
</script>
<script>
$(function(){
	
});
function plusDM(){
	location.href = "${pageContext.request.contextPath}/workspace/plusDM.do";
}
function myinfoBtn(){
	<c:if test="${memberLoggedIn.memberId == 'admin'}">
    $("#userinfoDiv").toggle();
    </c:if>
    <c:if test="${memberLoggedIn.memberId != 'admin'}">
    $("#userinfoDiv1").toggle();
    </c:if>
}
function logout(){
	location.href = "${pageContext.request.contextPath}/member/logout.do";
}
function goMyinfo(){
	location.href = "${pageContext.request.contextPath}/member/memberView.do";
}
function goAnalysis(){
	location.href = "${pageContext.request.contextPath}/analysis/analysisForm.do";
	
}
function Create_Channel(){
	location.href = "${pageContext.request.contextPath}/workspace/createChannel.do"
}

function AddMemo(){
	var popupX = (window.screen.width / 2) - 150;
    var popupY= (window.screen.height / 2) - 135;
    
    //팝업생성
	var url = "${pageContext.request.contextPath}/workspace/AddMemo.do";
	var title ="메모 등록";
	var specs = "width=350px, height=410px, left="+popupX+", top="+popupY;
	
	var popup = open(url,title,specs);//팝업의 최상위 윈도우객체를 리턴함.
	var interval = window.setInterval(function() {
	      try {
	          if (popup == null || popup.closed) {
	          	window.clearInterval(interval);
	          	var memoTitle = ($("#memoTitle").val());
	          	var memoContent = ($("#memoContent").val());
	          	
	          	if(memoContent == "" || memoTitle == ""){		
	          	}
	          	else{
	          		location.href="${pageContext.request.contextPath}/workspace/AddMemoEnd.do?memoTitle="+memoTitle+"&memoContent="+memoContent;
	          		
	          	}
	     	 }
	      }
	      catch (e) {
	      }	
	  }, 1000); 
   
}
function DeleteMemo(memoNo){
	location.href="${pageContext.request.contextPath}/workspace/DeleteMemo.do?memoNo="+memoNo;
}
function UpdateMemo(memoNo,memoTitle,memoContent){
	var popupX = (window.screen.width / 2) - 150;
    var popupY= (window.screen.height / 2) - 135;
    
    //팝업생성
	var url = "${pageContext.request.contextPath}/workspace/UpdateMemo.do?memoNo="+memoNo+"&memoTitle="+memoTitle+"&memoContent="+memoContent;
	var title ="메모 등록";
	var specs = "width=350px, height=410px, left="+popupX+", top="+popupY;
	
	var popup = open(url,title,specs);//팝업의 최상위 윈도우객체를 리턴함.
	var interval = window.setInterval(function() {
	      try {
	          if (popup == null || popup.closed) {
	          	window.clearInterval(interval);
	          	var memoTitle = ($("#memoTitle").val());
	          	var memoContent = ($("#memoContent").val());
	          	
	          	if(memoContent == "" || memoTitle == ""){		
	          	}
	          	else{
	          		location.href="${pageContext.request.contextPath}/workspace/UpdateMemoEnd.do?memoNo="+memoNo+"&memoTitle="+memoTitle+"&memoContent="+memoContent;
	          		
	          	}
	     	 }
	      }
	      catch (e) {
	      }
	  }, 1000); 
   
}
function homeClick(){
	location.href="${pageContext.request.contextPath}/workspace/WorkSpaceMain.do?";
}
</script>