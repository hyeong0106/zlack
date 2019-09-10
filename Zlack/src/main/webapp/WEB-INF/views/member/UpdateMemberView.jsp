<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<% 	String type = (String)request.getAttribute("type"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>회원정보페이지</title>
<body>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
<style>
#AnalyticsDiv{
    width: 900px;
   height: 968px;
    margin: 0 auto;
    background-color: rgb(224, 224, 224);
	overflow-x: hidden;
}
#AnalyticsDiv header{
    width: 900px;
    height: 68px;
    margin: 0 auto;
    box-shadow: rgb(190, 190, 190) 0px 3px 3px 0px;
    background-color: white;
    line-height: 58px;
}
#AnalyticsDiv header span{
    font-size: 30px;
    font-weight: bold;
    color: #333333;
    font-family: Sunflower;
    position: relative;
    bottom: 16px;
    left: 8px;
}
#AnalyticsDiv section{
     width: 900px;
   height: 500px;
    margin: 0 auto;
}
#AnalyticsDiv section #AnalyticsTitle{
    width: 900px;
    height: 80px;
    margin: 0 auto;
}
#AnalyticsDiv section #AnalyticsTitle p{
    font-size: 30px;
    font-weight: bold;
    color: #333333;
    font-family: Sunflower;
	margin-top: 1rem;
	margin-left: 30px;
}
#AnalyticsDiv section #AnalyticsType{
    width: 900px;
    height: 50px;
    margin-left: 80px;
    
}
#AnalyticsDiv section #AnalyticsType button{
    all: unset;
    width: 130px;
    height: 50px;
    text-align: center;
    border-radius: 4px 4px 0px 0px;
    font-size: 18px;
    line-height: 2.5em;
    float: left;
    font-family: Sunflower;
    font-weight: bold;
    cursor: pointer;
}
#AnalyticsDiv section #AnalyticsType #UserBtn{
    all: unset;
    width: 130px;
    height: 50px;
    text-align: center;
    border-radius: 4px 4px 0px 0px;
    font-size: 18px;
    line-height: 2.5em;
    float: left;
    font-family: Sunflower;
    font-weight: bold;
    background: white;
}
#AnalyticsDiv section #AnalyticsType #EtcBtn{
    background-color: rgb(224, 224, 224);
    color: rgb(22, 160, 133);
}
#AnalyticsDiv section #AnalyticsContents{
     width: 740px;
   height: 670px;
    margin: 0 auto;
    background-color: white;
}

#AnalyticsDiv footer{
     width: 900px;
   height: 100px;
    margin: 0 auto;
}
td{
	padding: 15px;
}
#membertbl{
	padding: 5px;
	margin-left: 180px;
}
.passwordTr{
 	display: none;
}
.proFileImgTr{
 	display: none;
}

