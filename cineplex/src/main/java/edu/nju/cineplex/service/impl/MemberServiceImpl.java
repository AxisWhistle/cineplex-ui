package edu.nju.cineplex.service.impl;

import java.sql.Date;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.nju.cineplex.dao.MemberDao;
import edu.nju.cineplex.model.City;
import edu.nju.cineplex.model.Discount;
import edu.nju.cineplex.model.Member;
import edu.nju.cineplex.model.User;
import edu.nju.cineplex.service.MemberService;
import edu.nju.cineplex.util.MD5andKL;

@Service
public class MemberServiceImpl implements MemberService {

	public static final double PRICETOACTIVE = 200;
	@Autowired
	MemberDao memberDao;
	
	@Override
	public User register(Member member,String password) {
		//设置ID
		int id=memberDao.getMaxId()+1;
		String uid = String.format("%1$07d", id);
		member.setDisaccount(memberDao.getDefaultLevel());
		member.setRegister(new Date(Calendar.getInstance().getTimeInMillis()));
		User user=new User();
		user.setId(uid);
		user.setPassword(MD5andKL.KL(MD5andKL.MD5(password)));
		user.setGid('2');
		user.setMember(member);
		member.setUser(user);
		
		
		memberDao.save(member);
		return user;
	}

	@Override
	public boolean update(Member member) {
		memberDao.update(member);
		return true;
	}

	@Override
	public List<City> allCity() {
		return memberDao.allCity();
	}

	@Override
	public City loadCity(int city) {
		return memberDao.loadCity(city);
	}

	@Override
	public List<Discount> allDiscount() {
		// TODO Auto-generated method stub
		return memberDao.allDiscount();
	}

	@Override
	public List<Member> allMember() {
		// TODO Auto-generated method stub
		return memberDao.getAllMembers();
	}

	

}
