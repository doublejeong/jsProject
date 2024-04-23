<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>JS Project</title>
</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
	%>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span>	
				<span class="icon-bar"></span>	
				<span class="icon-bar"></span>	
			</button>
			<a class="navbar-brand" href="main.jsp">（株）ミリネグローバル</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">ホーム</a></li>
				<li><a href="bbs.jsp">掲示板</a></li>
				<li class="active"><a href="workSchedule.jsp">勤務表</a></li>
			</ul>
			<%
				if(userID == null) {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">接続<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="login.jsp">ログイン</a></li>
					<li><a href="join.jsp">会員登録</a></li>
				</ul>
				</li>
			</ul>
			<%
				} else {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">会員管理<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="logoutAction.jsp">ログアウト</a></li>
				</ul>
				</li>
			</ul>		
			<%
				}
			%>
		</div>
	</nav>
	<div class="container">
		<div class="row">
			<form method="post" action="ws_writeAction.jsp">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				    <thead>
				        <tr>
				            <th colspan="7" style="background-color: #eeeeee; text-align: center;">作業報告書</th>
				        </tr>
		                <tr>
						    <th rowspan="2">日</th>
						    <th rowspan="2">曜日</th>
						    <th rowspan="2">勤務</th>
						    <th colspan="2">作業時間帯</th>
						    <th rowspan="2">休憩時間</th>
						</tr>
						<tr>
						    <th>開始</th>
						    <th>終了</th>
						</tr>
				    </thead>
				    <tbody>
				        <tr>
				            <td><input type="date" class="form-control" name="workDate"></td>
				            <td>
				                <select class="form-control" name="dayOfWeek">
				                    <option value="Sunday">日曜日</option>
				                    <option value="Monday">月曜日</option>
				                    <option value="Tuesday">火曜日</option>
				                    <option value="Wednesday">水曜日</option>
				                    <option value="Thursday">木曜日</option>
				                    <option value="Friday">金曜日</option>
				                    <option value="Saturday">土曜日</option>
				                </select>
				            </td>
				            <td>
				                <select class="form-control" name="workType">
				                    <option value="work">出</option>
				                    <option value="holiday">休</option>
				                    <option value="substituteWork">代</option>
				                    <option value="absence">欠</option>
				                    <option value="holidayWork">休出</option>
				                    <option value="summerVacation">夏季</option>
				                    <option value="lastYear">年末</option>
				                    <option value="special">特別</option>
				                </select>
				             </td>
                            <td><input type="time" class="form-control" name="startTime"></td>
                            <td><input type="time" class="form-control" name="endTime"></td>
                            <td><input type="time" class="form-control" name="breakTime"></td>
                        </tr>
                        <tr>
                       		<th rowspan="2">作業内容</th>
                       	</tr>
                       	
                        <tr>
                            <td colspan="7"><textarea class="form-control" placeholder="作業内容を入力してください" name="taskDescription" maxlength="2048" style="height: 100px;"></textarea></td>
                        </tr>
                    </tbody>
                </table>
                <input type="submit" class="btn btn-primary pull-right" value="投稿">
            </form>
        </div>
    </div>
    <script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
</body>
</html>