<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="workSchedule.WorkScheduleDAO" %>
<%@ page import="workSchedule.WorkSchedule" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Time" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>JS Project</title>
<style type="text/css">
	a, a:hover {
		color: #000000;
		text-decoration: none;
	}
</style>
</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		int pageNumber = 1;
		if (request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
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
		<section class="container">
			<form method="get" action="workSchedule.jsp" class="form-inline mt-3">
				<select name="lectureDivide" class="form-control mx-1 mt2">
					<option value="전체">전체</option>
					<option value="전체">전체</option>
					<option value="전체">전체</option>
				</select>
				<input type="text" name="search" class="form-control mx-1 mt-2" placeholder="search">			
				<button type="submit" class="btn btn-primary mx-1 mt-2">검색</button>
				<a class="btn btn-primary mx-1 mt-2" data-toggle="modal" href="#registerModal">投稿する</a>
				<a class="btn btn-danger mx-1 mt-2" data-toggle="modal" href="#reportModal">신고</a>
			</form>
		</section>
	
		<div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title" id="modal">作業報告書</h3>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<form action="ws_writeAction.jsp" method="post">
							<div class="form-row">
								<div class="form-group col-sm-4">
							 		<label>日</label>
										<input type="date" class="form-control" name="workDate">
				 				</div>
								<div class="form-group col-sm-4">
							 		<label>曜日</label>
						 			<select name="dayOfWeek" class="form-control">
						 				<option value="Sunday" selected>日曜日</option>
					                    <option value="Monday">月曜日</option>
					                    <option value="Tuesday">火曜日</option>
					                    <option value="Wednesday">水曜日</option>
					                    <option value="Thursday">木曜日</option>
					                    <option value="Friday">金曜日</option>
					                    <option value="Saturday">土曜日</option>
					 				</select>
				 				</div>
				 				<div class="form-group col-sm-4">
						 			<label>勤務</label>
						 			<select name="workType" class="form-control">
						 				<option value="work" selected>出</option>
					                    <option value="holiday">休</option>
					                    <option value="substituteWork">代</option>
					                    <option value="absence">欠</option>
					                    <option value="holidayWork">休出</option>
					                    <option value="summerVacation">夏季</option>
					                    <option value="lastYear">年末</option>
					                    <option value="special">特別</option>
						 			</select>
						 		</div>
							</div>
						 	<div class="form-row">
						 		<!-- 
						 		<div class="form-group col-sm-4">
							 		<label>開始</label>
						 			<input type="time" class="form-control" name="startTime">
				 				</div>
						 		<div class="form-group col-sm-4">
							 		<label>終了</label>
						 			<input type="time" class="form-control" name="endTime">
				 				</div>
				 				--> 
						 		<div class="form-group col-sm-4">
							 		<label>休憩時間</label>
						 			<select name="breakTime" class="form-control">
						 				<option value="10">10分</option>
						 				<option value="20">20分</option>
						 				<option value="30">30分</option>
						 				<option value="40">40分</option>
						 				<option value="50">50分</option>
						 				<option value="60" selected>60分</option>
						 				<option value="70">70分</option>
						 				<option value="80">80分</option>
						 				<option value="90">90分</option>
						 				<option value="100">100分</option>					                    
						 				<option value="110">110分</option>					                    
						 				<option value="120">120分</option>					                    
						 			</select>
				 				</div>
							</div>
							<div class="form-group">
								<label>作業内容</label>
								<textarea name="taskDescription" class="form-control" maxlength="2048" placeholder="作業内容を入力してください" style="height: 180px;"></textarea>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary" data-dismiss="modal">キャンセル</button>
								<button type="submit" class="btn btn-primary">登録</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	
	
	
		

		
		
		
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">日</th>
						<th style="background-color: #eeeeee; text-align: center;">曜日</th>
						<th style="background-color: #eeeeee; text-align: center;">勤務</th>
						<th style="background-color: #eeeeee; text-align: center;">開始</th>
						<th style="background-color: #eeeeee; text-align: center;">終了</th>
						<th style="background-color: #eeeeee; text-align: center;">休憩時間</th>
						<th style="background-color: #eeeeee; text-align: center;">作業時間</th>
						<th style="background-color: #eeeeee; text-align: center;">作業内容</th>
					</tr>
				</thead>
				<tbody>
				     
				</tbody>
			</table>
		</div>
	</div>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>