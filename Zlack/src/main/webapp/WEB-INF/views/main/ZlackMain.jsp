<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    <title>메인페이지</title>
    <script src="https://code.jquery.com/jquery-3.4.0.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <style>
        body{
            margin: 0;
            color: rgb(178,159,179);
        }
        #client-ui{
            display: flex;
        }
        #leftDiv{
            width: 220px;
            background: #3f0e40;
            height: 916px;
        }
        #workspaceName{
            padding-top: .5625rem!important;
        }
        #workspaceName span{
            font-size: 1.125rem;
            line-height: 1.375;
            color: white;
            font-weight: 900;
        }
        ul>li{
            list-style: none;
        }
        #client_header{
            height: 70px;
        }
        #client_header h2{
            color: black;
            margin: 0;
            padding-left: 20px;
            padding-top: 10px;
        }
        #messageDiv{
            background: lightgray;
            height: 780px;
            width: 704px;
            margin-left: 20px;
        }
        #messageInputDiv{
            margin-left: 20px;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div id="client-ui">
       <div id="leftDiv">
            <div id="workspaceName">
                <span>khM190108</span>
                <button>^</button>
            </div>
            <div id="channels">
                <ul>
                    <li>Channels</li>
                    <li>#for_slack_beginner</li>
                    <li>#general</li>
                    <li>#project</li>
                    <li>#random</li>
                    <li>#right__2</li>
                    <li>#술턷</li>
                    <li>#실습문제</li>
                </ul>
            </div>
            <div id="directMessages">
                <ul>
                    <li>Direct Messages</li>
                    <li>dahee</li>
                    <li>jae Hun</li>
                    <li>wewe</li>
                    <li>김형민</li>
                    <li>나태운</li>
                    <li>세웅</li>
                    <li>이수현</li>
                    <li>최예림</li>
                    <li>허준혁</li>
                    <li>형무</li>
                </ul>
            </div>
       </div>
       <div id="rightDiv">
            <div id="client_header">
                <h2>#general</h2>
            </div>
            <div id="messageDiv">
			<textarea id="messageData" cols="98" rows="32" readonly="readonly"></textarea>
            </div>
            <div id="messageInputDiv">
                <div class="input-group input-group-lg">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="inputGroup-sizing-lg">+</span>
                    </div>
                    <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" >
                </div>
            </div>
       </div>
    </div>
    <!-- Server responses get written here -->
    <div id="messages"></div>
</body>
</html>