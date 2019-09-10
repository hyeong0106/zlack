<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
 <link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
<style>
body{
	font-family: 'Jua', sans-serif;
	overflow-x: hidden;
}
#bodytbl{
	margin: 0 auto;
}
.memberjoinDiv{
    width: 1024px;
    height: 768px;
    margin: 0 auto;
    padding-top: 100px;
    padding-left: 3%;
}
.form-control{
	width: 50%;
}
.memberjoinDiv #titleDiv #p1{
    font-size: 35px; font-weight: bold;
}
.memberjoinDiv #titleDiv #p2{
    font-size: 17px;
}
button.btn.btn-outline-danger{
	position: absolute;
	top:48%;
	left: 51%;
}
#continueDiv{
	text-align: left;
}
#continueDiv button{
	margin: 10px 20px 10px 0;
}
.memberjoinDiv form div{position:relative; padding:0px;}
span.guide {
	display:none;
	font-size: 15px;
	position:absolute; 
	top:58%; 
	right: 53%;
}
span.ok{color:green;}
span.error{color:red;}
form input{
	margin: 5px 0 5px 0;
}
</style>
</head>
<body>
	<table id="bodytbl">
	<tr>
		<td>
		   	<div id="enrollImg">
		        <img src="${pageContext.request.contextPath }/resources/images/회원가입이미지.PNG" />
		   	</div>
		</td>
		<td>
		    <div class="memberjoinDiv">
		        <section>
		            <form action="${pageContext.request.contextPath }/member/memberEnrollEnd.do" method="post" onsubmit="return validate();">
			            <div id="titleDiv">
			                <p id="p1">회원가입</p>
			                <p id="p2">회원 정보를 입력해주세요.</p>
			            </div><br>
			            <div id="idDiv">
			           		<label for="memberId">ID(중복불가)</label>
			    			<input type="text" class="form-control" name="memberId" id="memberId" aria-describedby="emailHelp" placeholder="영소/대문자+숫자, 4~15자리 " maxlength="15" required>
			                <span class="guide ok id">사용가능</span>
							<span class="guide error id">사용불가</span>
							<input type="hidden" id="checkId" value="0"/>
			            </div><br>
			            <div id="nicknameDiv">
			           		<label for="nickName">닉네임(중복가능)</label>
			    			<input type="text" class="form-control" name="nickName" id="nickName" placeholder="닉네임을 입력하세요" required>
			            </div><br>
			            <div id="passwordDiv">
			           		<label for="password">비밀번호</label>
			    			<input  type="password" class="form-control" name="password" id="password" placeholder="비밀번호 입력(특수,영문,숫자를 포함한 8~15자리)" maxlength="15" required>
			                <span class="guide ok pwd">사용가능</span>
							<span class="guide error pwd">사용불가</span>
							<input type="hidden" id="checkPwd" value="0"/>
			            </div><br>
			            <div id="password2Div">
			           		<label for="password2">비밀번호 확인</label>
			    			<input  type="password" class="form-control" name="password2" id="password2" placeholder="비밀번호 확인" required>
			                <span class="guide ok pwdck">같습니다</span>
							<span class="guide error pwdck">틀립니다</span>
							<span class="guide error pwdck password">비밀번호입력</span>
							<input type="hidden" id="checkPwdck" value="0"/>
			            </div><br>
			            <div id="emailDiv">
			           		<label for="email">이메일(인증)</label>
			    			<input  type="email" class="form-control" name="email" id="email" placeholder="name@example.com" required>
				            <button type="button" class="btn btn-outline-danger" onclick="emailSend();">인증번호발급</button>
			                
			            </div><br>
			            <div id="emailCodeDiv">
			           		<label for="emailCheckCode">인증번호</label>
			    			<input  type="text" class="form-control" id="emailCheckCode" placeholder="인증번호를 입력하세요" required>
							<input type="hidden" id="checkEmailCode" value="0"/>
				            <button type="button" class="btn btn-outline-danger" onclick="FemailCheckCode();">인증하기</button>
			            </div><br>
			            <input type="hidden" name="image" value="profile.png"/>
			            <div id="continueDiv">
			            	<button type="submit" class="btn btn-outline-success">가입하기</button>
			            	<button type="reset" class="btn btn-outline-primary" onclick="guidHide();">초기화</button>
			            	<button type="button" class="btn btn-outline-secondary" onclick="location.href='${pageContext.request.contextPath}/member/Loginpage.do'">취소</button>
			            </div>
		            </form>
		        </section>
		    </div>
		</td>
	</tr>
	</table>
