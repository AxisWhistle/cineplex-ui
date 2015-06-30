package edu.nju.cineplex.service;

import java.util.List;

import edu.nju.cineplex.model.Consume;
import edu.nju.cineplex.model.Recharge;

public interface RechargeService {

	public boolean recharge(String bankId,String password,String userId,double price);
	
	public String error();

	public List<Recharge> getUserRecharges(int id);

	public List<Consume> getUserConsumes(int id);

	public boolean convert(String id, double parseDouble);

	public boolean uplevel(String id, int level);

	
}
