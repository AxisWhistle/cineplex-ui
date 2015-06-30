package edu.nju.cineplex.service;

import java.util.List;

import edu.nju.cineplex.model.Movie;

public interface MovieService {

	public void addMovie(Movie movie);
	
	public List<Movie> getAllMovies();

	public int getMaxId();

	public List<Movie> getFutureMovies();
	
	public Movie load(int id);
	
}