span.guide {
 	display: none;
	font-size: 15px;
	top:75%; 
	right: 53%;
}
span.ok{color:green;}
span.error{color:red;}
span.pwd{ float:left;  width:100px;}
span.pwdck{float:left; width:100px;}
#membertbl input{
	width: 300px;
}
.passwordTr input::placeholder{
	font-size: 12px;
}
</style>
</head>
<body>
    <div id="AnalyticsDiv">
        <header>
        	<img src="${pageContext.request.contextPath }/resources/images/home.png" alt="집사진" width=60px; height=60px; style="margin-left: 10px; cursor: pointer;" onclick="goChating();"/>
            <span style="position: sticky; vertical-align: bottom;">${member.nickName }</span>
        </header>
        <section>
			<div id="AnalyticsTitle">
                <p>탈퇴하기</p>
            </div>
            <div id="AnalyticsType">
	            <button id="UserBtn" >사용자정보</button>
            </div>
            <div id="AnalyticsContents">
            		<form action="${pageContext.request.contextPath}/member/memberUpdateEnd.do" onsubmit="return updateEndCheck();" method="post" 
            		 enctype="multipart/form-data">
						<div id="viewDiv" style="padding: 20px;">
							<table id="membertbl" >
								<tr>
									<td>아이디</td>
									<td>${member.memberId }<input type="hidden" name="memberId" value="${member.memberId }"/></td>
								</tr>
								<tr>
									<td>닉네임</td>
									<td><input type="text" class="form-control" style="color: black;" value="${member.nickName }" id="nickName" name="nickName"></td>
								</tr>
								<tr>
									<td>이메일</td>
									<td><input type="email" class="form-control" style="color: black;" value="${member.email}" id="email" name="email"></td>
								</tr>
								<tr>
									<td>가입일</td>
									<td>${member.enrollDate}</td>
								</tr>
								<tr>
									<td><button type="button" class="btn" onclick="updatePasswordBtn();">비밀번호변경</button></td>
									<td><button type="button" class="btn" onclick="updateProFileImg();">프로필이미지변경</button></td>
								</tr>
								<tr class="passwordTr">
									<td>비밀번호</td>
									<td>
										<input type="password" class="form-control" id="password1" name="password" placeholder="비밀번호 입력(특수,영문,숫자를 포함한 8~15자리)" maxlength="15"">
									</td>
									<td width="13px">
										<span class="guide ok pwd">사용가능</span>
										<span class="guide error pwd">사용불가</span>
										<input type="hidden" id="checkPwd" value="0"/>									
									</td>
								</tr>
								<tr class="passwordTr">
									<td>비밀번호 확인</td>
									<td>
										<input type="password" class="form-control" placeholder="비밀번호 입력(특수,영문,숫자를 포함한 8~15자리)" maxlength="15"  id="password2">
									</td>
									<td width="130px">
										<span class="guide ok pwdck">사용가능</span>
										<span class="guide error pwdck">사용불가</span>
										<input type="hidden" id="checkPwdck" value="0"/>									
									</td>
								</tr>	
								<tr class="proFileImgTr">
									<td>프로필이미지</td>
									<td><input type="file" name="proFile"/></td>
								</tr>
								<tr>
									<td colspan="2" style="text-align: left; padding: 25px;" >
										<button type="button" class="btn btn-danger" style="margin: 0 15px 0 120px;" onclick="gomemberView();">취소</button>
										<button type="submit" class="btn btn-success " style="margin: 0 15px 0 15px;">수정완료</button>
									</td>
								</tr>
							</table>
						</div>
					</form>
            </div>
        </section>
        
        <footer>

        </footer>
    </div>
<script>
$(function(){
	$("#password1").on("keyup",function(){
		var password1  = $("#password1").val().trim();
		
		var reg = /^.*(?=^.*\S{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).*$/g;
		
		var bool = regTest(reg,password1);
		
		console.log(bool);
		if(bool == true){
			$(".guide.error.pwd").hide();
			$(".guide.ok.pwd").show();
			$("#checkPwd").val(1);
		}
		else if(bool == false){
			if(password1.length == 0){
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
		var password1  = $("#password1").val().trim();
		var password2  = $("#password2").val().trim();
		
		if(password1 == password2 && password2.length > 0 && password1.length > 0){
			$(".guide.error.pwdck").hide();
			$(".guide.ok.pwdck").show();
			$("#checkPwdck").val(1);
		}
		else if(password2.length == 0){
			$(".guide.pwdck").hide();
			$("#checkPwdck").val(0);
		}
		else if(password1 != password2){
			if(password1.length == 0){
				console.log(password1.length);
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
function updatePasswordBtn(){
	$(".passwordTr").toggle();
}
function updateProFileImg(){
	$(".proFileImgTr").toggle();
}
function updateEndCheck(){
	var password1 = $("#password1").val();
	var password2 = $("#password2").val();
	var checkPwd = $("#checkPwd").val();
	var checkPwdck = $("#checkPwdck").val();
	var nickName = $("#nickName").val();
	var email = $("#email").val();
	//비밀번호 폼 작성시
	if(password1 != ""){
		//3.비밀번호
		if(checkPwd != 1){
			alert("비밀번호를 사용할 수 없습니다.");
			return false;
		}
		//4.비밀번호확인
		if(password2 != ""){
			if(checkPwdck != 1){
				alert("비밀번호가 일치하지 않습니다.");
				return false;
			}
		}else{
			alert("비밀번호 확인을 입력하세요.")
			return false;
		}
	} 
	
	//닉네임 null
	if(nickName == ""){
		alert("닉네임을 입력해주세요.")
		return false;
	}
	//이메일 null
	if(email == ""){
		alert("이메일을 입력해주세요.")
		return false;
	}
	
	return true;
}
function regTest(reg,info){
	if(reg.test(info)){
	    return true;
	}else{
	    return false;
	}
}
function goChating() {
	location.href="${pageContext.request.contextPath}/workspace/WorkSpaceMain.do";
}
function gomemberView() {
	location.href="${pageContext.request.contextPath}/member/memberView.do";
}
</script>
</body>
</html>