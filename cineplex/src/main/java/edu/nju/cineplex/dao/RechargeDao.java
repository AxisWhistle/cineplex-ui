package edu.nju.cineplex.dao;

import java.util.List;

import edu.nju.cineplex.model.Consume;
import edu.nju.cineplex.model.Discount;
import edu.nju.cineplex.model.Recharge;

public interface RechargeDao {
	
	public List<Recharge> getAllRecharges();
	
	/**
	 * 创建一条充值记录
	 * @param recharge
	 */
	public void save(Recharge recharge);

	public List<Recharge> loadByMember(int id);

	public Discount getDiscount(int i);

	public List<Consume> loadConsumeByMember(int id);

}
