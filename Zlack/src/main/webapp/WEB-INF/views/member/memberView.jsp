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
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
<style>
body{
	font-family: 'Jua', sans-serif;
}


#AnalyticsDiv{
   width: 900px;
   height: 600px;
   margin: 0 auto;
   background-color: rgb(224, 224, 224);
   overflow: hidden;
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
   font-family: 'Jua', sans-serif;
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
    padding-left: 20px;
    font-family: 'Jua', sans-serif;
}
#AnalyticsDiv section #AnalyticsType{
    padding-left: 80px;
   width: 900px;
   height: 50px;
   margin: 0 auto;
}
#AnalyticsDiv section #AnalyticsType button{
   all: unset;
   width: 110px;
   height: 50px;
   text-align: center;
   border-radius: 4px 4px 0px 0px;
   font-size: 18px;
   line-height: 2.5em;
   float: left;
   font-family: Sunflower;
   font-weight: bold;
   cursor: pointer;
   font-family: 'Jua', sans-serif;
}
#AnalyticsDiv section #AnalyticsType #UserBtn{
   background-color: rgb(224, 224, 224);
   color: rgb(22, 160, 133);
}
#AnalyticsDiv section #AnalyticsType #EtcBtn{
   background-color: rgb(224, 224, 224);
   color: rgb(22, 160, 133);
   font-family: 'Jua', sans-serif;
}
#AnalyticsDiv section #AnalyticsContents{
   width: 740px;
   height: 370px;
   margin-left: 80px;
   background-color: white;
}
#AnalyticsDiv footer{
   width: 900px;
   height: 100px;
   margin: 0 auto;
}
img#profile{
    width: 236px;
   border-radius: 15px;
   padding: 10px;
}
td{
    padding: 15px;
}
#membertbl{
    padding: 5px;
}
#memberDelete input{
    width: 250px;
}
#memberDelete button{
    margin: 0 15px 0 15px;
}
#memberDelete{
    position: absolute;
   margin-top: 100px;
   margin-left: 180px;
}
#membertbl .btn{
    margin: 0 15px 0 15px;
}
</style>
</head>
<body>
    <div id="AnalyticsDiv">
        <header>
        	<img src="${pageContext.request.contextPath }/resources/images/home.png" alt="집사진" width=60px; height=60px; style="margin-left: 10px; cursor: pointer;" onclick="goChating();"/>
            <span style="position: sticky; vertical-align: bottom;">${memberLoggedIn.nickName }</span>
        </header>
        <section>
            <div id="AnalyticsTitle">
                <p>가입자정보</p>
            </div>
            <div id="AnalyticsType">
	            <button id="UserBtn" onclick="clickMenu(this)">사용자정보</button>
	            <button id="EtcBtn" onclick="clickMenu(this)">탈퇴하기</button>
            </div>
            <div id="AnalyticsContents">
            	<c:if test="${type == '사용자정보' || type == null}">
					<div id="viewDiv" style="margin-left: 130px; position: absolute; margin-top: 20px; padding: 15px;">
						<table id="membertbl">
							<tr>
								<td rowspan="5">
								<div style="border: 1px solid lightgray; border-radius: 5px;">
								 	<img src="${pageContext.request.contextPath }/resources/upload/profile/${memberLoggedIn.image}" id="profile"/>								
								</div>
								</td>
							</tr>
							<tr>
								<td>아이디</td>
								<td>${memberLoggedIn.memberId }</td>
							</tr>
							<tr>
								<td>닉네임</td>
								<td>${memberLoggedIn.nickName }</td>
							</tr>
							<tr>
								<td>이메일</td>
								<td>${memberLoggedIn.email}</td>
							</tr>
							<tr>
								<td>가입일</td>
								<td>${memberLoggedIn.enrollDate }</td>
							</tr>
							<tr>
								<td colspan="3" style="text-align: center;">
									<button type="button" class="btn btn-success" onclick="updateUser();">수정하기</button>
								</td>
							</tr>
						</table>
						<!-- <div style="width: 300px; border: 1px solid lightgray; margin-top: -195px; border-radius: 5px; float: right;">
						</div> -->
					</div>
				</c:if>
				<c:if test="${type == '탈퇴하기'}">
					<div id="deleteDiv" style="width: 100%; height: 500px;">
						<form action="${pageContext.request.contextPath}/member/memberDelete.do" id="memberDelteFrm" method="post">
							<table id="memberDelete">
								<tr>
									<td>비밀번호</td>
									<td><input type="password" class="form-control" name="password" id="password1" placeholder="비밀번호를 입력해주세요.">
									<input type="hidden" name="memberId" id="memberId" value="${memberLoggedIn.memberId }"/></td>
								</tr>
								<tr>
									<td>비밀번호확인</td>
									<td><input type="password" class="form-control" id="password2" placeholder="비밀번호를 입력해주세요."></td>
								</tr>
								<tr>
									<td colspan="2" style="text-align: center;">
										<button type="button" class="btn btn-danger">취소</button>
										<button type="button" class="btn btn-warning" onclick="deleteEndCheck();">탈퇴하기</button>
									</td>
								</tr>
							</table>
						</form>
					</div>
				</c:if>
            </div>
        </section>
        
        <footer>

        </footer>
    </div>
<script>
$(function(){
	type = "<%=type%>"
	
	if(type=="사용자정보" || type=="null"){
		$("#UserBtn").css({"background": "white", "color":"black"});
	}
	else if(type=="탈퇴하기"){
		$("#EtcBtn").css({"background": "white", "color":"black"});
	}
});
function clickMenu(e){
	var type = e.innerHTML;
	location.href="${pageContext.request.contextPath }/member/memberView.do?type="+type;
}
function updateUser(){
	location.href= "${pageContext.request.contextPath }/member/UpdateMemberView.do";
}
function deleteEndCheck(){
	var memberId = $("#memberId").val();
	var password1 = $("#password1").val();
	var password2 = $("#password2").val();
	
	//비밀번호 같은면 계정정보와 맞는지 확인
	if(password1 == password2){
		$.ajax({
			url:"${pageContext.request.contextPath}/member/memberPwdcheck.do",
			type:"get",
			dataType:"json",
			data: {"memberId":memberId,"password":password1},
			contentType:"appication/json; charset=UTF-8;",
			success: function(data) {
				if(data==0){
					alert("계정과 일치하지 않습니다.");
				}
				else if(data==1){
					$("#memberDelteFrm").submit();
				}
			},
			error: function(jqxhr, textStatus, errorThrown){
				console.log("ajax처리실패: "+jqxhr.status);
				console.log(errorThrown);
			}
		});
	}
	else {
		alert("비밀번호가 일치하지 않습니다.");
	} 
}
function goChating() {
    location.href="${pageContext.request.contextPath}/workspace/WorkSpaceMain.do";
}
</script>
</body>
</html>