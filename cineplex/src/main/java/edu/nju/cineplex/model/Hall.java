package edu.nju.cineplex.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

@Entity
@Table(name="hall")
public class Hall {
	/**
	 * 放映厅
	 * 
	 */
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	private String name;
	private int seatrow;//影院座位行
	private int seatcolumn;//影院座位列数
	@OneToMany(mappedBy="hall")
	@LazyCollection(LazyCollectionOption.EXTRA)
	private Set<Schedule> schedules;//在该放映厅的放映计划
	
	
	public Hall(){
		schedules=new HashSet<Schedule>();
	}
	
	public void addSchedule(Schedule schedule){
		schedules.add(schedule);
	}
	
	public int getId() {
		return id;
	}


	public Set<Schedule> getSchedules() {
		return schedules;
	}

	public void setSchedules(Set<Schedule> schedules) {
		this.schedules = schedules;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}


	public int getSeatrow() {
		return seatrow;
	}


	public void setSeatrow(int seatrow) {
		this.seatrow = seatrow;
	}


	public int getSeatcolumn() {
		return seatcolumn;
	}


	public void setSeatcolumn(int seatcolumn) {
		this.seatcolumn = seatcolumn;
	}
	
	

}
