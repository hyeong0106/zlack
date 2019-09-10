<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 시맨틱 UI -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.css"/>
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
<!----------------------------------------------->
<!--------------------JQuery--------------------------->
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.min.js"></script>
 <!----------------------------------------------->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>WorkSpace 생성</title>
</head>
<style>
body{
background-color: #efefef;
font-family: 'Jua', sans-serif;
}
html{
    margin:0 auto;
    
}
#title{
    border-bottom: 1px solid #ddd;
    text-align: center;
    background-color:white;
    font-family: 'Jua', sans-serif;
}
.ui.icon.input > input{
	font-family: 'Jua', sans-serif;
}
input{
	font-family: 'Jua', sans-serif;
}
.ui.left.icon.input{
width:450px;
}
.ui.teal.button{
margin-top: 10px;
width:450px;
height:45px;
font-family: 'Jua', sans-serif;
}
#p-all{
    width:700px;
    height:100%;
    margin:0 auto;
    text-align:center;
    background-color:white;
}
#sub{
    font-size:24px;
}
#p2{
        margin-top:50px;
    opacity: 0;
}
#p3{
    margin-top:50px;
    opacity: 0;
}
#p4{
    margin-top:50px;
    opacity: 0;
}
#blink{
    width:300px;
    height:100px;
}
.ui.red.button{
    float:right;
}
</style>
<body>
    <div id="indexDiv">
        <h1 id="title"><img src="/resources/images/logo.png">Zlack</h1>
        
    </div>
    <div id="p-all">
        <div id="blink"></div>
        <div>
            <p id="sub">${memberLoggedIn.memberId}님, 팀 또는 회사 이름을 입력해주세요.</p>
            <div class="ui left icon input">
              <input type="text" id="WrokSpcaeName" name="WrokSpcaeName" placeholder="팀 또는 회사명을 입력해주세요">
              <i class="users icon"></i>
            </div></br>
            <button class="ui teal button" id="btn-p2" >Next</button>
        </div>
        <div id="p2">
            <p id="sub">팀/회사 에서 진행중인 프로젝트는 무엇입니까?</p>
            <div class="ui checkbox"><input type="checkbox" name="project_develop"><label>팀 프로젝트 개발</label></div>
            <div class="ui checkbox"><input type="checkbox" name="education"><label>교육 목적</label></div>
            <div class="ui checkbox"><input type="checkbox" name="message"><label>업무 메신저</label></div>
            
            </br>
            <div class="ui radio checkbox"><input type="radio" name="radio" checked="checked"><label>공개</label></div>
            <div class="ui radio checkbox"><input type="radio" name="radio" checked="unchecked"><label>비공개</label></div>
            &nbsp;
            <input type="number" min="0" max="10" />명
            </br>
            <div class="ui left icon input">
              <input type="text" placeholder="프로젝트 명을 입력해주세요">
              <i class="users icon"></i>
            </div></br>
            <button class="ui teal button" id="btn-p3" onclick="go_p3();">Next</button>
        </div>
        <div id="p3">
            <p id="sub">팀 채널이 만들어졌습니다!</p>
            <button class="ui teal button" onclick="goto_workspace();"><i class="sign in alternate icon"></i>메인으로가기</button>
        </div>
        
    </div>
</body>
<script>
$( document ).ready( function() {
   $( '#btn-p2' ).click( function() {
     $( '#p2' ).fadeTo(1000,1);
   }
   );
 } );
$( document ).ready( function() {
   $( '#btn-p3' ).click( function() {
     $( '#p3' ).fadeTo(1000,1);
   } );
 } );
function goto_workspace(){
    location.href = "${pageContext.request.contextPath}/workspace/InsertWorkSpace.do?WrokSpcaeName="+$("#WrokSpcaeName").val();
}
</script>
</html>