<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% 	String type = (String)request.getAttribute("type"); %>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
<script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
<style>
body{
	text-align: center;
	font-family: 'Jua', sans-serif;
}
#findDiv {
    width: 600px;
    min-height: 400px;
    margin: 150px auto;
    position: relative;
}
#tabDiv{
	text-align: left;
	/* margin-left: 10%;
	margin-top: 20%; */
}
.id{
	border-radius: .25em 0 0 0;
}
.pwd{
	border-radius: 0 .25em 0 0;
}
#searchDiv{
	border: 2px solid rgb(32, 70, 113);
 	min-height: 400px;
	text-align: left;
}
#searchDiv h2{
	padding: 20px;
	text-align: center;    
}
#searchDiv .btn-primary{margin-bottom: 0.5%;}
#searchDiv .form-group{padding: 20px 20px 0px 100px;}
#searchDiv #Pwdupdate-container{
	padding: 0 20px 20px 20px;
}
#searchDiv .form-control{margin:10px; width: 45%; display: inline;}
#idDiv form{margin-left: 15%;}

#IdList{
  	width: 60%;
    margin-left: 210px;	
}
#id-tbl{
	font-size: 35px;
	width: 100%;
}
#id-tbl td{
	border-bottom: 1px solid lightgray;
}
#id-tbl li{
	padding: 10px;
}
#id-tbl ul{
	margin-bottom: 24px;
}
#loginpage {
    padding: 50px 0 0 0;
}
#Pwdupdate-container{
	display: none;
}

