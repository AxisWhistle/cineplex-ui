package edu.nju.cineplex.model.VO;

import java.util.ArrayList;
import java.util.List;

import edu.nju.cineplex.model.*;

public class MovieVO {
	private List<Movie> movies;
	private List<Hall> halls;
	private List<Schedule> schedules;
	
	public MovieVO(List<Schedule> schedules){
		movies=new ArrayList<Movie>();
		halls=new ArrayList<Hall>();
		this.setSchedules(schedules);
		init();
	}
	
	private void init() {
		
		for(Schedule schedule:schedules){
			Movie movie=schedule.getMovie();
			if(!movies.contains(movie)){
				movies.add(movie);
			}
			
			Hall hall=schedule.getHall();
			if(!halls.contains(hall)){
				halls.add(hall);
			}
		}
		
	}

	public void addMovie(Movie movie){
		movies.add(movie);
	}
	public void addHall(Hall hall){
		halls.add(hall);
	}
	
	public List<Movie> getMovies() {
		return movies;
	}
	public void setMovies(List<Movie> movies) {
		this.movies = movies;
	}
	public List<Hall> getHalls() {
		return halls;
	}
	public void setHalls(List<Hall> halls) {
		this.halls = halls;
	}
	public List<Schedule> getSchedules() {
		return schedules;
	}
	public void setSchedules(List<Schedule> schedules) {
		this.schedules = schedules;
	}
	
	

}
