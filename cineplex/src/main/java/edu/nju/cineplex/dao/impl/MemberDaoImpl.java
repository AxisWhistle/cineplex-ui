package edu.nju.cineplex.dao.impl;

import java.sql.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.nju.cineplex.dao.BaseDao;
import edu.nju.cineplex.dao.MemberDao;
import edu.nju.cineplex.model.City;
import edu.nju.cineplex.model.Consume;
import edu.nju.cineplex.model.Discount;
import edu.nju.cineplex.model.Member;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	private BaseDao baseDao;
	@Override
	public void save(Member member) {
		baseDao.save(member.getUser());
		//baseDao.save(member);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Member> getAllMembers() {
		// TODO Auto-generated method stub
		return baseDao.getAllList(Member.class);
	}

	@Override
	public void update(Member Member) {
		baseDao.update(Member);

	}

	@Override
	public int getMaxId() {
		Session session = baseDao.getSession();
		Criteria criteria=session.createCriteria(Member.class);
		criteria.setProjection(Projections.projectionList().add(Projections.max("id" )));
		Object o=criteria.uniqueResult();
		if(o==null)
			return 0;
		return (int)o;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<City> allCity() {
		
		return baseDao.getAllList(City.class);
	}

	@Override
	public City loadCity(int city) {
		// TODO Auto-generated method stub
		return (City) baseDao.load(City.class, city);
	}

	@Override
	public Discount getDefaultLevel() {
		
		return (Discount) baseDao.load(Discount.class, 1);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Member> memberToCheck(Date date) {
		Session session = baseDao.getSession();
		Criteria criteria = session.createCriteria(Member.class);
		//暂停或停止日期一样的
		criteria.add(Restrictions.or(Restrictions.eq("active", date),Restrictions.eq("resumn", date)));
		return criteria.list();
	}

	@Override
	public void merge(List<Member> members) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void saveConsume(Consume consume) {
		baseDao.save(consume);
		
	}

	@Override
	public void merge(Member member) {

		baseDao.merge(member);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Discount> allDiscount() {
		// TODO Auto-generated method stub
		return baseDao.getAllList(Discount.class);
	}


}
