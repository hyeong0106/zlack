<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="kh.finalpj.zlack.analysis.model.vo.*" %>
<%@ page import="kh.finalpj.zlack.member.model.vo.*" %>
<%@ page import="java.util.*" %>
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
<%
	String type = (String)request.getAttribute("type");
		//유저 채널 사용량 통계 가져오기
		List<UseChannelAnalysis> UseChannelAnalysisList = (List<UseChannelAnalysis>)request.getAttribute("UseChannelAnalysisList");
		UseChannelAnalysis[] UseChannelAnalysisArray = new UseChannelAnalysis[UseChannelAnalysisList.size()];
		for(int a=0; a<UseChannelAnalysisList.size(); a++){
			UseChannelAnalysisArray[a] = UseChannelAnalysisList.get(a);
		}
		//유저가 가입한 채널 가져오기
		List<String> UserChannelList = (List<String>)request.getAttribute("UserChannelList");
		String[] channelName = new String[UserChannelList.size()];
		for(int i=0; i<UserChannelList.size(); i++){
			channelName[i] = UserChannelList.get(i);
			System.out.println("s"+channelName[i]);
		}
		//오늘날짜의 달
		int todayMonth = (Integer)request.getAttribute("todayMonth");
		
		//MemberJoinList, MemberLeaveList 가져오기
		List<Member> memberJoinList = (List<Member>)request.getAttribute("memberJoinList");
		Member[] memberJoinArray = new Member[memberJoinList.size()];
		for(int i=0; i<memberJoinList.size(); i++){
			memberJoinArray[i] = memberJoinList.get(i);
		}
		
		List<Member> memberLeaveList = (List<Member>)request.getAttribute("memberLeaveList");
		Member[] memberLeaveArray = new Member[memberLeaveList.size()];
		for(int i=0; i<memberLeaveList.size(); i++){
			memberLeaveArray[i] = memberLeaveList.get(i);
		}
%>

