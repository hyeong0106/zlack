<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
<script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
 <link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
<!doctype html>
<html lang="en">
<head>
	<script src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.min.js"></script>
	<meta charset="UTF-8" />
	<title>Document</title>
	
	<style>
	body *{
		font-family: 'Jua', sans-serif;
		margin: 0 auto;
		overflow: hidden;
	}
	.mdl-textfield__input{
		font-family: 'Jua', sans-serif;
	}
	#container{
		width: 900px;
		height: 600px;
	}
	.mdl-button--fab.mdl-button--colored{
    	background: rgb(63,81,181);
	}
	.mdl-textfield__label{
		color: #9e9e9e;
	}

	.mdl-button--fab.mdl-button--colored{
		margin-bottom: 60px;
		margin-left: 10px;
	}
	.mdl-button mdl-js-button mdl-button--icon:hover{
		background: rgb(63,81,181);
	}
	#dmTitle p{
		width: 900px;
		height: 50px;
		font-size: 30px;
		font-weight: bold;
		text-align: center;
		padding-top: 100px;
	}
	#leftDiv{
		width:640px;
		height: 83px;
		float: left;
		text-align: right;
	
	}
	#rightDiv{
		width:240px;
		height: 70px;
		float: right;
	}
	#dmContents{
		width: 600px;
		height: 300px;
		clear: both;
		text-align: center;
		overflow: auto;
		
	}
	#dmContents form{
		border-top: 1px solid lightgray;
		width: 500px;
		height: 60px;
	}
	#dmContents form div{
	display: inline-block;
	height: 60px;
	}
	#dmContents input[type=text]{
		all:unset;
		text-align: center;
		width: 300px;
		height: 60px;
		font-size: 20px;
	}
	#dmContents input[type=submit]{
		all:unset;
		width: 50px;
		height: 50px;
		background-color: #226aa7;
		border-radius: 20%;
		color: white;
		font-weight: bold;
		font-size: 20px;
		margin-top : 5px;
		
		}
	#dmContents form:hover{
		background: #6db9dc40;
	}
	.mdl-button--icon{
		border-radius: 0;
		height:52px;
		margin-bottom: 5px;
	}
	.mdl-button--icon .material-icons{
	    top: 40%;
	}
	.mdl-button--icon p{
		padding-top: 26px;
	}
	
	</style>
<script>
	function validate(){
		<c:forEach items="${AllChannelList}" var="m">
		if($(".ChannelName").val()==''){
			alert("채널명을 입력하세요.");
			return false;
		}
		if($(".ChannelName").val()=='${m.CHANNELNAME}'){
			alert("이미 사용중인 채널명입니다.");
			return false;
		}
		</c:forEach>
		return true; 
	}
</script>
</head>
<body>	
	<div id="container">
		<div id="dmTitle">
		<p>Create Channel</p>
		</div>
		<div id="leftDiv">
			<form action="${pageContext.request.contextPath}/workspace/UpdateUserChatChanel.do" 
				  name="validateChannel" 
				  onsubmit="return validate();">
				  <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				    <input class="mdl-textfield__input ChannelName" type="text" id="ChannelName" name="ChannelName">
				    <label class="mdl-textfield__label" for="sample3">생성할 채널이름을 입력하세요(중복불가)</label>
				  </div>
				  <input type="number" id="ChannelNO" name="ChannelNO" value="-100" hidden/>
				  <button type="submit" class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab mdl-button--colored" id="addBtn">
				  	<i class="material-icons">add</i>
				  </button>
			</form>
		</div>
		<div id=dmContents>
			<c:forEach items="${ChannelList}" var="m">
			<form action="${pageContext.request.contextPath}/workspace/UpdateUserChatChanel.do">
					<input type="text" id="ChannelName" name="ChannelName" value="${m.CHANNELNAME }" readonly/>
					<input type="number" id="ChannelNO" name="ChannelNO" value="${m.CHATROOMNO }" hidden/>
				    <button class="mdl-button mdl-js-button mdl-button--icon" type="submit">
					  <i class="material-icons">mood</i>
					  <p>join</p>
					</button>

			</form>
			</c:forEach>
			
		</div>
	</div>
</body>
</html>
	
