package edu.nju.cineplex.dao;

import java.sql.Date;
import java.util.List;

import edu.nju.cineplex.model.City;
import edu.nju.cineplex.model.Consume;
import edu.nju.cineplex.model.Discount;
import edu.nju.cineplex.model.Member;

public interface MemberDao {

	public void save(Member member);
	
//	public Member findByName(String name);
	
	public List<Member> getAllMembers();
	
	public void update(Member Member); 
	
//	public Member load(int id);

	public int getMaxId();

	public List<City> allCity();

	public City loadCity(int city);

	public Discount getDefaultLevel();

	public List<Member> memberToCheck(Date date);

	public void merge(List<Member> members);

	public void saveConsume(Consume consume);

	public void merge(Member member);

	public List<Discount> allDiscount();


}
