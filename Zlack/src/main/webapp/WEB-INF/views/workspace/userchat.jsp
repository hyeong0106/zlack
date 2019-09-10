<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.3.0/sockjs.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.js"></script>
<!-- 시맨틱 UI -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.css"/>
 <link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
<!----------------------------------------------->  
 <style>
        body{
        	font-family: 'Jua', sans-serif;
            margin: 0;
            color: white;
            font-size: 18px;
        }
        .form-control{
        	font-family: 'Jua', sans-serif;
        }
        .btn-outline-secondary{
        	font-family: 'Jua', sans-serif;
        }
        #client-ui{
            display: flex;
        }
        #client-ui > #leftDiv{
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
    	   top: 22px;
    	   left: 37px;
    	   cursor: pointer;
        }
        #channels{
        margin-top: 18px;
        }
         #workspaceName span *{
         color: white;
         font-size: 15px;
        }
        #workspaceName span i:hover{
         color: black;
        }
        #leftDiv ul>li{
            list-style: none;
		    margin-left: -30px;
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
          #messageDiv{
           border: 1px solid black;
            height: 780px;
            width: 704px;
            margin-left: 20px;
         	overflow: auto;
         	word-wrap: break-word;
        }
        
        #messageDiv li button{
        	all: unset;
        	color: gray;
        	width:25px;
        	height: 25px;
        	float: right;
        }
        #messageInputDiv{
            margin-left: 20px;
            margin-top: 10px;
        }
          #workspaceName button{
            all: unset;
            margin-left: 7px;
          }
            #workspaceName button:hover{
           color: purple;
          }
        /* @멤버불러오기 */
        ul#autocomplete{
			min-width: 171px; 
			border: 1px solid gray;
			display: none;
			padding: 0;
			margin: 0;
			overflow: auto;
			height: 62px;
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
            font-size: 27px;
            border-top-left-radius: 5px;
            border-bottom-left-radius: 5px;
            color:black;        
        }
        
       #plusBtn:hover{
           color:white;
           background: #226aa7;
           font-size: 35px;
       }
       #sendBtn:hover{
           color:white;
           background: #226aa7;
       }
		#fileDiv{
            position: absolute;
            width: 260px;
            height: 105px;
            top: 742px;
            left: 243px;
            background-color: white;
            border-radius: 5px;
            text-align: center;
            display: none;
            border: 1px solid gray;
        }
        #fileDiv #leftDiv{
             width:100%;
             height: 50%;
             border-radius: 5px;
        }
        #fileDiv img{
            width: 20%;
            height: 100%;
            float: left;
        }
        #fileDiv label{
            font-size: 20px;
            font-weight: bold;
            float: right;
            text-align: center;
            width: 80%;
            height: 100%;
            color: black;
            padding: 0px;
            margin: 0px;
            padding-top:10px;
        }
         #fileDiv label:hover{
            background: purple;
            color: white;
         }
        #fileDiv #rightDiv{
             width:100%;
             height: 50%;
        }
		/*사용자 입력값 하이라이트처리*/
		span.srchval{color:red;}
		
		#id-welcome{
    		font-size: 13px;
    		position:relative;
    		bottom: 58px;
    		left: 28px;
    		font-family: 'Jua', sans-serif;
    		
	}
        #rightDiv *{
        color: black;
        }
         #workspaceName button{
            all: unset;
            margin-left: 7px;
          }
          
       #workspaceName img{
        width: 55px;
    	top: 10px;
    	left: 10px;
    	background-color: #e4e4e4;
    	position: relative;
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
    	 margin-left: 10px;
    	 }
    	 #directMessages{
    	  margin-top: 2px;
    	 }
    	 #plusicon{
    	 margin-top: 20px;
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
		/*사용자 입력값 하이라이트처리*/
		span.srchval{color:red;}
		#fileuploadDiv{
           position: absolute;
           width: 260px;
           height: 105px;
           top: 742px;
           left: 243px;
           background-color: white;
           border-radius: 5px;
           text-align: center;
           display: none;
           border: 1px solid gray;
              z-index: 2;
       }
       #fileuploadDiv #leftDiv{
            width:100%;
            height: 50%;
            border-radius: 5px;
       }
       #fileuploadDiv img{
           width: 20%;
           height: 100%;
           float: left;
       }
       #fileuploadDiv label{
           font-size: 20px;
           font-weight: bold;
           float: right;
           text-align: center;
           width: 80%;
           height: 100%;
           color: black;
           padding: 0px;
           margin: 0px;
           padding-top:10px;
       }
        #fileuploadDiv label:hover{
           background: purple;
           color: white;
        }
       #fileuploadDiv #rightDiv{
            width:100%;
            height: 50%;
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
        .outputFile img{
              width: 100px;
              height: 100px;
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
            z-index:2;
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
        #imgForm{
           width: 250px;
           height: 300px;
       }
        #imgForm *{
           text-align: center;
       }
       #imgForm img{
             width: 250px;
             height: 250px;
        }
        #imgForm div{
            width: 250px;
            height: 50px;
        }
        #imgForm div span:hover{
            border-bottom: 1px solid #226aa7;
            color: 226aa7;
            font-size: 20px;
        }
        #imgForm div{
            width: 250px;
            height: 50px;
        }
       #zipForm{
           width: 665px;
           height: 75px;
           border: 3px dashed lightgray;
       }
       #zipForm img{
           width: 65px;
           height: 65px;
           margin-top: 2px;
           margin-left :2px;
       }
       #zipForm div{
           display: inline-block;
           margin-left: 20px;
       }
       #zipForm div span:hover{
            border-bottom: 1px solid #226aa7;
            color: 226aa7;
            font-size: 20px;
        }
        #messageDiv li:hover{
            background: #f8f8f8;
        }
        #fileuploadDiv label:hover{
          background: #226aa7;
          color: white;
       }
		#userinfoDiv label:hover{
           background: #226aa7;
           color: white;
        }
        #messageDiv li tr td:FIRST-CHILD{
        	border-right: 1px solid gray;
        	user-select: none;
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
        #fileuploadDiv label:hover{
          background: #226aa7;
          color: white;
       }
		#userinfoDiv label:hover{
           background: #226aa7;
           color: white;
        }
    </style>
