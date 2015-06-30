package edu.nju.cineplex.model;

import java.util.Calendar;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="ticket")
public class Ticket {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	@ManyToOne(fetch = FetchType.LAZY ,cascade=CascadeType.ALL)
	@JoinColumn(name="uid")
	private User user;//购票人或售票人(仅在无卡的时候记录售票员) 
	private boolean isCash;//是否为现金支付
	private int rownum;//座位行号
	private int colnum;//座位列号
	private double price;//实际支付价格
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="sid")
	private Schedule schedule;//对应的放映计划=》由此获取电影及放映厅信息票价信息
	private Calendar date;//购票日期
	
	


	public Schedule getSchedule() {
		return schedule;
	}


	public User getUser() {
		return user;
	}


	public void setUser(User user) {
		this.user = user;
	}


	public int getId() {
		return id;
	}


	public void setSchedule(Schedule schedule) {
		this.schedule = schedule;
	}


	public boolean isCash() {
		return isCash;
	}


	public void setCash(boolean isCash) {
		this.isCash = isCash;
	}



	public Calendar getDate() {
		return date;
	}


	public void setDate(Calendar date) {
		this.date = date;
	}


	public int getRownum() {
		return rownum;
	}


	public void setRownum(int rownum) {
		this.rownum = rownum;
	}


	public int getColnum() {
		return colnum;
	}


	public void setColnum(int colnum) {
		this.colnum = colnum;
	}


	public double getPrice() {
		return price;
	}


	public void setPrice(double price) {
		this.price = price;
	}

}
