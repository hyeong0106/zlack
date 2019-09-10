<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String type = (String)request.getAttribute("type");
System.out.println(type);
%>
<!-- 시맨틱 UI -->
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.css"/>
 <link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
 <!----------------------------------------------->  
 
 <!--------------------JQuery--------------------------->
 <script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
  <!----------------------------------------------->
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.4.0.js"></script>
<style>
	body{
	overflow: hidden;
	font-family: 'Jua', sans-serif;
	}
	header{
	 	width:900px;
	 	height: 100px;
	 	text-align: right;
	 	
	}
	header #typeBtn{
	all: unset;
 	width:70px;
 	height: 50px;
 	border: 1px solid gray;
 	margin-top: 20px;
 	text-align: center;
}
header #typeBtn:hover{
       box-shadow: 1px 1px 30px #00b5ad;
}
	html{
	overflow: hidden;
	}
   .loginPageDiv{
       width: 900px;
       height: 500px;
       margin: 0 auto;
       /* background: red; */
       text-align: center;
       margin-top: 15px;
   }
   .loginPageDiv #titleDiv{
       font-size: 48px;
       font-weight: bold;

   }
   .loginPageDiv #titleDiv p{
       margin: 0px;
   }
    .loginPageDiv #titleDiv #p2{
       margin-bottom: 15px;
   }
   .loginPageDiv #contentDiv{
       font-size: 16px;
       font-style: initial;
   }
   .loginPageDiv #loginDiv #login_btn{
       font-size: 16px;
       border: none;
       line-height: 2.5em;
       background-color: #00b5ad;
       padding: 35px 50px 50px;
       color: white;
       font-weight: bold;
       position: relative;
       top: -53px;
       left: -2px;
       height: 111px;
   }
	#frm{
	 padding-top: 30px;
	 height: 160px;
	}
   .loginPageDiv #loginDiv #memberId{
       padding: 15px 45px 15px;
       margin-left: -155px;
       border: 1px solid lightgray;
       width: 240px;
       height: 49px;
   }
   .loginPageDiv #loginDiv #password{
       padding: 15px 45px 15px;
       position: relative;
       left: -7px;
       bottom: 23px;
       border: 1px solid lightgray;
       width: 240px;
       height: 49px;
   }
   
	 .loginPageDiv #loginDiv #password:hover{	
        border: none;
       box-shadow: 0px 0px 30px #00b5ad;
   }  
   .loginPageDiv #loginDiv #memberId:hover{
        border: none;
       box-shadow: 0px 0px 30px #00b5ad;
   }
   .loginPageDiv #signinDiv *{
   	display: inline-block;
   }
   .loginPageDiv #signinDiv label{
   	 color:blue;
   }
   .loginPageDiv #signinDiv label:hover{
   	 border-bottom: 1px solid blue;
   }
	.loginPageDiv #findMemberDiv *{
   	display: inline-block;
   }
    .loginPageDiv #findMemberDiv label{
   	 color:blue;
   }
    .loginPageDiv #findMemberDiv label:hover{
   	 border-bottom: 1px solid blue;
   }

}

   </style>
   
    <style type="text/css">
    body > .grid {
      height: 450px;
    }
    
    .image {
      margin-top: -100px;
    }
    .column {
      max-width: 450px;
    }
 	#zlack-logo{
 		width:40px;
 		height:40px;
 		margin: 0px;
 		display: inline-block;
 	}
 	.content{
 	color: black;
 	font-family: 'Jua', sans-serif;
 	}
 	.ui.form .field .ui.input input{
 	font-family: 'Jua', sans-serif;
 	}
 	input{
 		font-family: 'Jua', sans-serif;
 	}
 	.ui.teal.button{
		font-family: 'Jua', sans-serif;
	}
  </style>
</head>
<script>
function goEnroll(){
	location.href = "${pageContext.request.contextPath}/member/MemberEnrollPage.do";
}


function fn_login(){
	if($("#memberId").val().length<1)
		{
		alert("아이디를 입력해주세요.");
		}
	else if($("#password").val().length<1){
		alert("비밀번호를 입력해주세요.");
	}
	else{
		frm.setAttribute("method","post");
		document.frm.action="${pageContext.request.contextPath}/member/memberLogin.do";
		document.frm.submit();
	}
}