<body>
   <div id="client-ui">
       <div id="leftDiv">
            <div id="workspaceName">
            <img class="ui medium circular image" onclick="homeClick();" src="${pageContext.request.contextPath }/resources/upload/profile/${memberLoggedIn.getImage()}">
            <h2 id="id-welcome">${memberLoggedIn.memberId}님 환영합니다</h2>
            <span onclick="homeClick();">kh M반<button class="ui button" onclick="myinfoBtn();"><i id="plusicon" class="ellipsis vertical icon"></i></button></span>
           
            </div>
            <div id="channels">
              <p>Channels</p>
              <button onclick="Create_Channel();" class="ui button"><i class="plus circle icon"></i></button><br />
              <c:forEach items="${ChannelList}" var="m">
                   <a class="${m.CHATROOMNO }" href="${pageContext.request.contextPath}/workspace/userchat.do?chatroom=${m.CHATROOMNO }&type=CH">${m.CHANNELNAME }</a><c:if test="${m.NOREAD}>0">New</c:if> <br />
               </c:forEach>
          </div>
          <div id="directMessages">
                 <p>Direct Messages</p>
                  <button onclick="plusDM();" class="ui button"><i class="plus circle icon"></i></button>
                      <c:forEach items="${ChatRoomList}" var="m">
                      <div class="DMList">#<a class="${m.getChatRoomNo() }" id="ch-list" href="${pageContext.request.contextPath}/workspace/userchat.do?chatroom=${m.getChatRoomNo() }">${m.getMemberId() } <c:if test="${m.getNoRead()}>0">New</c:if></a> </div>
                   </c:forEach>
          </div>
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
	      <div id="rightDiv">
            <div id="client_header">
                <h2>#${DirectTitle }</h2>
            </div>
            <div id="messageDiv">
            	<ul class="list-group list-group-flush" id="data">
				<c:forEach items="${chatList}" var="m">
                <c:choose>
                    <c:when test='${fn:contains(m.CONTENT,"spring_server")}'>
                        <c:if test="${fn:substring(m.CONTENT,fn:length(m.CONTENT)-3,fn:length(m.CONTENT)) == 'zip'}">
                        <li class="messageDiv list-group-item outputFile" <c:if test="${memberLoggedIn.memberId == 'admin' || memberLoggedIn.memberId == m.MEMBERID}"> onmouseenter="enterLi(this);" </c:if> onmouseleave="leaveLi(this);" id="${m.CHATNO}" >${m.MEMBERID} : <div id="zipForm"><img src="${pageContext.request.contextPath}/resources/images/압축파일.jpg" /><div onclick="fileDownload('${fn:substring(m.CONTENT,71,fn:length(m.CONTENT))}');"><span>${fn:substring(m.CONTENT,71,fn:length(m.CONTENT))}</span></div></div><button hidden="hidden" onclick="deleteMessage3(this);" id="${m.CHATROOMNO}">x</button></li>
                        </c:if>
                        <c:if test="${fn:substring(m.CONTENT,fn:length(m.CONTENT)-3,fn:length(m.CONTENT)) == 'jpg' ||
                        			fn:substring(m.CONTENT,fn:length(m.CONTENT)-3,fn:length(m.CONTENT)) == 'JPG' ||
                        			fn:substring(m.CONTENT,fn:length(m.CONTENT)-3,fn:length(m.CONTENT)) == 'PNG' ||
                        			fn:substring(m.CONTENT,fn:length(m.CONTENT)-3,fn:length(m.CONTENT)) == 'png' ||
                        			fn:substring(m.CONTENT,fn:length(m.CONTENT)-3,fn:length(m.CONTENT)) == 'gif'}">
                        <li class="messageDiv list-group-item outputFile" <c:if test="${memberLoggedIn.memberId == 'admin' || memberLoggedIn.memberId == m.MEMBERID}"> onmouseenter="enterLi(this);" </c:if> onmouseleave="leaveLi(this);" id="${m.CHATNO}" >${m.MEMBERID} : <div id="imgForm"><img src="${pageContext.request.contextPath}/resources/upload/file/${fn:substring(m.CONTENT,71,fn:length(m.CONTENT))}" /><br /><div onclick="fileDownload('${fn:substring(m.CONTENT,71,fn:length(m.CONTENT))}');"><span>${fn:substring(m.CONTENT,71,fn:length(m.CONTENT))}</span></div></div><button hidden="hidden" onclick="deleteMessage2(this);" id="${m.CHATROOMNO}">x</button></li>
                        </c:if>
                          <c:if test="${fn:substring(m.CONTENT,fn:length(m.CONTENT)-3,fn:length(m.CONTENT)) != 'jpg' &&
                        			fn:substring(m.CONTENT,fn:length(m.CONTENT)-3,fn:length(m.CONTENT)) != 'JPG' &&
                        			fn:substring(m.CONTENT,fn:length(m.CONTENT)-3,fn:length(m.CONTENT)) != 'PNG' &&
                        			fn:substring(m.CONTENT,fn:length(m.CONTENT)-3,fn:length(m.CONTENT)) != 'png' &&
                        			fn:substring(m.CONTENT,fn:length(m.CONTENT)-3,fn:length(m.CONTENT)) != 'gif' &&
                        			fn:substring(m.CONTENT,fn:length(m.CONTENT)-3,fn:length(m.CONTENT)) != 'zip'}">
                        <li class="messageDiv list-group-item outputFile" <c:if test="${memberLoggedIn.memberId == 'admin' || memberLoggedIn.memberId == m.MEMBERID}"> onmouseenter="enterLi(this);" </c:if> onmouseleave="leaveLi(this);" id="${m.CHATNO}" >${m.MEMBERID} : <div id="imgForm"><img src="${pageContext.request.contextPath}/resources/images/파일.png" /><br /><div onclick="fileDownload('${fn:substring(m.CONTENT,71,fn:length(m.CONTENT))}');"><span>${fn:substring(m.CONTENT,71,fn:length(m.CONTENT))}</span></div></div><button hidden="hidden" onclick="deleteMessage2(this);" id="${m.CHATROOMNO}">x</button></li>
                         </c:if>
                    </c:when>
                     <c:otherwise>
                        <li class="messageDiv list-group-item" <c:if test="${memberLoggedIn.memberId == 'admin' || memberLoggedIn.memberId == m.MEMBERID}"> onmouseenter="enterLi(this);" </c:if> onmouseleave="leaveLi(this);" id="${m.CHATNO}">${m.MEMBERID} : ${m.CONTENT} <button hidden="hidden" onclick="deleteMessage(this);" id="${m.CHATROOMNO}">x</button></li>
                    </c:otherwise>
                </c:choose>
                </c:forEach>
				</ul>
				 
        	</div>
            <div class="input-group mb-3">
            	<button id="plusBtn" onclick="plusBtnClick();"><label>+</label></button>
				<textarea id="message" class="form-control" placeholder="Message" style="resize: none;"></textarea>
			  	<ul id="autocomplete">
					<li class="sel">입력하세요</li>
			  	</ul>
			  	<div class="input-group-append" style="padding: 0px;">
			    	<button id="sendBtn" class="btn btn-outline-secondary" type="button">Send</button>
			  	</div>
			</div>
			<input type="checkbox" name="CodeSnippet" id="CodeSnippet" value="CodeSnippet" hidden>CodeSnippet
			<label id="codeTitle" hidden></label>
   			<label id="codeContent" hidden></label>
   			<label id="codeType" hidden value="none"></label>
			<div id="fileuploadDiv">
              <div id="leftDiv">
              <img src="${pageContext.request.contextPath}/resources/images/코드.jpg" alt="내정보보기이미지" />
              <label onclick="codeSnippet();">코드 미리보기</label>
              </div>
               <form name="FileUploadFrm" id="FileUploadFrm" action="${pageContext.request.contextPath}/workspace/FileUploadEnd.do" method="post" enctype="multipart/form-data">
                   <div id="rightDiv">
                   <img src="${pageContext.request.contextPath}/resources/images/첨부파일.jpg" alt="통계이미지" />
                   <label onclick="goFileUpload();">파일업로드</label>
                   <input type="file" id="upFile" name="upFile" onchange="upfileChange();" hidden/>
                   <input type="text" name="chatroom" value="${chatroom}" hidden/>
                   <input type="text" name="memberId" value="${memberLoggedIn.memberId}"  hidden/>
                   </div>
               </form>
          </div>
       </div>
    </div>