.mdl-button--raised{
    color: white;
    background: rgb(253, 62, 105);
    margin-left: 20px;
    font-family: 'Jua', sans-serif;
}
.mdl-button:hover {
    background-color: #d0d0d9;
}
.mdl-js-button{
	font-family: 'Jua', sans-serif;
}
h2{
	font-family: 'Jua', sans-serif;
}
.mdl-list__item {
	font-family: 'Jua', sans-serif;
}
#backImg{
    position: absolute;
    opacity: 0.3;
    left: 0;
    width: 100%;
    height: 77%;
    top: 37;
    z-index: -1;
}
.mdl-textfield__label{
	color: rgba(0, 0, 0, 0.67);
}
.mdl-textfield__input{
	font-family: 'Jua', sans-serif;
	border-bottom: 1px solid rgba(0, 0, 0, 0.67);
}
</style>
<body>
	<div id="findDiv">
		<img id="backImg"src="${pageContext.request.contextPath }/resources/images/pwdsearch.png" />
		<div id="tabDiv">
			<div class="btn-group" role="group" aria-label="Basic example">
			  <button type="button" class="mdl-button mdl-js-button" onclick="goFind(this);" id="id">아이디찾기 </button>
			  <button type="button" class="mdl-button mdl-js-button" onclick="goFind(this);" id="password">비밀번호찾기</button>
			  
			</div>
			<div id="searchDiv">
				<div id="idDiv">
					<c:if test="${type == '아이디찾기' }">
					<h2 style="margin-bottom: 30px;">아이디 찾기</h2>
						<div class="form-group">
		    				<div class="mdl-textfield mdl-js-textfield">
						    	<input class="mdl-textfield__input" type="text" id="email" aria-describedby="emailHelp">
						    	<label class="mdl-textfield__label" for="email">example@name.com</label>
						    </div>
		    				<button type="button" class="btn btn-light pwd mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect" onclick="checkId();">
								인증코드 발송
							</button><br />
							<div class="mdl-textfield mdl-js-textfield">
						    	<input class="mdl-textfield__input" type="text" id="authcode" aria-describedby="emailHelp">
						    	<label class="mdl-textfield__label" for="authcode">인증코드를 입력하세요.</label>
						    </div>
		    				<button type="button" class="btn btn-light pwd mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect" onclick="checkIdCode();">
								인증하기
							</button><br />
	    				</div>
	    				<div id="IdList"></div>
					</c:if>
					<c:if test="${type == '비밀번호찾기' }">
					<h2 style="margin-bottom: 0px;">비밀번호찾기</h2>
						<div class="form-group">
							<div class="mdl-textfield mdl-js-textfield">
						    	<input class="mdl-textfield__input" type="text" id="memberId" aria-describedby="emailHelp">
						    	<label class="mdl-textfield__label" for="memberId">아이디</label>
						    </div>
							<div class="mdl-textfield mdl-js-textfield">
						    	<input class="mdl-textfield__input" type="email" id="email2" aria-describedby="emailHelp">
						    	<label class="mdl-textfield__label" for="email2">example@name.com</label>
						    </div>
							<button type="button" class="btn btn-light pwd mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect" onclick="checkPwd();">
								인증코드 발송
							</button><br />
							<div class="mdl-textfield mdl-js-textfield">
						    	<input class="mdl-textfield__input" type="text" id="authcode2" aria-describedby="emailHelp">
						    	<label class="mdl-textfield__label" for="authcode2">인증코드를 입력하세요.</label>
						    </div>
							<button type="button" class="btn btn-light pwd mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect" onclick="checkPwdCode();">
								인증하기
							</button>
	    				</div>
	    				<div id="Pwdupdate-container">
	    					<form action="${pageContext.request.contextPath }/member/PwdUpdate" method="post" id="PwdFrm">
	    						<input type="hidden"  name="updateId" id="updateId"/>
	    						
	    						<div class="mdl-textfield mdl-js-textfield">
							    	<input class="mdl-textfield__input" type="password" id="password1" aria-describedby="emailHelp" name="password1" maxlength="15">
							    	<label class="mdl-textfield__label" for="authcode2">비밀번호(특수,영문,숫자 포함 8~15자리)</label>
						    	</div>
	    						<div class="mdl-textfield mdl-js-textfield">
							    	<input class="mdl-textfield__input" type="password" id="password2" aria-describedby="emailHelp" name="password2" maxlength="15">
							    	<label class="mdl-textfield__label" for="authcode2">비밀번호 확인</label>
						    	</div>
								<button type="button" class="btn btn-light pwd mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect" onclick="PasswordCheck();">
									비밀번호변경
								</button>
			    				    					
	    					</form>
	    				</div>
	    			</c:if>					
				</div>
			</div>
		</div>
		
		<div id="loginpage">
				<button type="button" class="btn btn-light pwd mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect" style="background-color: rgb(32, 70, 113)" onclick="goHome();">
					로그인페이지
				</button>
		</div>
	</div>
