package edu.nju.cineplex.dao.impl;

import java.util.Calendar;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.nju.cineplex.dao.BaseDao;
import edu.nju.cineplex.dao.ScheduleDao;
import edu.nju.cineplex.model.Schedule;

@Repository
public class ScheduleDaoImpl implements ScheduleDao{

	@Autowired
	BaseDao baseDao;
	@Override
	public void save(Schedule schedule) {
		baseDao.save(schedule);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Schedule> getAllSchedules() {
		
		
		
		return baseDao.getAllList(Schedule.class);
	}

	@Override
	public void update(Schedule schedule) {
		baseDao.merge(schedule);
	}

	@Override
	public Schedule load(int id) {
		return (Schedule)baseDao.load(Schedule.class, id);
	}


	@SuppressWarnings("unchecked")
	@Override
	public List<Schedule> getColli(Schedule schedule) {
		Session session=baseDao.getSession();
		Criteria criteria=session.createCriteria(Schedule.class);
		criteria.add(Restrictions.and(Restrictions.eq("granted", 1),Restrictions.eq("hall",schedule.getHall()),
				Restrictions.not(Restrictions.or(Restrictions.ge("time", schedule.getEnd()),Restrictions.le("end", schedule.getTime())))));
		
		return criteria.list();
	}
	
	/**
	 * 返回上映时间晚于今天且结束放映的时间不超过计算出来的end
	 */

	@SuppressWarnings("unchecked")
	@Override
	public List<Schedule> availableSchedules(Calendar now, Calendar end) {
		Session session=baseDao.getSession();
		Criteria criteria=session.createCriteria(Schedule.class);
		if(end==null){
			criteria.add(Restrictions.and(Restrictions.eq("granted", 1),
					Restrictions.gt("time", now)));
		}else
			criteria.add(Restrictions.and(Restrictions.eq("granted", 1),Restrictions.le("end",end),
				Restrictions.gt("time", now)));
		return criteria.list();
	}

	@Override
	public void merge(Schedule schedule) {
		baseDao.merge(schedule);
		
	}

}
