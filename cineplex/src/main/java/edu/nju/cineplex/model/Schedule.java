package edu.nju.cineplex.model;

import java.util.Calendar;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

@Entity
@Table(name="schedule")
public class Schedule {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	private Calendar time;//计划开始的时间
	private Calendar end;//计划结束时间
	
	
	private double price;//售价
	private int granted=0;//0为待批准，1为已批准，2为不批准
	@OneToMany(mappedBy="schedule")
	@LazyCollection(LazyCollectionOption.FALSE)
	private Set<Ticket> tickets;
	
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="mid")
	private Movie movie;//电影
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="hid")
	private Hall hall;//放映厅
	
	@ManyToMany(mappedBy="schedules")
	@LazyCollection(LazyCollectionOption.FALSE)
	private Set<Question> questions;

	public Schedule(){
		tickets=new HashSet<Ticket>();
		questions=new HashSet<Question>();
	}
	public void addTicket(Ticket ticket){
		tickets.add(ticket);
	}
	public void addQuestion(Question question){
		questions.add(question);
	}
	
	public Set<Ticket> getTickets() {
		return tickets;
	}
	public void setTickets(Set<Ticket> tickets) {
		this.tickets = tickets;
	}
	public Set<Question> getQuestions() {
		return questions;
	}
	public void setQuestions(Set<Question> questions) {
		this.questions = questions;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public Movie getMovie() {
		return movie;
	}
	public void setMovie(Movie movie) {
		this.movie = movie;
	}
	public Hall getHall() {
		return hall;
	}
	public void setHall(Hall hall) {
		this.hall = hall;
	}
	public Calendar getTime() {
		return time;
	}
	public void setTime(Calendar time) {
		this.time = time;
	}
	
	public Calendar getEnd() {
		return end;
	}
	public void setEnd(Calendar end) {
		this.end = end;
	}
	public int getId(){
		return id;
	}
	public int getGranted() {
		return granted;
	}
	public void setGranted(int granted) {
		this.granted = granted;
	}
	
	

}
