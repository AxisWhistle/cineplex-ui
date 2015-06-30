package edu.nju.cineplex.service;

import java.util.List;

import edu.nju.cineplex.model.City;
import edu.nju.cineplex.model.Discount;
import edu.nju.cineplex.model.Member;
import edu.nju.cineplex.model.User;

public interface MemberService {


	public User register(Member member,String password);
	
	public boolean update(Member member);

	public List<City> allCity();

	public City loadCity(int city);

	public List<Discount> allDiscount();

	public List<Member> allMember();




	
}
