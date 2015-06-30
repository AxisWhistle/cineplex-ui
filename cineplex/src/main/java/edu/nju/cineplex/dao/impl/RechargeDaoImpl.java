package edu.nju.cineplex.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.nju.cineplex.dao.BaseDao;
import edu.nju.cineplex.dao.RechargeDao;
import edu.nju.cineplex.model.Consume;
import edu.nju.cineplex.model.Discount;
import edu.nju.cineplex.model.Member;
import edu.nju.cineplex.model.Recharge;

@Repository
public class RechargeDaoImpl implements RechargeDao {

	@Autowired
	private BaseDao baseDao;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Recharge> getAllRecharges() {
		return baseDao.getAllList(Recharge.class);
	}


	@Override
	public void save(Recharge recharge) {
		
		baseDao.merge(recharge.getBank());
		baseDao.merge(recharge.getMember());
		baseDao.save(recharge);

	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Recharge> loadByMember(int id) {
		Member member=(Member) baseDao.load(Member.class, id);
		Session session=baseDao.getSession();
		Criteria criteria=session.createCriteria(Recharge.class);
		criteria.add(Restrictions.eq("member", member));
		return criteria.list();
	}


	@Override
	public Discount getDiscount(int i) {
		
		return (Discount) baseDao.load(Discount.class, i);
	}


	@SuppressWarnings("unchecked")
	@Override
	public List<Consume> loadConsumeByMember(int id) {
		Member member=(Member) baseDao.load(Member.class, id);
		Session session=baseDao.getSession();
		Criteria criteria=session.createCriteria(Consume.class);
		criteria.add(Restrictions.eq("member", member));
		return criteria.list();
	}


}