<script src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.min.js"></script>
    <style>
    body{
    	font-family: 'Jua', sans-serif;
    }
    #AnalyticsDiv{
        width: 900px;
        height: 600px;
        margin: 0 auto;
        background-color: rgb(224, 224, 224);
    }
    #AnalyticsDiv header{
        width: 900px;
        height: 68px;
        margin: 0 auto;
        box-shadow: rgb(190, 190, 190) 0px 3px 3px 0px;
        background-color: white;
        line-height: 58px;
    }
    #AnalyticsDiv header div{
        font-size: 30px;
        font-weight: bold;
        color: #333333;
        font-family: Sunflower;
        display: inline-block;
        position: relative;
        bottom: 20px;
        left: 10px;
        width: 300px;
        height: 60px;
        font-family: 'Jua', sans-serif;
    }
    #AnalyticsDiv section{
        width: 900px;
        height: 500px;
        margin: 0 auto;
    }
    #AnalyticsDiv section #AnalyticsTitle{
        width: 750px;
        height: 50px;
        margin: 0 auto;
    }
    #AnalyticsDiv section #AnalyticsTitle p{
        font-size: 30px;
        font-weight: bold;
        color: #333333;
        font-family: Sunflower;
        font-family: 'Jua', sans-serif;
    }
    #AnalyticsDiv section #AnalyticsType{
        width: 750px;
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
        font-family: 'Jua', sans-serif;
    }
    #AnalyticsDiv section #AnalyticsType #UserBtn{
        background-color: rgb(224, 224, 224);
        color: rgb(22, 160, 133);
    }
    #AnalyticsDiv section #AnalyticsType #ChannelBtn{
        background-color: rgb(224, 224, 224);
        color: rgb(22, 160, 133);
    }
    #AnalyticsDiv section #AnalyticsType #EtcBtn{
        background-color: rgb(224, 224, 224);
        color: rgb(22, 160, 133);
    }
    #AnalyticsDiv section #AnalyticsContents{
        width: 750px;
        height: 380px;
        margin: 0 auto;
        background-color: white;
    }
     #AnalyticsDiv section #AnalyticsContents #chart_div{
    }
    
    #AnalyticsDiv footer{
        width: 900px;
        height: 100px;
        margin: 0 auto;
    }
    </style>
    <script>
    function goChating() {
        location.href="${pageContext.request.contextPath}/workspace/WorkSpaceMain.do";
    }
    $(function(){
    	type = "<%=type%>"
    	
    	if(type=="총 사용량" || type=="null"){
    		$("#UserBtn").css({"background": "white", "color":"black"});
    	}
    	else if(type=="월 별 사용량"){
    		$("#ChannelBtn").css({"background": "white", "color":"black"});
    	}
    	else if(type=="기타"){
    		$("#EtcBtn").css({"background": "white", "color":"black"});
    	}
    });
    function clickMenu(e){
    	var type = e.innerHTML;
    	location.href="${pageContext.request.contextPath }/analysis/analysisForm.do?type="+type;
    }
    </script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <!-- 원그래프 -->
    <script type="text/javascript">

      // Load the Visualization API and the corechart package.
      google.charts.load('current', {'packages':['corechart']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.charts.setOnLoadCallback(drawChart);

      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.
      function drawChart() {

        // Create the data table.
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Topping');
        data.addColumn('number', 'Slices');
        data.addRows([
        <%for(int a = 0; a<channelName.length; a++){%>
        
	        <%for(int b = 0; b<UseChannelAnalysisArray.length; b++){%>
	        	<%if(UseChannelAnalysisArray[b].getAnalysisMonth().equals(todayMonth+"월")){%>
	        		<%if(UseChannelAnalysisArray[b].getChannelName().equals(channelName[a])){%>
	        		  ['<%=channelName[a]%>',<%=UseChannelAnalysisArray[b].getAmountChatting()%>],
	        		<%}%>
	        	<%}%>
	        <%}%>
        <%}%>
        ]);

        // Set chart options
        var options = {'title':'워크스페이스별 홈페이지 사용량',
                       'width':550,
                       'height':370};

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
    </script>
    <!--세로축그래프 -->
    <script type="text/javascript">
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
        
          ['월',
        	  <%for(int i = 0; i<channelName.length; i++){
        		  if(i==(channelName.length-1)){%>
        	  		'<%=channelName[i]%>' 
        	  	<%} else{%>
        	  		'<%=channelName[i]%>',
        	  	<%}
        	  }%>
        	],
		<%for(int i= 3; i>=0; i--){
			if(i==0){%>
				['<%=todayMonth%>'+'월', 
					 <%for(int j = 0; j<channelName.length; j++){%>
					 	<%for(int a = 0; a<UseChannelAnalysisArray.length; a++){%>
					 		<%if(UseChannelAnalysisArray[a].getAnalysisMonth().equals(todayMonth+"월")){%>
					 			<%if(UseChannelAnalysisArray[a].getChannelName().equals(channelName[j])){%>
					 				<%=UseChannelAnalysisArray[a].getAmountChatting()%>,
					 			<%}%>
					 		<%}%>
						<%}%>
		        	  <%}%>]
			<%}else{%>
				['<%=todayMonth-i%>'+'월', 
				 <%for(int j = 0; j<channelName.length; j++){%>
				 	<%for(int a = 0; a<UseChannelAnalysisArray.length; a++){%>
				 		<%if(UseChannelAnalysisArray[a].getAnalysisMonth().equals(todayMonth-i+"월")){%>
				 			<%if(UseChannelAnalysisArray[a].getChannelName().equals(channelName[j])){%>
				 				<%=UseChannelAnalysisArray[a].getAmountChatting()%>,
				 			<%}%>
				 		<%}%>
					<%}%>
	        	  <%}%>],
			<%}
		}%>
        ]);

        var options = {
          chart: {
            title: '각 워크스페이스의 월 별 사용량',
            subtitle: 
            	<%for(int i = 0; i<channelName.length; i++){
          		  if(i==(channelName.length-1)){%>
          			'<%=channelName[i]%>'+ 
          	  	<%} else{%>
          	 	 	'<%=channelName[i]%>,'+
          	  	<%}
          	  }%>'의 사용량 : '+'${todayMonth-3}'+'월~'+'${todayMonth}'+'월'
          }
        };

        var chart = new google.charts.Bar(document.getElementById('columnchart_material'));

        chart.draw(data, google.charts.Bar.convertOptions(options));
      }
    </script>
    <!-- 꺽은선 그래프  -->
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Month', '가입자수', '탈퇴자수'],
  		<%for(int i= 3; i>=0; i--){
  			int joincount = 0;
  			int leavecount = 0;
  			for(int a=0; a<memberJoinList.size(); a++){%>
  				<%if((memberJoinArray[a].getEnrollDate()).toString().substring(6, 7).equals(String.valueOf(todayMonth-i))){
  					joincount++;
  				}%>
  			<%}%>
  			<%for(int b=0; b<memberLeaveList.size(); b++){%>
				<%if((memberLeaveArray[b].getEnrollDate()).toString().substring(6, 7).equals(String.valueOf(todayMonth-i))){
					leavecount++;
				}%>
			<%}%>
			['<%=todayMonth-i%>월',<%=joincount%>,<%=leavecount%>],
  		<%}%>
        ]);
        var options = {
          title: '전체 가입자수 통계',
          hAxis: {title: 'Month',  titleTextStyle: {color: '#333'}},
          vAxis: {minValue: 0}
        };

        var chart = new google.visualization.AreaChart(document.getElementById('Line_graph'));
        chart.draw(data, options);
      }
    </script>
</head>
<body>
    <div id="AnalyticsDiv">
        <header>
           <img src="${pageContext.request.contextPath }/resources/images/home.png" alt="집사진" width=60px; height=60px; style="margin-left: 10px; cursor: pointer;" onclick="goChating();"/>
           <div>${memberLoggedIn.nickName }</div>
       </header>
        <section>
            <div id="AnalyticsTitle">
                <p>통계</p>
            </div>
            <div id="AnalyticsType">
            <button id="UserBtn" onclick="clickMenu(this)">총 사용량</button>
            <button id="ChannelBtn" onclick="clickMenu(this)">월 별 사용량</button>
            <button id="EtcBtn" onclick="clickMenu(this)">기타</button>
            </div>
            <div id="AnalyticsContents">
            	<c:if test="${type == '총 사용량' || type == null}">
					<div id="chart_div" style="margin-left: 160px;"></div>
				</c:if>
				<c:if test="${type == '월 별 사용량'}">
					 <div id="columnchart_material" style="width: 690px; height: 340px; margin-left: 35px; padding-top: 30px;"></div>
				</c:if>
				<c:if test="${type == '기타'}">
					<div id="Line_graph" style="width: 100%; height: 350px;"></div>
				</c:if>
            </div>
        </section>
        
        <footer>

        </footer>
    </div>
</body>
</html>