function ChangeStyle(e){
		location.href = "${pageContext.request.contextPath}/member/Loginpage.do?type="+e.innerText;
}

</script>



<body>
	<header>
		<button id="typeBtn" onclick="ChangeStyle(this)">
		Style1
		</button>
		<button id="typeBtn" onclick="ChangeStyle(this)">
		Style2
		</button>
	</header>
<c:if test="${memberLoggedIn.memberId==null}">
	<%if(type==null || type.equals("Style1")) {%>
    <div class="loginPageDiv">
        <section>
           <div id="titleDiv">
               <p id="p1">당신이 하는일이 무엇이든,</p>
               <p id="p2">Zlack에서 할 수있어!</p>
           </div>
           <div id="contentDiv">
               <p>Zlack은 최고의 업무를 수행하는데 필요한 소통환경을 제공합니다</p>
           </div>

           <div id="loginDiv">
           <form id="frm" name="frm" action="${pageContext.request.contextPath}/member/memberLogin.do">
               <input type="text" id="memberId" name="memberId" placeholder="아이디를 작성해주세요.">
               <br />
               <input type="password" id="password" name="password" placeholder="비밀번호를 입력하세요.">


               <button id="login_btn" class="btn"type="button" onclick="fn_login()">Login</button>
           </form>

           </div>
            <div id="signinDiv">
                <p>아직 Zlack 회원이 아니십니까?</p>
				<label id="start-btn" onclick="goEnroll();">회원가입 하기</label>
            </div>
            <div id="findMemberDiv">
            	<p>아이디와 비밀번호를 잊어버리셨나요?</p>
            	<label onclick="goFindMember();">아이디/비밀번호 찾기</label>
            </div>
        </section>
  
        </div>
        <%} else{%>
        <div class="ui middle aligned center aligned grid">
		  <div class="column">
		    <h2 class="ui teal image header">
		      <img src="${pageContext.request.contextPath }/resources/images/Zlack-logo.jpg" id="zlack-logo" alt="로고">
		      <div class="content">
		        Log-in to your account
		      </div>
		    </h2>
		    <form class="ui large form" id="frm"  name="frm" action="${pageContext.request.contextPath}/member/memberLogin.do">
		      <div class="ui stacked segment">
		        <div class="field">
		          <div class="ui left icon input">
		            <i class="user icon"></i>
		            <input type="text" name="memberId" id="memberId" placeholder="Example@email.com" >
		          </div>
		        </div>
		        <div class="field">
		          <div class="ui left icon input">
		            <i class="lock icon"></i>
		            <input type="password" name="password" id="password" placeholder="비밀번호를 입력하세요">
		          </div>
		        </div>
		        <div class="ui fluid large teal submit button" onclick="fn_login()"><i class="sign-in icon"></i>Login</div>
		      </div>
		​
		      <div class="ui error message"></div>
		​
		    </form>
		​
		    <div class="ui message">
		      계정 정보를 잃어버리셨나요? <a href="#" onclick="goFindMember();"> 아이디/비밀번호 찾기</a></br>
		      아직 회원이 아니세요? <a href="#" onclick="goEnroll();"> 회원가입하기</a>
		    </div>
		  </div>
		</div>
        
        <%} %>
</c:if>
<c:if test="${memberLoggedIn.memberId!=null}">
 <div class="loginPageDiv">
 <section>
<h1>${memberLoggedIn.memberId}님 환영합니다</h2>
	<h4>이미 로그인 하신 상태입니다.</h3>
	<button onclick="goWorkspace();" class="ui teal button">즐랙 시작하기</button>
	<button onclick="logout();" class="ui teal button"><i class="user outline icon"></i>로그아웃</button>
	</section>
</div>
</c:if>
</body>
<script>
function goWorkspace(){
	location.href="${pageContext.request.contextPath}/member/memberinfo.do"
}
function logout(){
	location.href = "${pageContext.request.contextPath}/member/logout.do";
}
function goFindMember(){
	location.href = "${pageContext.request.contextPath}/member/findMember.do";
}
</script>

</html>