<script>
function regTest(reg,info){
  if(reg.test(info)){
      return true;
  }else{
      return false;
  }
}
$(function() {
	$("#memberId").on("keyup",function(){
		
		var memberId = $(this).val().trim();
		
		var reg=/^[a-z][a-z\d]{3,15}$/;
		var bool = regTest(reg,memberId);
		
		if(bool == true){
			$.ajax({
				url: "${pageContext.request.contextPath}/member/checkId.do",
				data : {memberId: memberId},
				success: function(data) {
					
					if(data.isUsable == true){
						$(".guide.error.id").hide();
						$(".guide.ok.id").show();
						$("#checkId").val(1);
					}
					else{
						$(".guide.error.id").show();
						$(".guide.ok.id").hide();
						$("#checkId").val(0);
					}
				},
				error: function(jqxhr, textStatus, errorThrown) {
					console.log("ajax처리실패! : "+jqxhr.status);
					console.log(jqxhr);
					console.log(textStatus);
					console.log(errorThrown);
				}
			});		
		}
		else if(bool == false){
			if(memberId.length == 0){
				$(".guide.id").hide();
				$("#checkId").val(0);				
			}
			else{
				$(".guide.error.id").show();
				$(".guide.ok.id").hide();
				$("#checkId").val(0);				
			}
			return;				
		}
	});
	$("#password").on("keyup",function(){
		var password  = $(this).val().trim();
		
		var reg = /^.*(?=^.*\S{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).*$/g;

		var bool = regTest(reg,password);
		if(bool == true){
			$(".guide.error.pwd").hide();
			$(".guide.ok.pwd").show();
			$("#checkPwd").val(1);
		}
		else if(bool == false){
			if(password.length == 0){
				$(".guide.pwd").hide();
				$("#checkPwd").val(0);				
			}
			else{
				$(".guide.error.pwd").show();
				$(".guide.ok.pwd").hide();
				$("#checkPwd").val(0);				
			}
		}
	});
	$("#password2").on("keyup",function(){
		var password  = $("#password").val().trim();
		var password2  = $(this).val().trim();
		
		if(password == password2 && password2.length > 0 && password.length > 0){
			$(".guide.error.pwdck").hide();
			$(".guide.ok.pwdck").show();
			$("#checkPwdck").val(1);
		}
		else if(password2.length == 0){
			$(".guide.pwdck").hide();
			$("#checkPwdck").val(0);
		}
		else if(password != password2){
			if(password.length == 0){
				console.log(password.length);
				$(".guide.error.pwdck").hide();
				$(".guide.error.pwdck.password").show();
				$(".guide.ok.pwdck").hide();
				$("#checkPwdck").val(0);								
			}
			else{
				$(".guide.error.pwdck").show();
				$(".guide.error.pwdck.password").hide();
				$(".guide.ok.pwdck").hide();
				$("#checkPwdck").val(0);				
			}
		}
	});
});
function emailSend() {
	
	var email = $("#email").val().trim();
	
	alert("인증코드를 발송했습니다.");
	$.ajax({
		url: "${pageContext.request.contextPath}/member/emailSendCode",
		type: "get",
		dataType: "json",
		data:{"email":email},
		contentType:"appication/json; charset=UTF-8;",
		success: function(data){
			$("#emailCheckCode").focus();
		},
		error: function(jqxhr, textStatus, errorThrown){
			console.log("ajax처리실패: "+jqxhr.status);
			console.log(errorThrown);
		}
	});
}
function validate() {
	var checkId = $("#checkId").val();
	var checkPwd = $("#checkPwd").val();
	var checkPwdck = $("#checkPwdck").val();
	var checkEmailCode = $("#checkEmailCode").val();
	
	if(checkId == 1 && checkPwd == 1 && checkPwdck == 1 && checkEmailCode == 1){
		return true;
	}
	else{
		alert("정보를 정확히 입력해 주세요.");
		return false;
	}
	
}
function FemailCheckCode(){
	
	var email = $("#email").val().trim();
	var emailCheckCode = $("#emailCheckCode").val().trim();
	
	$.ajax({
		url:"${pageContext.request.contextPath}/member/checkEmailCode",
		type:"get",
		dataType:"json",
		data:{"authCode":emailCheckCode,"email":email},
		contentType:"appication/json; charset=UTF-8;",
		success: function(data) {
			if(data==1){
				$("#checkEmailCode").val(data);
				alert("인증완료");
			}
			else{
				$("#checkEmailCode").val(data);	
				alert("인증실패");				
			}
		},
		error: function(jqxhr,textStatus,errorThrown){
			console.log("ajax처리실패: "+jqxhr.status);
			console.log(errorThrown);
		}
	});
}
function guidHide() {
	$(".guide").hide();
	$("input[type=hidden]").val(0);
}
</script>
</body>
</html>