package edu.nju.cineplex.dao;

import java.sql.Date;
import java.util.List;

import edu.nju.cineplex.model.Movie;

public interface MovieDao {
	
	public void save(Movie Movie);
	
//	public Movie findByName(String name);
	
	public List<Movie> getAllMovies();
	
	public void update(Movie Movie); 
	
	public Movie load(int id);

	public int getMaxId();

	public List<Movie> getMoviesOnAfter(Date instance);

	public List<Movie> getMoviesOffAt(Date date);
}