<script>
function goHome() {
	location.href="${pageContext.request.contextPath}/member/Loginpage.do";
}
$(function() {
	var type = '<%=type%>';
	console.log(type);
	console.dir(type);
	if(type=="아이디찾기"){
		$("#id").css({"color":"white","background":"rgb(32, 70, 113)"});
	}
	else if(type=="비밀번호찾기"){
		$("#password").css({"color":"white","background":"rgb(32, 70, 113)"});
	}
	
});
function goFind(e) {
	location.href='${pageContext.request.contextPath}/member/findMember.do?type='+e.innerHTML; 
}
function checkId() {
	var email = $("#email").val().trim();
	$.ajax({
		url:"${pageContext.request.contextPath}/member/IdCheckEmail",
		type:"get",
		dataType:"json",
		data: {"email":email},
		contentType:"appication/json; charset=UTF-8;",
		success: function(data) {
			if(data > 0){
				alert("인증코드를 전송했습니다.");
				SendCode($("#email").val().trim());
			}
			else{				
				alert("존재하지 않는 ID입니다.");
				return false;
			}
		},
		error: function(jqxhr, textStatus, errorThrown){
			console.log("ajax처리실패: "+jqxhr.status);
			console.log(errorThrown);
		}
	});
}
function SendCode(email) {
		$.ajax({
			url:"${pageContext.request.contextPath}/member/SendCode",
			type:"get",
			dataType:"json",
			data: {"email":email},
			contentType:"appication/json; charset=UTF-8;",
			success: function(data) {
			},
			error: function(jqxhr, textStatus, errorThrown){
				console.log("ajax처리실패: "+jqxhr.status);
				console.log(errorThrown);
			}
		});		
}
function checkIdCode() {
	var email = $("#email").val().trim();
	var authcode = $("#authcode").val().trim();
	
	$.ajax({
		url:"${pageContext.request.contextPath}/member/IdCheckCode",
		type:"get",
		dataType:"json",
		data: {"email":email,"authCode":authcode},
		contentType:"appication/json; charset=UTF-8;",
		success: function(data) {
			if(data.list != null){
				alert("인증이 완료되었습니다.");
				var html = '<ul class="demo-list-icon mdl-list">';
				for(var i in data.list){
				  	html += '<li class="mdl-list__item">';
				  	html += '<span class="mdl-list__item-primary-content">';
				  	html += '<i class="material-icons mdl-list__item-icon">person</i>';
				  	html += data.list[i].memberId+"[";
				  	html += data.list[i].NICKNAME +"]";
				  	html += '</span>';
				  	html += '</li>';
				}				
 				html += "</ul>";
				$("#IdList").html(html).show();
				$("#backImg").css("height","79%");
			}
			else{
				alert("인증에 실패하였습니다.");
				$("#IdList").html(html).hide();				
			}
		},
		error: function(jqxhr, textStatus, errorThrown){
			console.log("ajax처리실패: "+jqxhr.status);
			console.log(errorThrown);
		}
	});
}
function checkPwd() {
	var memberId = $("#memberId").val().trim();
	var email2 = $("#email2").val().trim();
	
	$.ajax({
		url:"${pageContext.request.contextPath}/member/PwdCheckEmail",
		type:"get",
		dataType:"json",
		data: {"email":email2, "memberId":memberId},
		contentType:"appication/json; charset=UTF-8;",
		success: function(data) {
			if(data > 0){
				alert("인증코드를 전송했습니다.");
				SendCode($("#email2").val().trim());
			}
			else{				
				alert("존재하지 않는 ID입니다..");
				return false;
			}
		},
		error: function(jqxhr, textStatus, errorThrown){
			console.log("ajax처리실패: "+jqxhr.status);
			console.log(errorThrown);
		}
	});
}
function checkPwdCode() {
	var email = $("#email2").val().trim();
	var authcode = $("#authcode2").val().trim();
	
	$.ajax({
		url:"${pageContext.request.contextPath}/member/checkPwdCode",
		type:"get",
		dataType:"json",
		data: {"email":email,"authCode":authcode},
		contentType:"appication/json; charset=UTF-8;",
		success: function(data) {
			if(data == 1){
				alert("인증이 완료되었습니다.");
				$("#backImg").css("height","80%");
				$("#Pwdupdate-container").show();
				$("#updateId").val($("#memberId").val());
			}
			else{
				alert("인증에 실패하였습니다.");
				$("#Pwdupdate-container").hide();
				return false;
			}
		},
		error: function(jqxhr, textStatus, errorThrown){
			console.log("ajax처리실패: "+jqxhr.status);
			console.log(errorThrown);
		}
	});
}
function regTest(reg,info){
	if(reg.test(info)){
	    return true;
	}else{
	    return false;
	}
}
function PasswordCheck() {
	var password1 = $("#password1").val().trim();
	var password2 = $("#password2").val().trim();
	var reg = /^.*(?=^.*\S{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).*$/g;
	
	var bool = regTest(reg,password1);
	
	if(bool==true){
		if(password1 == password2){
			$("#PwdFrm").submit();
			return true;
		}
		else{
			alert("비밀번호가 일치하지 않습니다.")
			return false;
		}
	}
	else{
		alert("특수,영문,숫자를 포함한 8~15자리로 입력해 주세요.");
		return false;
	}
}
</script>
</body>
</html>