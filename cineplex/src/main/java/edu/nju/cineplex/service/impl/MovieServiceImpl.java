package edu.nju.cineplex.service.impl;

import java.sql.Date;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.nju.cineplex.dao.MovieDao;
import edu.nju.cineplex.model.Movie;
import edu.nju.cineplex.service.MovieService;

@Service
public class MovieServiceImpl implements MovieService {

	@Autowired
	private MovieDao movieDao;
	@Override
	public void addMovie(Movie movie) {
		movieDao.save(movie);
	}

	@Override
	public List<Movie> getAllMovies() {
		
		return movieDao.getAllMovies();
	}

	@Override
	public int getMaxId() {
		
		return movieDao.getMaxId();
	}

	@Override
	public List<Movie> getFutureMovies() {
		Date date=new Date(Calendar.getInstance().getTimeInMillis());
		return movieDao.getMoviesOnAfter(date);
	}

	@Override
	public Movie load(int id) {
		// TODO Auto-generated method stub
		return movieDao.load(id);
	}

}
