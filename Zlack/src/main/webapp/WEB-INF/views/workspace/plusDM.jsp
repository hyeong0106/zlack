<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
	#container{
		width: 900px;
		height: 600px;
	}
	#dmTitle{
		width: 900px;
		height: 50px;
		font-size: 30px;
		font-weight: bold;
		text-align: center;
		padding-top: 100px;
	}
	#leftDiv{
		width:640px;
		height: 70px;
		float: left;
		text-align: right;
	
	
	}
	#rightDiv{
		width:240px;
		height: 70px;
		float: right;
	}
	#leftDiv input[type=text]{
		all:unset;
		font-size: 20px;
		width: 450px;
		height: 50px;
		border: 1px solid black;
		border-radius: 10px;
		text-align: left;
		padding-left: 20px;
	}
	#rightDiv button{
		all:unset;
		color: #1d1c1d;
		width: 100px;
		height: 50px;
		background-color: lightgray;
		border-radius: 5px;
		text-align: center;
		font-weight: bold;
		font-size: 22px;
	}
	#GoBtn{
	 display: inline-block;
	 margin-top: 10px;
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
	#dmContents img{
		width:60px;
		height: 60px;
	}
	
	</style>
<script>
$(function(){
	$("#findMember").keyup(function(e){
		var content = $("#findMember").val();
			$.ajax({
				url: "<%=request.getContextPath()%>/member/findMember",
				data: "content="+content,//파라미터직렬화
				success: function(data){
					$("#dmContents").empty();
					for(var i =0; i < data.length; i++){
						$("#dmContents").append("<form action='${pageContext.request.contextPath}/workspace/UpdateUserChatRoom.do'>"
												+"<div>"
												+"<img class='ui medium rounded image' src='${pageContext.request.contextPath }/resources/images/"+data[i].IMAGE+"'>"
												+"</div><div>"
												+" <input type='text' id='plusMember' name='plusMember' value='"+data[i].MEMBERID+"' readonly='readonly'/>"
												+"</div><div>"
												+"<input type='submit' value='+'/>"
												+"</div></form>");
					}
				}
			});//end of ajax
		});
});
function plusDM(){
	location.href = "${pageContext.request.contextPath}/workspace/plusDM.do";
}
</script>
</head>
<body>	
	<div id="container">
		<div id=dmTitle>
		<p>Direct Message</p>
		</div>
		<div id="leftDiv">
			<input type="text" placeholder="Find or start a conversation" id="findMember"/>
		</div>
		
		<div id="rightDiv"><button>Go</button></div>
		
		<div id=dmContents>
			<c:forEach items="${memberList}" var="m">
			    <form action="${pageContext.request.contextPath}/workspace/UpdateUserChatRoom.do">
			    <div>
			    <img class="ui medium rounded image" src="${pageContext.request.contextPath }/resources/images/${m.IMAGE}">
			    </div>
			    <div>
			    <input type="text" id="plusMember" name="plusMember" value="${m.MEMBERID }" readonly="readonly"/>
			    </div>
			    <div>
			    <input type="submit" value="+"/>
			    </div>
			    </form>
		    </c:forEach>
			
		</div>
	</div>
</body>
</html>
	