</body>
</html>
<script type="text/javascript">
     history.replaceState({}, null, location.pathname);
</script>
<script>
$(function(){
	$("#message").keyup(function(e){
		var message = $("#message").val();
		//사용자입력값이 공백인 경우, ajax요청하지 않는다.
		if(message.length == 0){
			$("#autocomplete").hide();			
			return;
		}
		
		var $sel = $(".sel");
		var $li = $("#autocomplete li");
		
		//사용자 입력값이 ArrowUp인 경우
		if(e.key == 'ArrowUp'){
			
		}
		//사용자 입력값이 ArrowDown인 경우
		else if(e.key == 'ArrowDown'){
			
			
		}
		else if(e.key == 'ArrowRight'){
			
		}
		else if(e.key == 'ArrowLeft'){
			
		}
		/* 
		//사용자 입력값이 Enter인 경우
		else if(e.key == 'Enter'){
			$(this).val($sel.text());
			$("#autocomplete").hide()
							  .children()
							  .remove();
			alert("살렸따?");
			sendMessage();
	        $('#message').val('');
		} */
		//그외(ajax요청) if(message.substring(0,1)=='@')
		else {
			$.ajax({
				url: "<%=request.getContextPath()%>/message/sendMessageAjax",
				data: "message="+message,//파라미터직렬화
				success: function(data){
					console.log(data);
					
					//넘어온 csv데이터가, 공백인경우
					if(data.trim().length == 0){
						$("#autocomplete").hide();
					}
					else {
						
						var nameArr = data.split(",");
						var html = "";
						for(var i=0; i<nameArr.length; i++){
							html += "<li>"+nameArr[i].replace(message,"<span class='srchval'>"+message+"</span>")+"</li>";
						}
						$("#autocomplete").html(html).fadeIn(300);
					
					}
				}
			});//end of ajax
		}
		
	});//end of $("#message").keyup
	
	$("#autocomplete").on("click","li", function(){
		//클릭이벤트가 일어난 li태그의 text를 input태그에 입력
		$("#message").val($(this).text());
		$("#autocomplete").hide()
						  .children()
						  .remove();
		location.href = "${pageContext.request.contextPath}/workspace/moveDM.do?memberId="+$(this).text();
		
	});
	
	$("#autocomplete").on("mouseover","li",function(){
		$(this).siblings().removeClass("sel");
		$(this).addClass("sel");
	});
	
	$("#autocomplete").on("mouseout","li",function(){
		$(this).removeClass("sel");	
	});

});
function plusDM(){
	location.href = "${pageContext.request.contextPath}/workspace/plusDM.do";
}
</script>
<script type="text/javascript">

