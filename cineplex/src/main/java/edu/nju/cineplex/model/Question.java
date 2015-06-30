package edu.nju.cineplex.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.*;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

@Entity
@Table(name="question")
public class Question {
	/**
	 * 制定的活动问题
	 * 与movie一对一=》
	 * 与schedule多对多activity
	 * 一个对应多个option=>表option
	 * 
	 */
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	//问题描述
	private String ques;
	
	private int credit;
	
	//为某个电影指定活动
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="mid")
	private Movie movie;
	
	
	@ManyToMany
	@JoinTable(name="activity",joinColumns={@JoinColumn(name="qid")},
		inverseJoinColumns={@JoinColumn(name="sid")})
	@LazyCollection(LazyCollectionOption.FALSE)
	private Set<Schedule> schedules;
	
	
	

	@OneToMany(mappedBy="question",cascade=CascadeType.ALL)
	@LazyCollection(LazyCollectionOption.FALSE)
	private Set<Options> options;
	
	
	
	public Question(){
		schedules = new HashSet<Schedule>();
		options=new HashSet<Options>();
	}
	
	public void addSchedule(Schedule schdule){
		schedules.add(schdule);
	}
	
	public void addOption(Options option){
		options.add(option);
	}

	public String getQues() {
		return ques;
	}

	public void setQues(String ques) {
		this.ques = ques;
	}

	public Set<Schedule> getSchedules() {
		return schedules;
	}

	public void setSchedules(Set<Schedule> schedules) {
		this.schedules = schedules;
	}

	public Set<Options> getOptions() {
		return options;
	}

	public void setOptions(Set<Options> options) {
		this.options = options;
	}
	
	

	
	
	public Movie getMovie() {
		return movie;
	}

	public void setMovie(Movie movie) {
		this.movie = movie;
	}

	public int getId() {
		return id;
	}

	public int getCredit() {
		return credit;
	}

	public void setCredit(int credit) {
		this.credit = credit;
	}

}
