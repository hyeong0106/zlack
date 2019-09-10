<!DOCTYPE html>
<html lang="en">
<head>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<!-- 시맨틱 UI -->
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.css"/>
 <link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
 
 
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
 <script src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
 <!----------------------------------------------->  

<title>WorkSpace선택</title>
<style>
html{
	overflow: hidden;
	
}
header{
	width: 900px;
	height: 157px;
	text-align: right;
	padding-top: 20px;
}
body{
	font-family: 'Jua', sans-serif;
}
h2{
	font-family: 'Jua', sans-serif;
}
.ui.teal.button{
	font-family: 'Jua', sans-serif;
}
.workspaceDiv{
width: 900px;
height: 400px;
margin: 0 auto;
text-align: center;
}

.workspaceDiv #titleDiv{
font-size: 32px;
font-weight: bold;
margin-bottom: 15px;
}
.workspaceDiv #find-workspaceDiv button{
width: 474px;
height: 103px;
text-align: left;
border-top: 1px solid #ddd;
border-bottom: 1px solid #ddd;
border-left: none;
border-right: none;
background-color: #ffffff;
font-weight: bold;
padding: 15px 80px 15px 120px;
}
.workspaceDiv #create-workspaceDiv button{
width: 474px;
height: 103px;
text-align: left;
border-bottom: 1px solid #ddd;
border-top: none;
border-left: none;
border-right: none;
background-color: #ffffff;
font-weight: bold;
padding: 15px 80px 15px 120px;
}
.workspaceDiv #find-workspaceDiv #p1{
    font-size: 15px;
    margin-left: 30px;
    margin-top: 5px;
}
.workspaceDiv #find-workspaceDiv #p2{
    font-size: 13px;
    color: #616061;
    margin-left: 30px;
}
.workspaceDiv #create-workspaceDiv #p1{
    font-size: 15px;
    margin-left: 30px;
    margin-top: 5px;
}
.workspaceDiv #create-workspaceDiv #p2{
    font-size: 13px;
    color: #616061;
    margin-left: 30px;
}
.workspaceDiv #find-workspaceDiv #img-zoom{
    position: relative;
    left: -46px;
    bottom: 57px;
}
.workspaceDiv #create-workspaceDiv #img-plus{
    position: relative;
    left: -44px;
    bottom: 56px;
}
.workspaceDiv #launchDiv button{
    padding: 1px 20px 1px;
    font-size: 25px;
    line-height: 2em;
    border-radius: 4px;
    background-color: rgb(142, 68, 173);
    color: white;
    font-weight: bold;
}
#workspaceListDiv{
	margin-top: 30px;
}
.secret{
    background: coral !important;
}

</style>
</head>
<body>
	<header>
	
		 <button onclick="logout();" class="ui teal button"><i class="user outline icon"></i>로그아웃</button>
	</header>
   <div class="workspaceDiv">
   <section>
   <h2>${memberLoggedIn.memberId}님 환영합니다</h2>
       <div id="titleDiv">
       <p>Start with a workspace</p>
   </div>
   <div id="find-workspaceDiv">
   <button data-toggle="modal" data-target="#exampleModal">
       <p id=p1>워크스페이스 찾기</p>
       <p id=p2>워크 스페이스를 조회하거나 가입합니다.</p>
       <img src="${pageContext.request.contextPath }/resources/images/돋보기.PNG" id="img-zoom"alt="돋보기">
   </button>
   </div>
   <c:if test='${memberLoggedIn.memberId == "admin" || memberLoggedIn.memberId == "dragonball"
   				|| memberLoggedIn.memberId == "awesome"
   				|| memberLoggedIn.memberId == "ticketjava"
   				|| memberLoggedIn.memberId == "shine"}'>
   <div id="create-workspaceDiv">
   <button onclick="create_workspace();">
       <p id=p1>워크스페이스 생성</p>
       <p id=p2>당신의 워크스페이스를 생성합니다.</p>
       <img src="${pageContext.request.contextPath }/resources/images/플러스.PNG" id="img-plus" alt="플러스">	
   </button>
   </div>
   </c:if>
    <div id="workspaceListDiv">
          <c:forEach items="${WorkSpaceList}" var="m">
              <c:if test="${m.TEAMNAME == 'KH M반'}">
                  <button onclick="goWorkspace();" class="ui teal button">${m.TEAMNAME}</button>
              </c:if>
              <c:if test="${m.TEAMNAME != 'KH M반'}">
                  <button onclick="goInsertPassword();" class="ui teal button secret" >${m.TEAMNAME}</button>
              </c:if>
          </c:forEach>
  	</div>
   </section>
   </div>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">워크스페이스 찾기</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div id="">
			<p id="sub">${memberLoggedIn.memberId}님, 워크스페이스를 검색해주세요</p>
			<div class="input-group mb-3">
			  <div class="input-group-prepend">
			  
		
			    <span class="input-group-text" id="basic-addon1">검색명</span>
			  </div>
			  <input type="text" class="form-control" placeholder="워크스페이스 명을 입력하세요" aria-label="Username" aria-describedby="basic-addon1">
			  
			</div>
			<c:forEach items="${WorkSpaceList}" var="m">
			<c:if test="${m.TEAMNAME== 'KH M반'}">
				${m.TEAMNAME }  공개  <button onclick="goWorkspace();" class="ui teal button">입장하기</button> <br />
			</c:if>
			<c:if test="${m.TEAMNAME!= 'KH M반'}">
				${m.TEAMNAME } 비공개 <br />
			</c:if>
			
				
		    </c:forEach>
      </div>
      <div class="modal-footer">
        <button type="button" class="ui teal button" id="search-btn"><i class="search icon"></i>검색하기</button>
      </div>
    </div>
  </div>
</div>
   

   
   
</body>
<script>
function logout(){
	location.href = "${pageContext.request.contextPath}/member/logout.do";
}
function create_workspace(){
    location.href="${pageContext.request.contextPath}/workspace/create_workspace.do";
}
function goWorkspace(){
	location.href="${pageContext.request.contextPath}/workspace/WorkSpaceMain.do";
}
function goInsertPassword(){
    var password = prompt("비공개 워크스페이스입니다. 비밀번호를 입력하세요.");
    
    //일치하지 않으면
    alert("비밀번호가 일치하지 않습니다.");
}
</script>

</html>