$(function(){
	cPage=1;
	chatroom=${chatroom};
	getPost("cPage"+cPage);	
});

$("#messageDiv").scroll(function() {
    if ($("#messageDiv").scrollTop() == 0) {
      console.log("스크롤최상단");
      getPost(cPage+=1);
      console.log(cPage);
    }
    
});

function getPost(cPage){
	var param={
			cPage: cPage,
			chatroom: chatroom
	}
	$.ajax({
		url:"<%=request.getContextPath()%>/workspace/pagedMessageAjax",
		data: param,
		type: "post",
		success : function(data){
			//넘어온 csv데이터가, 공백인경우
			if(data.trim().length == 0){
				$("#autocomplete").hide();
			}
			else {
				console.log("data"+data);
				var nameArr = data.split(",");
				var html = "";
				for(var i=nameArr.length-1; i>0; i--){
					 html += "<li class=\"list-group-item\">"+nameArr[i]+ "</li>";
				}
				html += $("#data").html()
				$("#data").html(html);
			
			}

		} 
	});
}


$(document).ready(function() {
    $("#sendBtn").click(function() {
            sendMessage();
            $('#message').val('')
    });
});

$(function() {
	  $('textarea').on('keydown', function(event) {
	      if (event.keyCode == 13)
	          if (!event.shiftKey){
	             event.preventDefault();
	             $('textarea').empty()
	             sendMessage();
	             $('#message').val('')
	          }
	  });
});
$("#messageDiv").scrollTop(5000000);
// 웹소켓을 지정한 url로 연결한다.
//let sock = new SockJS("<c:url value="/echo"/>");
let sock = new SockJS("http://"+window.location.host+"${pageContext.request.contextPath}/echo");
sock.onopen = onOpen;
sock.onmessage = onMessage;
sock.onclose = onClose;

