package edu.nju.cineplex.model;

import java.util.Calendar;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;


@Entity
@Table(name="movie")
public class Movie {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	private String name;
	private String cover="assets/images/1.jpg";
	@Column(columnDefinition="text")
	private String introduction;//影片介绍
	private String actor;//主演
	private String type;//影片类型
	private int duration;//持续的时长
	private String language;
	
	private String director;
	
	@OneToMany(mappedBy="movie")
	@LazyCollection(LazyCollectionOption.FALSE)
	private Set<Schedule> schedules;
	
	//影片下线时间
	private Calendar offTime;
	//影片上线时间
	private Calendar onTime;
	
	public void setSchedules(Set<Schedule> schedules) {
		this.schedules = schedules;
	}
	@OneToMany(mappedBy="movie")
	@LazyCollection(LazyCollectionOption.EXTRA)
	private Set<Question> questions;
	
	public Movie(){
		schedules=new HashSet<Schedule>();
		setQuestions(new HashSet<Question>());
	}
	public void addSchedule(Schedule schedule){
		schedules.add(schedule);
	}
	public void addQuestion(Question question){
		questions.add(question);
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCover() {
		return cover;
	}
	public void setCover(String cover) {
		this.cover = cover;
	}
	public int getId() {
		return id;
	}
	
	public Set<Schedule> getSchedules() {
		return schedules;
	}
	public void setSchedule(Set<Schedule> schedules) {
		this.schedules = schedules;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getDuration() {
		return duration;
	}

	public void setDuration(int duration) {
		this.duration = duration;
	}
	public String getActor() {
		return actor;
	}
	public void setActor(String actor) {
		this.actor = actor;
	}
	public Set<Question> getQuestions() {
		return questions;
	}
	public void setQuestions(Set<Question> questions) {
		this.questions = questions;
	}
	
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	public Calendar getOffTime() {
		return offTime;
	}
	public void setOffTime(Calendar offTime) {
		this.offTime = offTime;
	}
	public Calendar getOnTime() {
		return onTime;
	}
	public void setOnTime(Calendar onTime) {
		this.onTime = onTime;
	}


	

}
