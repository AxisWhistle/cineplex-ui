package edu.nju.cineplex.vo;

public class ScheduleInfo {
	
	 int id;//对应放映计划的id
     String day; //放映日期----------如果想做成格瓦拉那样的，在js根据这个字段处理分组就行
     String weekday;//周几
     String time;//放映时间
     String hall; //放映厅名字
     int remain;//余票
     int total; //总票数
     MovieInfo movie;
     double price; //原价
	public ScheduleInfo(int id, String day, String weekday, String time,
			String hall, int remain, int total, MovieInfo movie, double price) {
		super();
		this.id = id;
		this.day = day;
		this.weekday = weekday;
		this.time = time;
		this.hall = hall;
		this.remain = remain;
		this.total = total;
		this.movie = movie;
		this.price = price;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getWeekday() {
		return weekday;
	}
	public void setWeekday(String weekday) {
		this.weekday = weekday;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getHall() {
		return hall;
	}
	public void setHall(String hall) {
		this.hall = hall;
	}
	public int getRemain() {
		return remain;
	}
	public void setRemain(int remain) {
		this.remain = remain;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public MovieInfo getMovie() {
		return movie;
	}
	public void setMovie(MovieInfo movie) {
		this.movie = movie;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}

	
}
