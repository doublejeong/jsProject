package workSchedule;

import java.sql.Date;
import java.sql.Time;

public class WorkSchedule {

	private int scheduleID;
    private Date date;
    private String dayOfWeek;
    private Integer breakTime;
    private String taskDescription;
    private String userID;
    
	public int getScheduleID() {
		return scheduleID;
	}
	public void setScheduleID(int scheduleID) {
		this.scheduleID = scheduleID;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getDayOfWeek() {
		return dayOfWeek;
	}
	public void setDayOfWeek(String dayOfWeek) {
		this.dayOfWeek = dayOfWeek;
	}
	public Integer getBreakTime() {
		return breakTime;
	}
	public void setBreakTime(Integer breakTime) {
		this.breakTime = breakTime;
	}
	public String getTaskDescription() {
		return taskDescription;
	}
	public void setTaskDescription(String taskDescription) {
		this.taskDescription = taskDescription;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	
	public WorkSchedule() {
		
	}
	
	public WorkSchedule(int scheduleID, Date date, String dayOfWeek, Time startTime, Time endTime, Integer breakTime,
			String taskDescription, String userID) {
		this.scheduleID = scheduleID;
		this.date = date;
		this.dayOfWeek = dayOfWeek;
		this.breakTime = breakTime;
		this.taskDescription = taskDescription;
		this.userID = userID;
	}

}
