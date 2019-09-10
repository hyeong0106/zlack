<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.4.0.js"></script>
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
<html>
</head>
<style>
html{
	overflow: hidden;
	font-family: 'Jua', sans-serif;
}
#indexDiv{
    margin: 0 auto;
    width: 900px;
    height: 600px;
    border-top: 1px solid lightgray;
    margin-top: 58px;
}
#indexDiv section{
    width: 900px;
    height: 500px;
}
#indexDiv section #leftDiv{
    width: 60%;
    float: left;
    height: 470px;
}
#indexDiv section #rightDiv{
    float: right;
    width: 40%;
    height: 470px;
}
#indexDiv section #titleDiv{
    font-weight: bold;
    font-size: 50px;
    color: #333333;
    width: 520px;
    margin: 0px;
    height: 155px;
    margin-left: 20px;
    margin-top: 50px;
    text-align: center;
}
#indexDiv section #contentDiv{
    font-size: 20px;
    color: gray;
    width: 520px;
    height: 70px;
}
#indexDiv section #contentDiv p{
    margin-left: 40px;
}
.btnstyle{
    all: unset;
    font-size: 17px;
    color: white;
    text-align: center;
    line-height: 2.5em;
    border-radius: 4px;
    background-color: #00b5ad;
    width: 170px;
    height: 50px;
    margin-top: 40px;
    font-weight: bold;
    margin-left:190px;
    
}

#indexDiv section #rightDiv img{
    position: relative;
    width: 360px;
    height: 330px;
    top: 60px;
}


#indexDiv section #bottomDiv{
    clear: both;
    width: 900px;
    height: 100px;
    border-top: 1px solid lightgray;
    text-align: center;
}
#indexDiv section #bottomDiv p{
	margin-top: 35px;
	display: inline-block;

}
</style>
<body>
    <div id="indexDiv">
        <section>
            <div id="leftDiv">
                <div id="titleDiv"><p>업무를 공유하는 곳 <br>Zlack</p></div>
                <div id="contentDiv"><p>Zlack은 다수가 같은 업무를 하는데 도와주는 공간이고, 당신의 일을 도울것입니다.한 번 사용해 보세요.</p></div>
                <c:if test="${memberLoggedIn==null}">
        	        	<button class="btnstyle" onclick="nextPage();"> 시 작 하 기</button>
                </c:if>
                <c:if test="${memberLoggedIn!=null}">
 		               <button class="btnstyle" onclick="login_nextPage();">Go WorkSpace</button>
                </c:if>
            </div>
            <div id="rightDiv">
                <img src="${pageContext.request.contextPath }/resources/images/메인이미지.png" id="img-plus" >	
            </div>
            <div id="bottomDiv">
			<p>© 2019 Company, Zlack, Seoul</p>
            </div>
        </section>
    </div>
</body>
<script>
function nextPage(){
	location.href = "${pageContext.request.contextPath}/member/Loginpage.do";
}

function login_nextPage(){
	location.href = "${pageContext.request.contextPath}/member/memberinfo.do";
}

</script>
</html>