// 웹소켓 연결성공후
function onOpen(){
	console.log('websocket opened');
}
// 서버로부터 메시지를 받았을 때
function onMessage(msg) {
    var data = msg.data;
    var sp = msg.data.split('§');
    if(${chatroom}==sp[0]){
        $("#data").append("<li class=\"list-group-item\">"+sp[1]+" : "+sp[2].replace(/\n/g, '<br />')+ "</li>");
        $("#messageDiv").scrollTop(5000000);
    }
    else{
       <c:forEach items="${ChannelList}" var="m">
           if(${m.CHATROOMNO}==sp[0] && ${chatroom}!=sp[0]){
               $(".${m.CHATROOMNO}").html("${m.CHANNELNAME }"+" New");
           }
     </c:forEach>
       <c:forEach items="${ChatRoomList}" var="m">
           if(${m.getChatRoomNo()}==sp[0] && ${chatroom}!=sp[0]){
               $(".${m.getChatRoomNo()}").html("${m.getMemberId() }"+" New");
           }
     </c:forEach>
    }
}
// 서버와 연결을 끊었을 때
function onClose(evt) {
       $("#data").append("연결 끊김");
}
//메시지 전송
function sendMessage() {
    if($("#message").val() != ""){
        sock.send('${chatroom}§'+'${memberLoggedIn.memberId}§'+$("#message").val()+'§'+$("#codeType").val()+'§'+$("#codeType").val());
        $('#message').val('');
        $("#codeType").val('');
   }
}
function logout(){
	location.href = "${pageContext.request.contextPath}/member/logout.do";
}

