package edu.nju.cineplex.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.nju.cineplex.dao.BaseDao;

@Repository
public class BaseDaoImpl implements BaseDao {

	@Autowired
	protected SessionFactory sessionFactory;
	
	@Override
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public Session getNewSession() {
		return sessionFactory.openSession();
	}

	@Override
	public void flush() {
		this.getSession().flush();
	}

	@Override
	public void clear() {
		this.getSession().clear();
	}

	@SuppressWarnings("rawtypes")
	@Override
	public Object load(Class c, int id) {
		Session session=this.getSession();
		
		return session.get(c, id);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public Object load(Class c, String id) {
		Session session=this.getSession();
		return session.get(c, id);
	}

	@Override
	public void update(Object o) {
		Session session=this.getNewSession();
		session.update(o);
		session.flush();
		session.clear();
		session.close();
	}

	@Override
	public void save(Object o) {
		Session session=this.getNewSession();
		session.save(o);
		session.flush();
		session.clear();
		session.close();
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List getAllList(Class c) {
		Session session=this.getSession();
		Criteria criteria=session.createCriteria(c);
		
		return criteria.list();
	}

	@SuppressWarnings("rawtypes")
	@Override
	public int getTotalCount(Class c) {
		Session session=this.getSession();
		Criteria criteria=session.createCriteria(c);
		criteria.setProjection(Projections.rowCount());
		String num=criteria.uniqueResult().toString();
		
		return Integer.parseInt(num);
	}

	@Override
	public void delete(Object o) {
		Session session =this.getNewSession();
		session.delete(o);
		session.flush();
		session.clear();
		session.close();
	}

	@SuppressWarnings("rawtypes")
	@Override
	public void delete(Class c, String id) {
		Object o=this.load(c, id);
		this.delete(o);

	}

	@SuppressWarnings("rawtypes")
	@Override
	public void delete(Class c, int id) {
		Object o=this.load(c, id);
		this.delete(o);

	}

	@Override
	public void merge(Object o) {
		Session session=this.getNewSession();
		session.merge(o);
		session.flush();
		session.clear();
		session.close();
		
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List findByColumn(Class c,String column, String value) {
		Session session=this.getSession();
		Criteria criteria=session.createCriteria(c);
		criteria.add(Restrictions.eq(column, value));
		return criteria.list();
	}

	@SuppressWarnings("rawtypes")
	@Override
	public Object findByUnique(Class c, String column, String value) {
		Session session=this.getSession();
		Criteria criteria=session.createCriteria(c);
		criteria.add(Restrictions.eq(column, value));
		return criteria.uniqueResult();
	}

}
