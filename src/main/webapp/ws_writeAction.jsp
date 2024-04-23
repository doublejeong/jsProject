<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="workSchedule.WorkSchedule" %>
<%@ page import="workSchedule.WorkScheduleDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="workschedule" class="workSchedule.WorkSchedule" scope="page" />
<jsp:setProperty name="workschedule" property="date" />
<jsp:setProperty name="workschedule" property="dayOfWeek" />
<jsp:setProperty name="workschedule" property="breakTime" />
<jsp:setProperty name="workschedule" property="taskDescription" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JS Project</title>
</head>
<body>
    <%
        String userID = null;
        if (session.getAttribute("userID") != null) {
            userID = (String) session.getAttribute("userID");
        }
        if (userID == null) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('ログインしてください');");
            script.println("location.href = 'login.jsp';");
            script.println("</script>");
            script.close();
        } else {         
            if (workschedule.getDate() == null || workschedule.getDayOfWeek() == null ||
                workschedule.getBreakTime() == null || workschedule.getTaskDescription() == null) {                  
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('入力されていない事項があります');");
                script.println("history.back()");
                script.println("</script>");
           		script.close();
           		return;
            } else {
                WorkScheduleDAO workScheduleDAO = new WorkScheduleDAO();
                
                Integer breakTime = Integer.parseInt(request.getParameter("breakTime"));
                int result = workScheduleDAO.write(0, workschedule.getDate(), workschedule.getDayOfWeek(),
                			breakTime, workschedule.getTaskDescription());

            	                
                if (result == -1) {
                    PrintWriter script = response.getWriter();
                    script.println("<script>");
                    script.println("alert('書き物に失敗しました');");
                    script.println("history.back()");
                    script.println("</script>");
                }
                else {
                    PrintWriter script = response.getWriter();
                    script.println("<script>");
                    script.println("location.href = 'workSchedule.jsp';");
                    script.println("</script>");
                    
                }
            }
        }
    %>
</body>
</html>
