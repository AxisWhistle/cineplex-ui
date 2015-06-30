package edu.nju.cineplex.service.impl;

import java.sql.Date;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.nju.cineplex.dao.BankDao;
import edu.nju.cineplex.dao.BaseDao;
import edu.nju.cineplex.dao.MemberDao;
import edu.nju.cineplex.dao.RechargeDao;
import edu.nju.cineplex.dao.UserDao;
import edu.nju.cineplex.model.Bank;
import edu.nju.cineplex.model.Consume;
import edu.nju.cineplex.model.Discount;
import edu.nju.cineplex.model.Member;
import edu.nju.cineplex.model.Recharge;
import edu.nju.cineplex.service.RechargeService;
import edu.nju.cineplex.util.CreditStrategy;

@Service
public class RechargeServiceImpl implements RechargeService {
	

	@Autowired
	private RechargeDao rechargeDao;
	@Autowired
	private BankDao bankDao;
	@Autowired
	private UserDao userDao;
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private BaseDao baseDao;
	
	private String error;
	
	@Override
	public boolean recharge(String bankId, String password, String userId,
			double price) {
		// TODO Auto-generated method stub
		Bank bank=bankDao.load(bankId);
		if(bank==null){
			error="银行卡号错误";
			return false;
		}if(!password.equals(bank.getPassword())){
			error="密码错误";
			return false;
		}if(bank.getBalance()<price){
			error="银行卡余额不足";
			return false;
		}
		Member member=userDao.load(userId).getMember();
		bank.setBalance(bank.getBalance()-price);
		member.setBalance(member.getBalance()+price);
		member.setTotal(member.getTotal()+price);
		
		//TODO 激活会员资格
		Calendar now=Calendar.getInstance();
		if(price>=MemberServiceImpl.PRICETOACTIVE&&member.getState()==0){
			member.setState(1);
			member.setActive(new Date(now.getTimeInMillis()));
			member.setDisaccount(rechargeDao.getDiscount(2));
			
		}
		
		Recharge recharge=new Recharge();
		
		recharge.setBank(bank);
		recharge.setMember(member);
		recharge.setMoney(price);
		recharge.setDate(now);
		rechargeDao.save(recharge);
		return true;
	}

	
	@Override
	public String error() {

		return this.error;
	}

	@Override
	public List<Recharge> getUserRecharges(int id) {
		
		return rechargeDao.loadByMember(id);
	}


	@Override
	public List<Consume> getUserConsumes(int id) {
		// TODO Auto-generated method stub
		return rechargeDao.loadConsumeByMember(id);
	}


	@Override
	public boolean convert(String id, double parseDouble) {
		Member member=userDao.load(id).getMember();
		//int credit= member.getCredit();
		int credit=CreditStrategy.calConvert(parseDouble);
		if(credit<=member.getCredit()){
			member.setCredit(member.getCredit()-credit);
			member.setBalance(member.getBalance()+parseDouble);
			memberDao.merge(member);
			return true;
		}
		error="积分不足";
		return false;
	}


	@Override
	public boolean uplevel(String id, int level) {
		Member member=userDao.load(id).getMember();
		Discount dis=(Discount) baseDao.load(Discount.class, level);
		Discount be=member.getDisaccount();
		double money=dis.getCharge()-be.getCharge();
		if(member.getBalance()>=money){
			member.setBalance(member.getBalance()-money);
			member.setDisaccount(dis);
			
			int credit=CreditStrategy.calCredit(money);
			member.setCredit(credit);
			Consume consume=new Consume();
			consume.setCredit(credit);
			consume.setDate(Calendar.getInstance());
			consume.setMoney(money);
			consume.setInfo("会员升级到"+dis.getTitle());
			consume.setMember(member);
			member.addConsume(consume);
			memberDao.merge(member);
			
			return true;
		}
		
		error="会员卡余额不足";
		return false;
	}

	
}
