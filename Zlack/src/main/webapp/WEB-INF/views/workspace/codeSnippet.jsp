<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
<script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.3.0/sockjs.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.js"></script>
<!-- 시맨틱 UI -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.css"/>
 <link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
<!----------------------------------------------->
<title>코드 미리보기</title>
</head>
<script>
$(function(){
	window.opener.document.getElementById("message").value='';
	window.opener.document.getElementById("codeType").value = '';
	window.opener.document.getElementById("codeTitle").value = '';
	window.opener.document.getElementById("codeContent").value = '';

});
function sendCodeSnippet(){
	if($("#codeContent").val()==''){
		alert("내용을 입력하세요");
		return;
	}
	$("input[type=radio]").filter(":checked").each(function(){
        window.opener.document.getElementById("codeType").value = this.value;
    });
	window.opener.document.getElementById("codeTitle").value = $("#codeTitle")[0].value;
	window.opener.document.getElementById("codeContent").value = $("#codeContent")[0].value;
	window.close();
}
</script>
<style>
	body{
		font-family: 'Jua', sans-serif;
	}
	.mdl-textfield__input{
		font-family: 'Jua', sans-serif;
	}
	.mdl-button--raised.mdl-button--colored{
		font-family: 'Jua', sans-serif;
	}
	textarea{
		font-family: 'Jua', sans-serif;
	}
	#snippetContent{
		margin:20px;
		margin-top:0px;
	}
	#snippetTitle{
		width: 300px;
		font-size:23px;
		padding:0px;
	}
	#snippetClose{
		text-align: right;
		width:140px;
	}
	#closeBtn{
		all: unset;
		width: 60px;
		height: 60px;
		text-align: center;
		/* border: 1px solid gray; */
		font-size: 30px;
		font-weight: bold;
		/* border-radius: 5px; */
		color:gray;
		}
	#buttonContainer{
		text-align: right;
		padding-top: 10px;
	}
	#checkType{
		padding-left: 10px;
	}
	#checkType>label{
		width:70px;
	}
	#closeBtn:hover{
		color:rgb(63,81,181);
	}
</style>
<body>
	<table id="snippetContent">
		<tr div id="menu">
			<td id="snippetTitle">
				미리보기 생성
			</td>
			<td id="snippetClose">
				<button id="closeBtn" onclick="window.close();">x</button>
			</td>
		</tr>
		<tr>
			<td>
				<form action="#">
				  <div class="mdl-textfield mdl-js-textfield">
				    <input class="mdl-textfield__input" type="text" id="codeTitle">
				    <label class="mdl-textfield__label" for="sample1">Title...</label>
				  </div>
				</form>
			</td>
			<td id="checkType">
				<label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="option-1">
				  <input type="radio" id="option-1" class="mdl-radio__button" name="options" value="JAVA" checked>
				  <span class="mdl-radio__label">JAVA</span>
				</label>
				<label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="option-2">
				  <input type="radio" id="option-2" class="mdl-radio__button" name="options" value="SQL">
				  <span class="mdl-radio__label">SQL</span>
				</label>
			</td>
				
		</tr>
		<tr>
			<td colspan="2">
				<textarea id="codeContent" cols="71" rows="10" style="resize: none;"></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2" id="buttonContainer">
				<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" onclick="sendCodeSnippet();">생성</button>
			</td>
		</tr>
	</table>

    
</body>
<script>

</script>
</html>