function Create_Channel(){
	location.href = "${pageContext.request.contextPath}/workspace/createChannel.do"
}
function plusBtnClick(){
   $("#fileuploadDiv").toggle();
}
function goFileUpload(){
    $("#upFile").click();
}
function upfileChange(){
    $("#FileUploadFrm").submit();
}
function codeSnippet(){
	var popupX = (window.screen.width / 2) - 150;
    var popupY= (window.screen.height / 2) - 135;
    
    //팝업생성
	var url = "${pageContext.request.contextPath}/workspace/codeSnippet.do";
	var title ="코드 미리보기 작성";
	var specs = "width=577px, height=410px, left="+popupX+", top="+popupY;
	
	var popup = open(url,title,specs);//팝업의 최상위 윈도우객체를 리턴함.
	var interval = window.setInterval(function() {
	      try {
	          if (popup == null || popup.closed) {
	          	window.clearInterval(interval);
	          	var codeTitle = ($("#codeTitle").val());
	          	var codeContent = ($("#codeContent").val());
	          	var codeType = ($("#codeType").val());
	          	
	          	if(codeContent == ""){		
	          	}
	          	else{
	          		$('#message').val(codeContent);
	          		$('#CodeSnippet').attr("checked",true);
	          		
	          	}
	          	plusBtnClick();
	     	 }
	      }
	      catch (e) {
	      }
	  }, 1000); 
   
}
$(function(){
	var codeContent = ($("#codeContent").val());
	if(!codeContent == null){
		$('#message').val(codeContent);
		
	}
});
function Create_Channel(){
	location.href = "${pageContext.request.contextPath}/workspace/createChannel.do";
}
function fileDownload(oName){
    location.href="${pageContext.request.contextPath}/workspace/fileDownload.do?oName="+oName;
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
function homeClick(){
	location.href="${pageContext.request.contextPath}/workspace/WorkSpaceMain.do?";
}
function enterLi(e){
	e.lastChild.hidden = false;
}
function leaveLi(e){
	e.lastChild.hidden = true;
}
function deleteMessage(e){
	var chatNo = e.parentElement.id;
	var chatroom = e.id;
	console.log(chatNo);
	console.log(chatroom);
    location.href = "${pageContext.request.contextPath}/workspace/deleteMessage.do?chatNo="+chatNo+"&chatroom="+chatroom;
}
function deleteMessage2(e){
	var chatNo = e.parentElement.id;
	var chatroom = e.id;
	console.log(chatNo);
	console.dir(chatroom);
   location.href = "${pageContext.request.contextPath}/workspace/deleteMessage.do?chatNo="+chatNo+"&chatroom="+chatroom;
}
function deleteMessage3(e){
	var chatNo = e.parentElement.id;
	var chatroom = e.id;
	console.log(chatNo);
	console.dir(chatroom);
    location.href = "${pageContext.request.contextPath}/workspace/deleteMessage.do?chatNo="+chatNo+"&chatroom="+chatroom;
}
function homeClick(){
	location.href="${pageContext.request.contextPath}/workspace/WorkSpaceMain.do?";
}
</script>
