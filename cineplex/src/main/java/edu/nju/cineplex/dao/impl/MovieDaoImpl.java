package edu.nju.cineplex.dao.impl;

import java.sql.Date;
import java.util.Calendar;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.nju.cineplex.dao.BaseDao;
import edu.nju.cineplex.dao.MovieDao;
import edu.nju.cineplex.model.Movie;

@Repository
public class MovieDaoImpl implements MovieDao {

	@Autowired
	private BaseDao baseDao;
	@Override
	public void save(Movie Movie) {
		baseDao.save(Movie);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Movie> getAllMovies() {
		
		return baseDao.getAllList(Movie.class);
	}

	@Override
	public void update(Movie Movie) {
		baseDao.update(Movie);

	}

	@Override
	public Movie load(int id) {
		
		return (Movie)baseDao.load(Movie.class, id);
	}

	@Override
	public int getMaxId() {
		Session session = baseDao.getSession();
		Criteria criteria=session.createCriteria(Movie.class);
		criteria.setProjection(Projections.projectionList().add(Projections.max("id" )));
		Object o=criteria.uniqueResult();
		if(o==null)
			return 0;
		return (int)o;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Movie> getMoviesOnAfter(Calendar instance) {
		Session session=baseDao.getSession();
		Criteria criteria=session.createCriteria(Movie.class);
		criteria.add(Restrictions.gt("offTime", instance));
		return criteria.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Movie> getMoviesOffAt(Calendar date) {
		Session session=baseDao.getSession();
		Criteria criteria=session.createCriteria(Movie.class);
		criteria.add(Restrictions.eq("offTime", date));
		return criteria.list();
	}

}
