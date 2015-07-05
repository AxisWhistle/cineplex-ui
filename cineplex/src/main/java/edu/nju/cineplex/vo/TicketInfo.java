package edu.nju.cineplex.vo;

public class TicketInfo {
	 int id;//对应电影票id
     String hall;//放映厅名字
     String day; //放映日期
     String time;//放映时间
     String seat; //座位号，格式为X排X座
     String name;//电影名称
     int movieId; //可以根据此id跳转到电影详情页面
     double price; //原价
     String discount; // 该电影票的折扣值,如7折，75折。
     double pay; //实际票价
     
     
	public TicketInfo(int id, String hall, String day, String time,
			String seat, String name, int movieId, double price,
			String discount, double pay) {
		super();
		this.id = id;
		this.hall = hall;
		this.day = day;
		this.time = time;
		this.seat = seat;
		this.name = name;
		this.movieId = movieId;
		this.price = price;
		this.discount = discount;
		this.pay = pay;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getHall() {
		return hall;
	}
	public void setHall(String hall) {
		this.hall = hall;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getSeat() {
		return seat;
	}
	public void setSeat(String seat) {
		this.seat = seat;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getMovieId() {
		return movieId;
	}
	public void setMovieId(int movieId) {
		this.movieId = movieId;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getDiscount() {
		return discount;
	}
	public void setDiscount(String discount) {
		this.discount = discount;
	}
	public double getPay() {
		return pay;
	}
	public void setPay(double pay) {
		this.pay = pay;
	}
     
     
}
